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
	/// Interaction logic for HomePageWPF.xaml
	/// </summary>
	public partial class HomePageWPF : Window
	{
		public HomePageWPF()
		{
			InitializeComponent();
		}

		private void btn_consluting_Click(object sender, RoutedEventArgs e)
		{
			ConslutingWPF conslutingWPF = new ConslutingWPF();
			conslutingWPF.Show();
        }

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			CalculateCompatibilityWPF calculateCompatibilityWPF = new CalculateCompatibilityWPF();
			calculateCompatibilityWPF.Show();
		}

		private void btn_logout_Click(object sender, RoutedEventArgs e)
		{
			LoginWPF loginWPF = new LoginWPF();
			loginWPF.Show();
			this.Close();
		}

    }
}
