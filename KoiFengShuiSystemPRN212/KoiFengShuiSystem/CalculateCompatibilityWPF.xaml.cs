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
    /// Interaction logic for CalculateCompatibilityWPF.xaml
    /// </summary>
    public partial class CalculateCompatibilityWPF : Window
    {
        private string _selectedShapeId;
        private readonly StringBuilder fullComment = new StringBuilder();
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
        public CalculateCompatibilityWPF()
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
            ElementFilter.SelectedItem = null ;
            ColorFilter.SelectedItem = null;
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
                fullComment.Clear();
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
                fullComment.AppendLine(GetCompatibilityComment(compatibility));

                string yearOfBirth = BirthDatePicker.SelectedDate.Value.ToString("yyyy-MM-dd");
                string element = await _compatibilityCalculator.GetElementByBirthYear(yearOfBirth);
                string Life_Palace = await _compatibilityCalculator.CalculateLife_Palace(yearOfBirth, gender);
                if(selectedShape != null)
                {
                    double? shapePoint = await _compatibilityCalculator.CalculateShapeScore(selectedShape, yearOfBirth);
                    string shapcomment = GetShapeCompatibilityComment(element, shapePoint);
                    if (!string.IsNullOrEmpty(shapcomment))
                    {
                        fullComment.Append(shapcomment);
                    }
                }
                if (selectedDirection != null)
                {
                    double? directionPoint = await _compatibilityCalculator.CalculateDirectionScore(selectedDirection, yearOfBirth, gender);
                    string directioncomment = GetDirectionCompatibilityComment(Life_Palace, directionPoint);
                    if (!string.IsNullOrEmpty(directioncomment))
                    {
                        fullComment.Append(directioncomment);
                    }
                }
                if(selectedKoi != null)
                {
                    double? KoiPoint = await _compatibilityCalculator.CalculateKoiScore(selectedKoi.KoiType, yearOfBirth);
                    string Koicomment = GetFishCompatibilityComment(element, KoiPoint);
                    if (!string.IsNullOrEmpty(Koicomment))
                    {
                        fullComment.Append(Koicomment);
                    }
                }
                ResultsSection.Visibility = Visibility.Visible;
                CompatibilityScore.Text = $"Độ tương thích: {compatibility}%";
                CompatibilityComment.Text = fullComment.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi: {ex.Message}", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private string GetCompatibilityComment(double score)
        {
            if (score >= 75)
                return "Độ tương thích rất tốt với gia chủ, sẽ mang lại may mắn và tài lộc cho gia chủ.";
            else if (score >= 50)
                return "Độ tương thích tương đối thích hợp với gia chủ.";
            else if (score >= 25)
                return "Độ tương thích không quá tốt, gia chủ nên cân nhắc.";
            else
                return "Độ tương thích quá thấp không phù hợp với gia chủ.";
        }
        private string GetShapeCompatibilityComment(string userElement, double? shapePoint)
        {
            if (shapePoint > 75) return "";

            string comment = "\n";
            switch (userElement)
            {
                case "Kim":
                    comment += "- Với gia chủ mang mệnh Kim, hình vuông là sự lựa chọn lý tưởng, vì nó tương sinh với Thổ, tạo ra sự ổn định và bền vững. Hình tròn cũng là hình dáng tương hợp với mệnh Kim, mang lại sự hài hòa và sự phát triển. Tuy nhiên, gia chủ nên tránh hình tam giác và hình chữ nhật, vì chúng tương khắc với mệnh Kim, có thể gây ra sự bất ổn trong vận khí.";
                    break;
                case "Mộc":
                    comment += "- Với gia chủ mang mệnh Mộc, hình chữ nhật là sự lựa chọn phù hợp nhất, vì nó tương hợp với Mộc và thúc đẩy sự phát triển. Hình lượn sóng tượng trưng cho yếu tố Thủy, giúp tăng cường sinh khí cho Mộc nhưng gia chủ nên tránh hình tròn và hình vuông, vì chúng tương khắc với mệnh Mộc, có thể làm giảm năng lượng và sự phát triển.";
                    break;
                case "Thủy":
                    comment += "- Với gia chủ mang mệnh Thủy, hình tròn là lựa chọn tốt nhất, vì nó tương sinh với Kim, mang lại sự giàu có và thịnh vượng. Hình lượn sóng cũng tương hợp với Thủy, giúp duy trì sự tươi mới và dòng chảy năng lượng. Tuy nhiên, nên tránh hình vuông và hình tam giác, vì chúng tương khắc với mệnh Thủy, có thể gây rối loạn trong vận khí.";
                    break;
                case "Hỏa":
                    comment += "- Với gia chủ mang mệnh Hỏa, hình chữ nhật là hình dáng phù hợp nhất, vì nó tương sinh với Mộc, thúc đẩy sự phát triển và năng lượng. Hình tam giác là tương hợp, mang lại sức mạnh và sự quyết tâm nhưng gia chủ cần tránh hình lượn sóng và hình tròn, vì chúng tương khắc với mệnh Hỏa, có thể gây cản trở trong sự phát triển.";
                    break;
                case "Thổ":
                    comment += "- Với gia chủ mang mệnh Thổ, hình vuông là hình dáng lý tưởng, vì nó tương hợp với Thổ, giúp mang lại sự ổn định và bền vững. Hình tam giác tương sinh với Hỏa, mang lại năng lượng tích cực. Tuy nhiên, cần tránh hình lượn sóng và hình chữ nhật, vì chúng tương khắc với mệnh Thổ, có thể gây ra sự bất ổn trong vận khí.";
                    break;
            }
            return comment;
        }
        private string GetDirectionCompatibilityComment(string userLifePalace, double? directionPoint)
        {
            if (directionPoint > 75) return "";

            string comment = "\n";
            switch (userLifePalace)
            {
                case "Càn":
                    comment += "- Về hướng, gia chủ có thể lựa chọn Hướng Tây hoặc Đông Bắc. Hướng Tây sẽ giúp thu hút tài lộc và sự thịnh vượng, trong khi Hướng Đông Bắc lại tạo điều kiện cho sự phát triển bền vững và ổn định trong cuộc sống. Nếu có thể, hãy bố trí không gian sống sao cho luôn nhận được ánh sáng tự nhiên từ những hướng này.";
                    break;
                case "Đoài":
                    comment +=
                      "- Hướng Tây Nam và Tây Bắc là những hướng lý tưởng cho gia chủ. Hướng Tây Nam giúp mang lại sự hòa hợp và tình cảm trong gia đình, trong khi Hướng Tây Bắc lại tạo điều kiện thuận lợi cho sự nghiệp và thành công cá nhân. Đừng quên bố trí các vật dụng phong thủy ở những hướng này để tối ưu hóa nguồn năng lượng tích cực.";
                    break;
                case "Cấn":
                    comment +=
                      "- Gia chủ có thể lựa chọn hướng Tây Nam và Tây Bắc là những hướng lý tưởng cho gia chủ. Hướng Tây Nam giúp mang lại sự hòa hợp và tình cảm trong gia đình, trong khi Hướng Tây Bắc lại tạo điều kiện thuận lợi cho sự nghiệp và thành công cá nhân. Hãy thử đặt bàn làm việc của bạn ở những vị trí này để cảm nhận sự khác biệt.";
                    break;
                case "Khôn":
                    comment +=
                      "- Hướng Tây và Đông Bắc sẽ là những lựa chọn tốt nhất cho gia chủ. Hướng Tây sẽ mang lại sự thuận lợi trong công việc và tài chính, trong khi Hướng Đông Bắc giúp tạo dựng mối quan hệ tốt đẹp và tăng cường sức khỏe. Đừng quên tạo một không gian thoải mái và yên tĩnh để thư giãn.";
                    break;
                case "Ly":
                    comment +=
                      "- Gia chủ nên chọn Hướng Đông hoặc Đông Nam. Hướng Đông không chỉ giúp gia tăng năng lượng mà còn mang lại sự khởi đầu mới trong công việc, trong khi Hướng Đông Nam giúp cải thiện tài chính và tình cảm. Cố gắng tạo không gian xanh và thoáng đãng để cảm nhận sự thư giãn.";
                    break;
                case "Khảm":
                    comment +=
                      "- Hướng Đông Nam và Đông sẽ mang lại nhiều điều tốt đẹp cho gia chủ. Hướng Đông Nam không chỉ giúp tăng cường sức khỏe mà còn thúc đẩy sự nghiệp phát triển, trong khi Hướng Đông giúp tạo ra không gian sáng tạo và đổi mới. Hãy chú ý đến ánh sáng và màu sắc trong không gian sống.";
                    break;
                case "Tốn":
                    comment +=
                      "- Gia chủ có thể chọn Hướng Bắc hoặc Nam. Hướng Bắc giúp gia tăng sự nghiệp và tài chính, trong khi Hướng Nam mang lại sự phát triển cá nhân và gia đình. Hãy thử bố trí các vật phẩm phong thủy để tối ưu hóa năng lượng ở những hướng này.";
                    break;
                case "Chấn":
                    comment +=
                      "- Hướng Nam và Bắc sẽ mang lại năng lượng tích cực cho gia chủ. Hướng Nam không chỉ thu hút sự giàu có mà còn mang lại hạnh phúc trong gia đình, trong khi Hướng Bắc giúp thúc đẩy sự nghiệp. Hãy chú ý đến việc bày trí và sắp xếp không gian sống để tối ưu hóa năng lượng từ các hướng này.";
                    break;
            }
            return comment;
        }
        private string GetFishCompatibilityComment(string userElement, double? fishPoint)
        {
            if (fishPoint > 60) return "";

            string comment = "\n";
            switch (userElement)
            {
                case "Mộc":
                    comment += "- Với gia chủ mang mệnh Mộc, việc chọn những chú cá Koi phù hợp về màu sắc không chỉ giúp gia tăng vận khí mà còn góp phần quan trọng vào sự hài hòa, phát triển của người nuôi. Những màu sắc như xanh dương, đen, xanh đen và xanh lá cây đặc biệt phù hợp với mệnh Mộc, vì màu xanh dương, đen, xanh đen trong phong thủy đại diện cho yếu tố Thủy, mà theo quy luật ngũ hành, Thủy sinh Mộc, giúp thúc đẩy sự sinh sôi nảy nở và mang lại sự thịnh vượng.";
                    break;
                case "Thủy":
                    comment += "- Với gia chủ mang mệnh Thủy, việc lựa chọn những chú cá Koi có màu sắc tương hợp không chỉ giúp tăng cường vận may mà còn mang lại sự bình an, tài lộc. Các màu như xanh dương, trắng bạc, đen và xanh đen đặc biệt phù hợp với mệnh Thủy, bởi màu xanh dương đại diện cho chính bản mệnh Thủy, giúp gia tăng sự thịnh vượng. Màu trắng bạc tượng trưng cho yếu tố Kim, mà trong ngũ hành Kim sinh Thủy, giúp gia chủ thu hút được nhiều vận may và tài lộc.";
                    break;
                case "Hỏa":
                    comment += "- Với gia chủ mang mệnh Hỏa, việc chọn cá Koi có màu sắc phù hợp sẽ giúp kích thích năng lượng tích cực, thúc đẩy sự may mắn và thành công. Các màu như đỏ, cam, hồng và tím là lựa chọn tuyệt vời cho mệnh Hỏa, bởi chúng tượng trưng cho ngọn lửa, sức mạnh và sự quyết tâm. Đặc biệt, việc kết hợp với những chú cá Koi có màu xanh lá cây hoặc xanh lục nhạt cũng rất có lợi cho người mệnh Hỏa. Màu xanh lá cây đại diện cho yếu tố Mộc, giúp gia tăng sức mạnh và hỗ trợ sự phát triển. Sự kết hợp này không chỉ tạo ra sự hài hòa mà còn kích thích năng lượng tích cực, giúp gia chủ đạt được thành công trong mọi lĩnh vực.";
                    break;
                case "Thổ":
                    comment += "- Với gia chủ mang mệnh Thổ, việc chọn cá Koi phù hợp về màu sắc sẽ giúp ổn định vận khí và mang lại thịnh vượng lâu dài. Các màu như vàng, nâu, cam nhạt là những lựa chọn tốt cho mệnh Thổ, vì chúng đại diện cho đất, sự vững chắc và bền bỉ. Những màu sắc này giúp tăng cường yếu tố Thổ, mang lại sự ổn định, bền vững và giúp gia chủ cảm thấy an toàn trong cuộc sống. Đặc biệt, việc kết hợp với các màu sắc như đỏ hoặc cam từ mệnh Hỏa cũng rất có lợi, vì Hỏa sinh Thổ, thúc đẩy sự phát triển và mang lại nguồn năng lượng tích cực. Sự kết hợp này sẽ tạo ra sự hài hòa và hỗ trợ gia chủ trong việc đạt được thành công trong cuộc sống.";
                    break;
                case "Kim":
                    comment += "- Với gia chủ mang mệnh Kim, việc chọn cá Koi có màu trắng, bạc và vàng không chỉ làm tăng vận khí mà còn mang lại sự thịnh vượng và phát triển trong cuộc sống. Màu trắng là màu bản mệnh của Kim, đại diện cho sự tinh khiết và thanh thoát, trong khi màu bạc và vàng thể hiện sự giàu có và thành công. Bên cạnh đó, việc lựa chọn những chú cá Koi có màu vàng hoặc nâu từ mệnh Thổ cũng rất hữu ích, vì Thổ sinh Kim, giúp gia tăng tài lộc và sự thịnh vượng cho gia chủ. Sự kết hợp này sẽ tạo ra nguồn năng lượng tốt, giúp gia chủ mệnh Kim dễ dàng đạt được mục tiêu.";
                    break;
            }
            return comment;
        }
        private async void CalculateElement_Click(object sender, RoutedEventArgs e)
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
            var yearOfBirth = BirthDatePicker.SelectedDate.Value.ToString("yyyy-MM-dd");
            string gender = MaleRadio.IsChecked == true ? "Male" : "Female";
            string element = await _compatibilityCalculator.GetElementByBirthYear(yearOfBirth);
            string Life_Palace = await _compatibilityCalculator.CalculateLife_Palace(yearOfBirth, gender);

            txtElementResult.Text = $"Mệnh của bạn là: {element}, Cung mệnh của bạn là: {Life_Palace}";
        }
    }
}
