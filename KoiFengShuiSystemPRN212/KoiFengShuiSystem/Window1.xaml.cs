using FengShuiKoi_BO;
using FengShuiKoi_Services;
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

namespace KoiFengShuiSystem
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        private string _selectedShapeId;
        private readonly IElementService _elementService;
        private readonly LunarCalendarConverter _lunarCalendarConverter;
        private readonly ILifePlaceService _lifePlaceService;
        private readonly IKoiVarietyService _koiVarietyService;
        private readonly IElementColorService _elementColorService;
        private readonly ITypeColorService _typeColorService;
        private readonly IPointOfShapeService _pointOfShapeService;
        private readonly ILifePlaceDirectionService _lifePlaceDirectionService;
        private readonly IColorService _colorService;
        private readonly IShapeService _shapeService;
        private readonly IDirectionService _directionService;
        private readonly ICompatibilityCalculator _compatibilityCalculator;
        public Window1()
        {
            InitializeComponent();
            _elementService = new ElementService();
            _lifePlaceDirectionService = new LifePlaceDirectionService();
            _elementColorService = new ElementColorService();
            _lunarCalendarConverter = new LunarCalendarConverter();
            _typeColorService = new TypeColorService();
            _pointOfShapeService = new PointOfShapeService();
            _koiVarietyService = new KoiVarietyService();
            _lifePlaceService = new LifePlaceService();
            _colorService = new ColorService();
            _shapeService = new ShapeService();
            _directionService = new DirectionService();
            _compatibilityCalculator = new CompatibilityCalculator(new ElementService(),
                                                                    new LunarCalendarConverter(),
                                                                    new LifePlaceService(),
                                                                    new KoiVarietyService(),
                                                                    new ElementColorService(),
                                                                    new TypeColorService(),
                                                                    new PointOfShapeService(),
                                                                    new LifePlaceDirectionService());
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            loadDataInit();
        }
        private async void loadDataInit()
        {
            List<KoiVariety> Koi = await _koiVarietyService.GetKoiVarieties();
            // Gán nguồn dữ liệu cho DataGrid
            this.FishListView.ItemsSource = Koi;

            this.ElementFilter.ItemsSource = await _elementService.GetElement();
            this.ElementFilter.DisplayMemberPath = "ElementId";
            this.ElementFilter.SelectedValuePath = "ElementId";

            this.ColorFilter.ItemsSource = await _colorService.GetColors();
            this.ColorFilter.DisplayMemberPath = "ColorId";
            this.ColorFilter.SelectedValuePath = "ColorId";

            this.PondShapeList.ItemsSource = await _shapeService.GetShapes();

            this.DirectionComboBox.ItemsSource = await _directionService.GetDirections();
            this.DirectionComboBox.DisplayMemberPath = "DirectionId";
            this.DirectionComboBox.SelectedValuePath = "DirectionId";

            ElementFilter.SelectedIndex = -1;
            ColorFilter.SelectedIndex = -1;
            DirectionComboBox.SelectedIndex = -1;
            SearchBox.Text = string.Empty;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Reset(object sender, RoutedEventArgs e)
        {
            FishListView.SelectedItem = null;

            // Bỏ chọn RadioButton trong PondShapeList
            foreach (var item in PondShapeList.Items)
            {
                var container = PondShapeList.ItemContainerGenerator.ContainerFromItem(item) as ContentPresenter;
                if (container != null)
                {
                    var radioButton = VisualTreeHelper.GetChild(container, 0) as RadioButton;
                    if (radioButton != null)
                    {
                        radioButton.IsChecked = false;
                    }
                }
            }

            // Reset ComboBox Direction
            DirectionComboBox.SelectedItem = null;

            // Reset các biến lưu trữ selection
            _selectedShapeId = null;

            // Ẩn kết quả nếu đang hiển thị
            ResultsSection.Visibility = Visibility.Collapsed;
        }

        private async void btn_Search(object sender, RoutedEventArgs e)
        {
            try
            {
                string? selectedElement = ElementFilter.SelectedValue?.ToString();
                string? searchKoiType = SearchBox.Text;
                string? selectedColorId = ColorFilter.SelectedValue?.ToString();

                var koilist = await _koiVarietyService.SearchKoiVarietiesByElementOrTypeOrColorId(selectedElement, searchKoiType, selectedColorId);

                this.FishListView.ItemsSource = koilist;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi khi tìm kiếm: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void PondShape_Checked(object sender, RoutedEventArgs e)
        {
            if (sender is RadioButton radioButton && radioButton.DataContext != null)
            {
                dynamic shape = radioButton.DataContext;
                _selectedShapeId = shape.ShapeId;
            }
        }

        private async void CalculateButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!BirthDatePicker.SelectedDate.HasValue)
                {
                    MessageBox.Show("Vui lòng chọn ngày sinh!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    BirthDatePicker.Focus();
                    return;
                }

                if (!MaleRadio.IsChecked == true && !FemaleRadio.IsChecked == true)
                {
                    MessageBox.Show("Vui lòng chọn giới tính!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                var selectedKoi = FishListView.SelectedItem as KoiVariety;
                var selectedShape = _selectedShapeId;
                var selectedDirection = DirectionComboBox.SelectedValue?.ToString();
                var dateOfBirth = BirthDatePicker.SelectedDate.Value;
                var gender = MaleRadio.IsChecked == true ? "Male" : "Female";

                double compatibility = await _compatibilityCalculator.CalculateCompatibility(
                    selectedKoi,
                    selectedShape,
                    selectedDirection,
                    dateOfBirth,
                    gender
                );

                ResultsSection.Visibility = Visibility.Visible;
                CompatibilityScore.Text = $"Độ tương thích: {compatibility}%";
                CompatibilityComment.Text = GetCompatibilityComment(compatibility);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private string GetCompatibilityComment(double score)
        {
            if (score >= 80)
                return "Rất tương hợp! Đây là sự kết hợp hoàn hảo.";
            else if (score >= 60)
                return "Khá tương hợp. Đây là một lựa chọn tốt.";
            else if (score >= 40)
                return "Tương hợp trung bình. Bạn có thể cân nhắc các lựa chọn khác.";
            else
                return "Độ tương hợp thấp. Khuyến nghị xem xét các lựa chọn khác phù hợp hơn.";
        }
    }
}
