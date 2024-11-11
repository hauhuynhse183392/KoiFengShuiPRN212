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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KoiFengShuiSystem
{
    /// <summary>
    /// Interaction logic for Sidebar.xaml
    /// </summary>
    public partial class Sidebar : UserControl
    {
        public Sidebar()
        {
            InitializeComponent();
        }
        private void btn_ManageUser_Click(object sender, RoutedEventArgs e)
        {

            UserManageWPF userManageWPF = new UserManageWPF();
            userManageWPF.Show();
            Window.GetWindow(this)?.Close();
        }

        private void btn_ManageKoi_Click(object sender, RoutedEventArgs e)
        {

            KoiFishManageWPF koiFishManageWPF = new KoiFishManageWPF();
            koiFishManageWPF.Show();
            Window.GetWindow(this)?.Close();
        }

        private void btn_ManagePond_Click(object sender, RoutedEventArgs e)
        {

            PondManageWPF pondManageWPF = new PondManageWPF();
            pondManageWPF.Show();
            Window.GetWindow(this)?.Close();
        }

        private void btn_logout_Click(object sender, RoutedEventArgs e)
        {
            LoginWPF loginWPF = new LoginWPF();
            loginWPF.Show();
            Window.GetWindow(this)?.Close();
        }
    }
}
