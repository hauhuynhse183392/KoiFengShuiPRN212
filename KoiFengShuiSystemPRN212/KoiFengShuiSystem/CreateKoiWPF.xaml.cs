using FengShuiKoi_BO;
using FengShuiKoi_DAO;
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
        public CreateKoiWPF()
        {
            InitializeComponent();
            _koiVarietyService = new KoiVarietyService();
            colors = new ObservableCollection<TypeColor>();
            _elementService = new ElementService();
            ListColors.ItemsSource = colors;
        }




        //private async Task btnSave_ClickAsync(object sender, RoutedEventArgs e)
        //{
        //    //CandidateProfile candidate = new CandidateProfile();
        //    //candidate.CandidateId = txtCandidateID.Text;
        //    //candidate.Fullname = txtFullName.Text;
        //    //candidate.ProfileUrl = txtProfileURL.Text;
        //    //candidate.Birthday = DateTime.Parse(txtBirthday.Text);
        //    //candidate.ProfileShortDescription = txtDescription.Text;
        //    //candidate.PostingId = cmbPostingID.SelectedValue.ToString();
        //    //if (_candidateProfileService.AddCandidateProfile(candidate))
        //    //{
        //    //    MessageBox.Show("Add successfull");
        //    //    loadDataInit();
        //    //}
        //    //else
        //    //{
        //    //    MessageBox.Show("Add unsuccessfull !!!!");
        //    //}
            
        //}

        private void btnAddColor_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TxtColorId.Text) || string.IsNullOrWhiteSpace(TxtPercentage.Text))
            {
                MessageBox.Show("Please enter both Color ID and Percentage.");
                return;
            }

            if (!double.TryParse(TxtPercentage.Text, out double percentage))
            {
                MessageBox.Show("Please enter a valid percentage.");
                return;
            }

            colors.Add(new TypeColor { ColorId = TxtColorId.Text, Percentage = percentage * 100 });
            TxtColorId.Clear();
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
            this.CmbElement.DisplayMemberPath = "ElementID";
            this.CmbElement.SelectedValuePath = "ElementID";
        }
        private void CmbElement_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {


        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await loadInit();
        }


        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TxtKoiType.Text))
            {
                MessageBox.Show("Vui lòng nhập loại cá Koi!");
                return;
            }

            double totalPercentage = colors.Sum(c => c.Percentage);
            if (Math.Abs(totalPercentage - 1) > 0.01) // Allow for small floating-point errors
            {
                MessageBox.Show($"Tổng phần trăm màu sắc phải bằng 100%. Hiện tại: {totalPercentage}%");
                return;
            }
            var koiVariety = new KoiVariety
            {
                KoiType = TxtKoiType.Text,
                Image = TxtImage.Text,
                Description = TxtDescription.Text,
                Element = "Thủy" // Thay thế bằng logic xác định element thực tế
            };

            var typeColors = colors.Select(c => new TypeColor
            {
                KoiType = koiVariety.KoiType,
                ColorId = c.ColorId,
                Percentage = c.Percentage / 100 // Chuyển đổi lại thành phân số
            }).ToList();

            var success = await _koiVarietyService.AddKoiVariety(koiVariety, typeColors);
            if (success)
            {
                MessageBox.Show("Thêm cá Koi thành công!");
                this.Close();
            }
            else
            {
                MessageBox.Show("Thêm cá Koi thất bại.");
            }
        }
    }
}
