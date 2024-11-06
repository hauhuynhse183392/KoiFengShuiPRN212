using FengShuiKoi_BO;
using FengShuiKoi_Services;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;


namespace KoiFengShuiSystem
{
    /// <summary>
    /// Interaction logic for PondManageWPF.xaml
    /// </summary>
    public partial class PondManageWPF : Window
    {
        private readonly IShapeService _shapeService;
        private readonly IPointOfShapeService _pointOfShapeService;
        public PondManageWPF()
        {
            _shapeService = new ShapeService();
            _pointOfShapeService = new PointOfShapeService();

            InitializeComponent();
            loadDataInit();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            loadDataInit();
        }
        private async void loadDataInit()
        {
            this.dtgPond.ItemsSource = null;
            List<FengShuiKoi_BO.Shape> _shape = await _shapeService.GetShapesAndPoint();

            this.dtgPond.ItemsSource = _shape;
        }

        private void btn_Admin_Click(object sender, RoutedEventArgs e)
        {
            AdminWPF adminWPF = new AdminWPF();
            adminWPF.Show();
            this.Close();
        }

        private async void btn_Search_Click(object sender, RoutedEventArgs e)
        {
            this.dtgPond.ItemsSource = await _shapeService.GetShapeByContainsShape(txtShapeId.Text);
        }

        private void btn_PointOfShape_Click(object sender, RoutedEventArgs e)
        {
            PointOfShapeWPF pointOfShape = new PointOfShapeWPF();
            pointOfShape.Show();
            this.Close();
        }

        private async void btn_DeletePond_Click(object sender, RoutedEventArgs e)
        {

            if (txtShapeId.Text != null &&
      MessageBox.Show("Bạn có muốn xóa dòng dữ liệu này không?( Sẽ xóa liên quan các điểm phong thủy về hồ này) ",
                      "Xóa dữ liệu hồ",
                      MessageBoxButton.YesNo,
                      MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                if (await _pointOfShapeService.DeletePointOfShapeByShapeID(txtShapeId.Text))
                {
                    MessageBox.Show("Xoá dữ liệu về hồ này thành công");
                    loadDataInit();
                }
                else
                {
                    MessageBox.Show("Xoá dữ liệu không thành công");
                }
            }

        }


        private void btn_SelectImage_Click(object sender, RoutedEventArgs e)
        {

            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files|*.jpg;*.jpeg;*.png",
                Title = "Select an Image File"
            };


            if (openFileDialog.ShowDialog() == true)
            {

                txtImage.Text = openFileDialog.FileName;
            }
        }
        private async void btn_AddPond_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtShapeId.Text) || string.IsNullOrWhiteSpace(txtImage.Text))
            {
                MessageBox.Show("Tất cả các trường phải được điền!");
                return;
            }
            Shape newShape = new Shape
            {
                ShapeId = txtShapeId.Text,
                Image = txtImage.Text
            };

            var _existShape = await _shapeService.GetShapeById(newShape.ShapeId);
            if (_existShape != null)
            {

                MessageBox.Show("Hồ đã tồn tại trong hệ thống");
                return;
            }
            bool isAdded = await _shapeService.AddShape(newShape);


            if (isAdded)
            {
                MessageBox.Show("Thêm hồ mới thành công!");

                loadDataInit();
            }
            else
            {
                MessageBox.Show("Thêm hồ mới thất bại!");
            }
        }
        private void dtgPond_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {

            Shape shape = dtgPond.SelectedItem as Shape;

            if (shape != null)
            {

                txtShapeId.Text = shape.ShapeId;
                txtImage.Text = shape.Image;
            }
            else
            {

                txtShapeId.Text = string.Empty;
                txtImage.Text = string.Empty;
            }
        }

        private  async void btn_UpdatePond_Click(object sender, RoutedEventArgs e)
        {

            string updatedShapeId = txtShapeId.Text;
            string updatedImage = txtImage.Text;


            if (string.IsNullOrWhiteSpace(updatedShapeId) || string.IsNullOrWhiteSpace(updatedImage))
            {
                MessageBox.Show("Tất cả các trường phải được điền!");
                return;
            }
            var _existShape = await _shapeService.GetShapeById(updatedShapeId);
            if (_existShape == null)
            {

                MessageBox.Show("Hồ chưa tồn tại trong hệ thống");
                return;
            }
            Shape UpdateShape = new Shape
            {
                ShapeId = updatedShapeId,
                Image = updatedImage
            };
          
            bool isUpdated = await _shapeService.UpdateShape(UpdateShape); 

         
            if (isUpdated)
            {
                MessageBox.Show("Cập nhật hình hồ thành công!");
                loadDataInit(); 
            }
            else
            {
                MessageBox.Show("Cập nhật hình hồ thất bại!");
            }
        }
    }
}
