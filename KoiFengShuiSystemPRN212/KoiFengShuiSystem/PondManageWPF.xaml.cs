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

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            PointOfShapeWPF pointOfShape = new PointOfShapeWPF();
            pointOfShape.ShowDialog();
            loadDataInit();
        }

        private async void btn_Search_Click(object sender, RoutedEventArgs e)
        {
            this.dtgPond.ItemsSource = await _shapeService.GetShapeByContainsShape(txtShapeId.Text);
        }

        private async void btn_PointOfShape_Click(object sender, RoutedEventArgs e)
        {

            Shape? selected = dtgPond.SelectedItem as Shape;
            if (selected == null)
            {
                MessageBox.Show("Vui lòng chọn loại hồ để cập nhật", "Chọn một loại hồ", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }
            PointOfShapeWPF pointOfShape = new PointOfShapeWPF();

            pointOfShape.PointOfShape = await _shapeService.GetShapeById(selected.ShapeId);
            pointOfShape.ShowDialog();
            loadDataInit();
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




        private void dtgPond_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {

            Shape shape = dtgPond.SelectedItem as Shape;

            if (shape != null)
            {

                txtShapeId.Text = shape.ShapeId;

            }
            else
            {

                txtShapeId.Text = string.Empty;

            }
        }


    }
}
