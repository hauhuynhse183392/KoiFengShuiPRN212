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

		public async void loadInit()
		{
			List<KoiVariety> koi = await _koiVarietyService.GetKoiVarieties();
			this.KoiManageGrid.ItemsSource = koi;
		}

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
			this.Close();
        }

        private void KoiManageGrid_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
			CreateKoiWPF createKoiWPF = new CreateKoiWPF();
			createKoiWPF.ShowDialog();
			loadInit();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
			loadInit();
        }
    }
}
