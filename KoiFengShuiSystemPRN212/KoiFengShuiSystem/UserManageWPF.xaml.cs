using FengShuiKoi_BO;
using FengShuiKoi_Services;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for UserManageWPF.xaml
    /// </summary>
    public partial class UserManageWPF : Window
    {
        private IAccountService accountService;
        private IMemberService memberService;
        public UserManageWPF()
        {
            InitializeComponent();
            accountService = new AccountService();
            memberService = new MemberService();
        }

        private async void DataGrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            DataGrid dataGrid = sender as DataGrid;
            DataGridRow row = dataGrid.ItemContainerGenerator.ContainerFromIndex(dataGrid.SelectedIndex) as DataGridRow;

            if (row != null)
            {
                DataGridCell RowColumn = dataGrid.Columns[0].GetCellContent(row).Parent as DataGridCell;
                string id = ((TextBlock)RowColumn.Content).Text;

                Account profile = await accountService.GetAccountByUserID(id);

                if (profile != null)
                {
                    UserID.Text = profile.UserId;
                    Password.Text = profile.Password;
                    Role.Text = profile.Role;
                    Email.Text = profile.Email;
                    Status.Text = profile.Status;

                    Member member = await memberService.GetMemberByUserID(profile.UserId);
                    if (member != null)
                    {
                        FullName.Text = member.Name;
                        Birthday.SelectedDate = member.Birthday; 
                    }
                    else
                    {
                        FullName.Text = "";
                        Birthday.SelectedDate = null;
                    }
                }
            }
        }
        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await loadDataInit();
        }
        public class AccountMemberViewModel
        {
            public string UserId { get; set; }
            public string FullName { get; set; }
            public string Password { get; set; }
            public DateTime Birthday { get; set; }
            public string Role { get; set; }
            public string Email { get; set; }
            public string Status { get; set; }
        }

        private async Task loadDataInit()
        {

            var accounts = await accountService.GetAllAccounts();
            var members = await memberService.GetMembers();

            var combinedList = accounts.Select(acc => new AccountMemberViewModel
            {
                UserId = acc.UserId,
                FullName = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Name ?? string.Empty,
                Password = acc.Password,
                Birthday = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Birthday ?? DateTime.MinValue,
                Role = acc.Role,
                Email = acc.Email,
                Status = acc.Status
            }).ToList();

            this.DataGrid.ItemsSource = combinedList;

            UserID.Text = "";
            Password.Text = "";
            Role.Text = "Member";
            Email.Text = "";
            Status.Text = "Active";
            FullName.Text = "";
            Birthday.SelectedDate = null; 
        }
        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            // Biểu thức chính quy để kiểm tra tính hợp lệ của email
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern, RegexOptions.IgnoreCase);
        }
        private async void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            var fieldsToCheck = new Dictionary<string, string>
            {
        { "UserID", UserID.Text },
        { "Password", Password.Text },
        { "FullName", FullName.Text },
        { "Email", Email.Text }
             };

            foreach (var field in fieldsToCheck)
            {
                if (string.IsNullOrWhiteSpace(field.Value))
                {
                    MessageBox.Show($"Vui lòng điền đầy đủ thông tin cho {field.Key}.");
                    return; 
                }
                if (!IsValidEmail(Email.Text))
                {
                    MessageBox.Show("Vui lòng nhập đúng cú pháp của Email.");
                    return;
                }
            }
            Account newAccount = new Account
            {
                UserId = UserID.Text,
                Password = Password.Text,
                Role = "Member",
                Email = Email.Text,
                Status = "Active"
            };

            Member newMember = new Member
            {
                Name = FullName.Text,
                Birthday = Birthday.SelectedDate.HasValue ? Birthday.SelectedDate.Value : DateTime.Now,
                UserId = UserID.Text
            };

            bool result = await accountService.AddAccount(newAccount);
            bool memberResult = await memberService.AddMember(newMember);

            if (result && memberResult)
            {
                MessageBox.Show("User added successfully.");
                await loadDataInit();
            }
            else
            {
                MessageBox.Show("Failed to add user.");
            }
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var fieldsToCheck = new Dictionary<string, string>
    {
        { "UserID", UserID.Text },
        { "Password", Password.Text },
        { "FullName", FullName.Text }
    };

            foreach (var field in fieldsToCheck)
            {
                if (string.IsNullOrWhiteSpace(field.Value))
                {
                    MessageBox.Show($"Vui lòng điền đầy đủ thông tin cho {field.Key}.");
                    return;
                }
            }
            if (!IsValidEmail(Email.Text))
            {
                MessageBox.Show("Vui lòng nhập đúng cú pháp của Email.");
                return;
            }

            Account updatedAccount = new Account
            {
                UserId = UserID.Text,
                Password = Password.Text,
                Role = "Member",
                Email = Email.Text,
                Status = "Active"
            };

            Member updatedMember = new Member
            {
                Name = FullName.Text,
                Birthday = Birthday.SelectedDate.HasValue ? Birthday.SelectedDate.Value : DateTime.Now,
                UserId = UserID.Text
            };

            bool result = await accountService.UpdateAccountByUser(updatedAccount);
            bool memberResult = await memberService.UpdateMember(updatedMember);
            if (result & memberResult)
            {
                MessageBox.Show("Cập nhật người dùng thành công.");
                await loadDataInit();
            }
            else
            {
                MessageBox.Show("Không thể cập nhật người dùng.");
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            string userId = UserID.Text;
            if (string.IsNullOrWhiteSpace(userId))
            {
                MessageBox.Show("Vui lòng nhập UserID để xóa.");
                return;
            }
            bool memberResult = await memberService.DeleteAccount(userId);
            bool result = await accountService.DeleteAccount(userId);

            if (result & memberResult)
            {
                MessageBox.Show("User deleted successfully.");
                await loadDataInit();
            }
            else
            {
                MessageBox.Show("Failed to delete user.");
            }
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
            AdminWPF adminWPF = new AdminWPF();
            adminWPF.Show();
        }

        private async void btnSearchUserName_Click(object sender, RoutedEventArgs e)
        {
            string userName = SearchUserName.Text.Trim();
            var accounts = await accountService.GetAllAccounts();
            var members = await memberService.GetMembers();

            var filteredList = accounts
                .Where(acc => acc.UserId.Contains(userName, StringComparison.OrdinalIgnoreCase))
                .Select(acc => new AccountMemberViewModel
                {
                    UserId = acc.UserId,
                    FullName = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Name,
                    Password = acc.Password,
                    Birthday = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Birthday ?? DateTime.MinValue,
                    Role = acc.Role,
                    Email = acc.Email,
                    Status = acc.Status
                }).ToList();

            this.DataGrid.ItemsSource = filteredList;
        }

        private async void btnSearchEmail_Click(object sender, RoutedEventArgs e)
        {
            String UserEmail = SearchEmail.Text.Trim();
            var accounts = await accountService.GetAllAccounts();
            var members = await memberService.GetMembers();

            var filteredList = accounts
                .Where(acc => acc.Email.Contains(UserEmail, StringComparison.OrdinalIgnoreCase))
                .Select(acc => new AccountMemberViewModel
                {
                    UserId = acc.UserId,
                    FullName = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Name,
                    Password = acc.Password,
                    Birthday = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Birthday ?? DateTime.MinValue,
                    Role = acc.Role,
                    Email = acc.Email,
                    Status = acc.Status
                }).ToList();

            this.DataGrid.ItemsSource = filteredList;
        }
    }
}
