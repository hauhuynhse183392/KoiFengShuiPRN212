using FengShuiKoi_BO;
using FengShuiKoi_Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for CreateKoiWPF.xaml
    /// </summary>
    public partial class CreateKoiWPF : Window
    {
        private readonly IKoiVarietyService _koiVarietyService;
        private readonly IElementService _elementService;
        private ObservableCollection<TypeColor> colors;
        private readonly IColorService colorService;
        public KoiVariety EditKoiVariety { get; set; } = null;
        public CreateKoiWPF()
        {
            InitializeComponent();
            _koiVarietyService = new KoiVarietyService();
            colors = new ObservableCollection<TypeColor>();
            _elementService = new ElementService();
            colorService = new ColorService();
            ListColors.ItemsSource = colors;
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await loadInit();
            await fillBox(EditKoiVariety);
            if (EditKoiVariety != null)
            {
                CreateKoiLabel.Content = "Cập nhật giống cá Koi";
            }
            else
            {
                CreateKoiLabel.Content = "Tạo mới giống cá Koi";
            }
        }
        private void btnAddColor_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(CmbColorId.Text.ToString()) || string.IsNullOrWhiteSpace(TxtPercentage.Text))
            {
                MessageBox.Show("Xin hãy nhập màu và tỉ trọng");
                return;
            }

            if (!double.TryParse(TxtPercentage.Text, out double percentage))
            {
                MessageBox.Show("Xin hãy nhập tỉ trọng của cá!!!.");
                return;
            }
            string selectedColorId = CmbColorId.Text.ToString();
            if (colors.Any(c => c.ColorId == selectedColorId))
            {
                MessageBox.Show("Màu này đã được thêm vào danh sách. Vui lòng chọn màu khác!");
                return;
            }
            colors.Add(new TypeColor { ColorId = CmbColorId.Text.ToString(), Percentage = percentage * 100 });
            CmbColorId.SelectedItem = null;
            TxtPercentage.Clear();
        }

        private void btnRemoveColor_Click(object sender, RoutedEventArgs e)
        {
            if (ListColors.SelectedItem is TypeColor selectedColor)
            {
                colors.Remove(selectedColor);
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        public async Task loadInit()
        {
            this.CmbElement.ItemsSource = await _elementService.GetElement();
            this.CmbElement.DisplayMemberPath = "ElementId";
            this.CmbElement.SelectedValuePath = "ElementId";
            this.CmbColorId.ItemsSource = await colorService.GetColors();
            this.CmbColorId.DisplayMemberPath = "ColorId";
            this.CmbColorId.SelectedValuePath = "ColorId";
        }

        private async Task fillBox(KoiVariety koi)
        {
            if (koi == null)
            {
                return;
            }
            TxtKoiType.Text = koi.KoiType;
            TxtKoiType.IsEnabled = false;
            TxtImage.Text = koi.Image;
            TxtDescription.Text = koi.Description;
            CmbElement.SelectedValue = koi.Element;

            colors.Clear();

            foreach (var color in koi.TypeColors)
            {
                colors.Add(new TypeColor
                {
                    ColorId = color.ColorId,
                    Percentage = color.Percentage * 100,
                });
            }
        }

        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            var success = false;
            if (string.IsNullOrWhiteSpace(TxtKoiType.Text))
            {
                MessageBox.Show("Vui lòng nhập loại cá Koi!");
                return;
            }
            if (string.IsNullOrWhiteSpace(TxtImage.Text) || string.IsNullOrWhiteSpace(TxtDescription.Text) || CmbElement.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin");
                return;
            }
            double totalPercentage = colors.Sum(c => c.Percentage);
            if (Math.Abs(totalPercentage - 100) > 0.01) // Allow for small floating-point errors
            {
                MessageBox.Show($"Tổng phần trăm màu sắc phải bằng 100%. Hiện tại: {totalPercentage}%");
                return;
            }
            var koiVariety = new KoiVariety
            {
                KoiType = TxtKoiType.Text,
                Image = TxtImage.Text,
                Description = TxtDescription.Text,
                Element = CmbElement.Text.ToString() // Thay thế bằng logic xác định element thực tế
            };

            var typeColors = colors.Select(c => new TypeColor
            {
                KoiType = koiVariety.KoiType,
                ColorId = c.ColorId,
                Percentage = c.Percentage / 100 // Chuyển đổi lại thành phân số
            }).ToList();
            if (EditKoiVariety == null)
            {
                success = await _koiVarietyService.AddKoiVariety(koiVariety, typeColors);
            }
            else
            {
                success = await _koiVarietyService.UpdateKoiVariety(koiVariety, typeColors);
            }
            if (success)
            {
                MessageBox.Show(EditKoiVariety == null ? "Thêm cá Koi thành công!" : "Cập nhật cá Koi thành công");
                this.Close();
            }
            else
            {
                MessageBox.Show(EditKoiVariety == null ? "Thêm cá Koi thất bại." : "Cập nhật cá Koi thất bại");
            }
        }
    }
}
