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
	/// Interaction logic for KoiFishManageWPF.xaml
	/// </summary>
	public partial class KoiFishManageWPF : Window
	{
        private readonly IKoiVarietyService _koiVarietyService;
        public KoiFishManageWPF()
		{
			InitializeComponent();
            _koiVarietyService = new KoiVarietyService();
        }
        public async Task loadInit()
        {
            List<KoiVariety> koi = await _koiVarietyService.GetKoiVarieties();
            this.KoiManageGrid.ItemsSource = koi;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            CreateKoiWPF createKoiWPF = new CreateKoiWPF();
            createKoiWPF.Owner = this;
            createKoiWPF.ShowDialog();
            loadInit();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            loadInit();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            KoiVariety? selected = KoiManageGrid.SelectedItem as KoiVariety;
            if (selected == null)
            {
                MessageBox.Show("Vui lòng chọn loại cá Koi để cập nhật", "chọn một loại cá", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }
            CreateKoiWPF createKoi = new CreateKoiWPF();
            createKoi.EditKoiVariety = selected;
            createKoi.ShowDialog();
            loadInit();
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            KoiVariety? selected = KoiManageGrid.SelectedItem as KoiVariety;
            if (selected == null)
            {
                MessageBox.Show("Vui lòng chọn loại cá Koi để xóa ", "chọn một loại cá", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }
            MessageBoxResult confirm = MessageBox.Show($"Bạn có chắc muốn xóa cá {selected.KoiType}", "xác nhận ?", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (confirm == MessageBoxResult.No)
            {
                return;
            }
            await _koiVarietyService.DeleteKoiVariety(selected.KoiType);
            await loadInit();
        }

        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            string koiType = txtSearch.Text;
            var koiTypeList = await _koiVarietyService.GetKoiVarietiesByKoiType(koiType);
            this.KoiManageGrid.ItemsSource = koiTypeList;
        }
    }
}
