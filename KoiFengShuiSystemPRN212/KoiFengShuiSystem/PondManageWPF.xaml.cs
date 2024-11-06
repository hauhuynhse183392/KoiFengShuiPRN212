using FengShuiKoi_BO;
using FengShuiKoi_Services;
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
            this.dtgPond.ItemsSource = await _shapeService.GetShapeByContainsShape(txt_Search.Text);
        }

        private void btn_PointOfShape_Click(object sender, RoutedEventArgs e)
        {
            PointOfShapeWPF pointOfShape = new PointOfShapeWPF();
            pointOfShape.Show();
            this.Close();
        }

        private async void btn_DeletePond_Click(object sender, RoutedEventArgs e)
        {
            var shape = dtgPond.SelectedItem as FengShuiKoi_BO.Shape;

            if (shape != null &&
      MessageBox.Show("Bạn có muốn xóa dòng dữ liệu này không?( Sẽ xóa liên quan các điểm phong thủy về hồ này) ",
                      "Xóa dữ liệu hồ",
                      MessageBoxButton.YesNo,
                      MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                if(await _pointOfShapeService.DeletePointOfShapeByShapeID(shape.ShapeId))
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
    }
}
