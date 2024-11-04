using FengShuiKoi_BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public class CompatibilityCalculator : ICompatibilityCalculator
    {
        private readonly IElementService _elementService;
        private readonly LunarCalendarConverter _lunarCalendarConverter;
        private readonly ILifePlaceService _lifePlaceService;
        private readonly IKoiVarietyService _koiVarietyService;
        private readonly IElementColorService _elementColorService;
        private readonly ITypeColorService _typeColorService;
        private readonly IPointOfShapeService _pointOfShapeService;
        private readonly ILifePlaceDirectionService _lifePlaceDirectionService;

        public CompatibilityCalculator(
            IElementService elementService,
            LunarCalendarConverter lunarCalendarConverter,
            ILifePlaceService lifePlaceService,
            IKoiVarietyService koiVarietyService,
            IElementColorService elementColorService,
            ITypeColorService typeColorService,
            IPointOfShapeService pointOfShapeService,
            ILifePlaceDirectionService lifePlaceDirectionService)
        {
            _elementService = elementService;
            _lunarCalendarConverter = lunarCalendarConverter;
            _lifePlaceService = lifePlaceService;
            _koiVarietyService = koiVarietyService;
            _elementColorService = elementColorService;
            _typeColorService = typeColorService;
            _pointOfShapeService = pointOfShapeService;
            _lifePlaceDirectionService = lifePlaceDirectionService;
        }

        public async Task<double> CalculateCompatibility(KoiVariety selectedKoi,string shapeId,string direction,DateTime dateOfBirth,string gender)
        {
            string dob = dateOfBirth.ToString("yyyy-MM-dd");
            double s1 = 0, s2 = 0, s3 = 0;
            bool hasS1 = false, hasS2 = false, hasS3 = false;

            if (selectedKoi != null)
            {
                var koiScore = await CalculateKoiScore(selectedKoi.KoiType, dob);
                if (koiScore.HasValue)
                {
                    s1 = koiScore.Value;
                    hasS1 = true;
                }
            }

            if (!string.IsNullOrEmpty(shapeId))
            {
                var shapeScore = await CalculateShapeScore(shapeId, dob);
                if (shapeScore.HasValue)
                {
                    s2 = shapeScore.Value;
                    hasS2 = true;
                }
            }

            if (!string.IsNullOrEmpty(direction))
            {
                var directionScore = await CalculateDirectionScore(direction, dob, gender);
                if (directionScore.HasValue)
                {
                    s3 = directionScore.Value;
                    hasS3 = true;
                }
            }

            double compatibility;
            if (hasS1 && hasS2 && hasS3)
                compatibility = (0.5 * s1 + 0.2 * s2 + 0.3 * s3);
            else if (hasS1 && hasS3)
                compatibility = (0.6 * s1 + 0.4 * s3);
            else if (hasS1 && hasS2)
                compatibility = (0.7 * s1 + 0.3 * s2);
            else if (hasS2 && hasS3)
                compatibility = (0.4 * s2 + 0.6 * s3);
            else if (hasS1)
                compatibility = s1;
            else if (hasS2)
                compatibility = s2;
            else if (hasS3)
                compatibility = s3;
            else
                compatibility = 0;

            return Math.Round(compatibility, 2);
        }

        public async Task<double?> CalculateKoiScore(string koiType, string dob)
        {
            int year = int.Parse(dob.Substring(0, 4));
            string element = _elementService.GetElementByBirthYear(year);
            var koiColors = await _typeColorService.GetColorsAndPercentages(koiType);
            double totalScore = 0;

            foreach (var color in koiColors)
            {
                var pointForColor = await _elementColorService.GetPointElementColor(element, color.ColorId);
                totalScore += pointForColor * color.Percentage;
            }
            return totalScore * 100;
        }

        public async Task<double?> CalculateShapeScore(string shapeId, string dob)
        {
            int year = int.Parse(dob.Substring(0, 4));
            string element = _elementService.GetElementByBirthYear(year);
            var shape = await _pointOfShapeService.GetPointOfShape(element, shapeId);
            return shape?.Point * 100;
        }

        public async Task<double?> CalculateDirectionScore(string direction, string dob, string gender)
        {
            int[] lunarDate = LunarCalendarConverter.ConvertSolarToLunar(dob, 7);
            if (lunarDate == null) return null;

            int lunarYear = lunarDate[2];
            string lifePlace = _lifePlaceService.CalculateFate(lunarYear, gender);
            var point = await _lifePlaceDirectionService.GetLifePlaceDirectionById(lifePlace, direction);
            return point.PointOfDirection * 100;
        }
    }
}
