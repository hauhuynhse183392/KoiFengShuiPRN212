using FengShuiKoi_BO;
using FengShuiKoi_Services;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
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
                        FullName.Text = member.Name; // Cập nhật FullName
                        Birthday.SelectedDate = member.Birthday; // Cập nhật Birthday
                    }
                    else
                    {
                        FullName.Text = ""; // Nếu không tìm thấy member, xóa thông tin
                        Birthday.SelectedDate = null; // Xóa ngày sinh
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
                FullName = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Name, 
                Password = acc.Password,
                Birthday = members.FirstOrDefault(m => m.UserId == acc.UserId)?.Birthday ?? DateTime.MinValue,
                Role = acc.Role,
                Email = acc.Email,
                Status = acc.Status
            }).ToList();

            this.DataGrid.ItemsSource = combinedList;

           
            UserID.Text = "";
            Password.Text = "";
            Role.Text = "";
            Email.Text = "";
            Status.Text = "";
        }

        private async void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Account newAccount = new Account
            {
                UserId = UserID.Text,
                Password = Password.Text,
                Role = "Member", // Hardcoded value for Role
                Email = Email.Text,
                Status = "Active" // Hardcoded value for Status
            };

            Member newMember = new Member
            {
                Name = FullName.Text,
                Birthday = Birthday.SelectedDate.HasValue ? Birthday.SelectedDate.Value : DateTime.Now,
                UserId = UserID.Text
            };

            bool result = await accountService.AddAccount(newAccount);

            if (result)
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

            if (result)
            {
                MessageBox.Show("User updated successfully.");
                await loadDataInit();
            }
            else
            {
                MessageBox.Show("Failed to update user.");
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            string userId = UserID.Text;
            bool result = await accountService.DeleteAccount(userId);
            if (result)
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
        }
    }
}
