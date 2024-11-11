using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using FengShuiKoi_Services;
using FengShuiKoi_BO;
using System.Diagnostics;

namespace KoiFengShuiSystem
{
    /// <summary>
    /// Interaction logic for ConslutingWPF.xaml
    /// </summary>
    public partial class ConslutingWPF : Window
    {
        private IElementService elementService;
        private ILifePlaceService lifePlaceService;
        private IKoiVarietyService koiVarietyService;
        private IShapeService shapeService;
        private IPointOfShapeService pointOfShapeService;
        private IDirectionService directionService;
        private ILifePlaceDirectionService lifePlaceDirectionService;
        private IQuantityOfFishService quantityOfFishService;


        public ConslutingWPF()
        {
            InitializeComponent();
            elementService = new ElementService();
            lifePlaceService = new LifePlaceService();
            koiVarietyService = new KoiVarietyService();
            shapeService = new ShapeService();
            pointOfShapeService = new PointOfShapeService();
            directionService = new DirectionService();
            lifePlaceDirectionService = new LifePlaceDirectionService();
            quantityOfFishService = new QuantityOfFishService();

        }

        private async void calculateButton_Click(object sender, RoutedEventArgs e)
        {
            if (birthDatePicker.SelectedDate == null || genderComboBox.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn đầy đủ ngày sinh và giới tính!");
                return;
            }

            DateTime birthDate = birthDatePicker.SelectedDate.Value;
            string gender = (genderComboBox.SelectedItem as ComboBoxItem).Content.ToString();
            int[] lunar = LunarCalendarConverter.ConvertSolarToLunar(birthDate.ToString("yyyy-MM-dd"), 7);
            string element = elementService.GetElementByBirthYear(birthDate.Year);
            if (gender.Equals("Nam"))
                gender = "Male";
            string lifePalace = lifePlaceService.CalculateFate(lunar[2], gender);


            resultTextBlock.Text = $"Sinh mệnh: {element}\nCung mệnh: {lifePalace}";

            // Lấy danh sách cá phù hợp
            List<KoiVariety> suitableKoi = await koiVarietyService.GetKoiVarietiesByElemnet(element);
            Debug.WriteLine($"Số lượng cá phù hợp: {suitableKoi?.Count ?? 0}");
            koiDataGrid.ItemsSource = suitableKoi;

            List<FengShuiKoi_BO.Shape> suitablePonds = new List<FengShuiKoi_BO.Shape>();
            foreach (var item in await pointOfShapeService.GetGoodShapeByElemnet(element))
            {
                if (item.Point >= 0.75)
                    suitablePonds.Add(await shapeService.GetShapeById(item.ShapeId));
            }
            // Lấy danh sách hồ phù hợp


            pondDataGrid.ItemsSource = suitablePonds;

            // Lấy hướng phù hợp
            List<string> suitableDirections = new List<string>();
            List<LifePalaceDirection> list2 = await lifePlaceDirectionService.GetLifePlaceDirections();
            foreach (var item in list2)
            {
                if (item.PointOfDirection == 1 && item.LifePalaceId == lifePalace)
                    suitableDirections.Add(item.DirectionId);
            }

            suitableDirectionsTextBlock.Text = string.Join(", ", suitableDirections);

            if ((suitableKoi == null || !suitableKoi.Any()) && (suitablePonds == null || !suitablePonds.Any()))
            {
                MessageBox.Show("Không tìm thấy cá hoặc hồ phù hợp.");
            }
            QuantityOfFish quantity = await quantityOfFishService.getQuantityByElement(element);
            suitableQuantityTextBlock.Text = quantity.Description;
        }

      
    }
}
