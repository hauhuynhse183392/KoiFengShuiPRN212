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
    /// Interaction logic for RegisterWPF.xaml
    /// </summary>
    public partial class RegisterWPF : Window
    {
        private IAccountService accountService;
        private IMemberService memberService;
        public RegisterWPF()
        {
            InitializeComponent();
            accountService = new AccountService();
            memberService = new MemberService();
        }

        private async void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUserid.Text) || string.IsNullOrWhiteSpace(txtPass.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtName.Text))
            {
                MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
                return;
            }
            DateTime? birthDate = null;
            if (birthday.SelectedDate.HasValue)
            {
                birthDate = birthday.SelectedDate.Value;
            }
            else
            {
                MessageBox.Show("Vui lòng chọn ngày sinh!");
                return;
            }
            Account account = new Account()
            {
                UserId = txtUserid.Text,
                Password = txtPass.Text,
                Email = txtEmail.Text,
                Role = "Member",
                Status = "Active"
            };
            Member member = new Member()
            {
                Name = txtName.Text,
                Birthday = birthDate.Value,
                UserId = txtUserid.Text
            };
            if (await accountService.GetAccountByUserID(account.UserId) != null)
            {
                MessageBox.Show("Tài khoản đã tồn tại !");
                return;
            }
            if (await accountService.GetAccountByEmail(account.Email) != null)
            {
                MessageBox.Show("Email đã tồn tại !");
                return;
            }
            bool result = await accountService.AddAccount(account);
            bool result2 = await memberService.AddMember(member);
            if (result && result2)
            {
                MessageBox.Show("Đăng ký thành công");
                this.Close();
                LoginWPF login = new LoginWPF();
                login.Show();
            }
            else
            {
                MessageBox.Show("Đăng ký thất bại");
            }

        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
            LoginWPF login = new LoginWPF();
            login.Show();
        }
    }
}
