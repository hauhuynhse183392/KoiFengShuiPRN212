using FengShuiKoi_BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public interface ICompatibilityCalculator
    {
        Task<double> CalculateCompatibility(KoiVariety selectedKoi, string shapeId, string direction, DateTime dateOfBirth, string gender);
        Task<double?> CalculateKoiScore(string koiType, string dob);
        Task<double?> CalculateShapeScore(string shapeId, string dob);
        Task<double?> CalculateDirectionScore(string direction, string dob, string gender);
        Task<string> GetElementByBirthYear(string dob);
        Task<string> CalculateLife_Palace(string YOB, string Gender);
    }
}
