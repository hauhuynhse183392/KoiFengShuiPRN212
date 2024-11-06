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
	/// Interaction logic for AdminWPF.xaml
	/// </summary>
	public partial class AdminWPF : Window
	{
		public AdminWPF()
		{
			InitializeComponent();
		}

        private void Sidebar_Loaded(object sender, RoutedEventArgs e)
        {
         
        }

        //private void btn_ManageUser_Click(object sender, RoutedEventArgs e)
        //{
        //	UserManageWPF userManageWPF = new UserManageWPF();
        //	userManageWPF.Show();
        //}

        //private void btn_ManageKoi_Click(object sender, RoutedEventArgs e)
        //{
        //	KoiFishManageWPF koiFishManageWPF = new KoiFishManageWPF();
        //	koiFishManageWPF.Show();
        //}

        //private void btn_ManagePond_Click(object sender, RoutedEventArgs e)
        //{
        //	PondManageWPF pondManageWPF = new PondManageWPF();
        //	pondManageWPF.Show();
        //}

        //private void btn_logout_Click(object sender, RoutedEventArgs e)
        //{
        //	LoginWPF loginWPF = new LoginWPF();
        //	loginWPF.Show();
        //	this.Close();
        //}
    }
}
