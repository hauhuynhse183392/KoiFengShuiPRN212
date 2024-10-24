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
	/// Interaction logic for LoginWPF.xaml
	/// </summary>
	public partial class LoginWPF : Window
	{
		private IAccountService accountService;
		public LoginWPF()
		{
			InitializeComponent();
			accountService = new AccountService();
		}

		private async void btn_Login_Click(object sender, RoutedEventArgs e)
		{
			Account account = await accountService.GetAccountByUserID(txtUserId.Text);
			if (account != null && account.Password.Equals(txtPass.Text) && account.Status.Equals("Active"))
			{
				if (account.Role.Equals("Member"))
				{
					HomePageWPF homePage = new HomePageWPF();
					homePage.Show();
					this.Hide();

				}
				if (account.Role.Equals("Admin"))
				{
					AdminWPF adminPage = new AdminWPF();
					adminPage.Show();
					this.Hide();
				}
			}
			else
			{
				MessageBox.Show("Tài khoản hoặc mật khẩu không hợp lệ !");
			}
		}

		private void btn_Exit_Click(object sender, RoutedEventArgs e)
		{
			Application.Current.Shutdown();
		}

		private void btnRegister_Click(object sender, RoutedEventArgs e)
		{
			RegisterWPF register = new RegisterWPF();
			register.Show();
			this.Hide();
		}
	}
}
