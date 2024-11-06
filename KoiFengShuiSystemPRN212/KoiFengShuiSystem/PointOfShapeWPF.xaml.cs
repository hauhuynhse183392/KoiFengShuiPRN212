using FengShuiKoi_BO;
using FengShuiKoi_Repository;
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

    public partial class PointOfShapeWPF : Window
    {
        private readonly IPointOfShapeService _pointOfShapeService;
        private readonly IShapeService _shapeService;
        private readonly IElementService _elementService;
        public PointOfShapeWPF()
        {
            InitializeComponent();
            _pointOfShapeService = new PointOfShapeService();
            _shapeService = new ShapeService();
            _elementService = new ElementService();
            loadDataInit();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            loadDataInit();
        }
        private async void loadDataInit()
        {
            this.cbElement.ItemsSource = await _elementService.GetElement();
            this.cbShape.ItemsSource = await _shapeService.GetShapes();
            this.cbPoint.ItemsSource = new List<double> { 0.25, 0.5, 0.75, 1 };
            this.cbPoint.DisplayMemberPath = ""; 
            this.cbPoint.SelectedValuePath = "";
            this.cbElement.DisplayMemberPath = "ElementId";
            this.cbElement.SelectedValuePath = "ElementId";
            this.cbShape.DisplayMemberPath = "ShapeId";
            this.cbShape.SelectedValuePath = "ShapeId";
            List<PointOfShape> pointOfShapes = await _pointOfShapeService.GetPointOfShapes();
            this.dtg_PointOfShape.ItemsSource = pointOfShapes;
            this.cbElement.Text = "";
            this.cbShape.Text = "";
            this.cbPoint.Text = "";
        }
    

        

        private void btn_Pond_Click(object sender, RoutedEventArgs e)
        {
            PondManageWPF pondManageWPF = new PondManageWPF();
            pondManageWPF.Show();
            this.Close();
        }

        private async void dtg_PointOfShape_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataGrid dataGrid = sender as DataGrid;


            DataGridRow row = dataGrid.ItemContainerGenerator.ContainerFromIndex(dataGrid.SelectedIndex) as DataGridRow;
            if (row != null)
            {
                DataGridCell cellElement = dataGrid.Columns[0].GetCellContent(row).Parent as DataGridCell;
                string element = ((TextBlock)cellElement.Content).Text;


                DataGridCell cellShape = dataGrid.Columns[1].GetCellContent(row).Parent as DataGridCell;
                string shape = ((TextBlock)cellShape.Content).Text;

                PointOfShape pointOfShape = await _pointOfShapeService.GetPointOfShape(element, shape);
                if (pointOfShape != null)
                {
                    cbElement.SelectedValue = pointOfShape.ElementId;
                    cbShape.SelectedValue = pointOfShape.ShapeId;
                    cbPoint.SelectedValue = pointOfShape.Point;
                }
            }
        }

        private async void btn_DeletePoint_Click(object sender, RoutedEventArgs e)
        {
            var pointOfShape = dtg_PointOfShape.SelectedItem as PointOfShape;

            if (pointOfShape != null &&
      MessageBox.Show("Bạn có muốn xóa dòng dữ liệu này không?",
                      "Xóa dữ liệu ",
                      MessageBoxButton.YesNo,
                      MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                if (await _pointOfShapeService.DeletePointOfShape(pointOfShape.ElementId, pointOfShape.ShapeId))
                {
                    MessageBox.Show("Xoá dữ liệu thành công");
                    loadDataInit();
                }
                else
                {
                    MessageBox.Show("Xoá dữ liệu không thành công");
                }
            }
        }

        private async void btn_AddPoint_Click(object sender, RoutedEventArgs e)
        {
            PointOfShape pointOfShape = new PointOfShape();
            if (string.IsNullOrWhiteSpace(cbPoint.SelectedValue.ToString()) || string.IsNullOrWhiteSpace(cbElement.SelectedValue.ToString()) || string.IsNullOrWhiteSpace(cbShape.SelectedValue.ToString()))
            {
                MessageBox.Show("Tất cả các trường không được bỏ trống !");
            }
            else
            {
                pointOfShape.ElementId = cbElement.SelectedValue.ToString();
                pointOfShape.ShapeId = cbShape.SelectedValue.ToString();
                pointOfShape.Point = double.Parse(cbPoint.SelectedValue.ToString());
               
                var _existPoint = await _pointOfShapeService.GetPointOfShape(pointOfShape.ElementId, pointOfShape.ShapeId);
                if (_existPoint != null)
                {

                    MessageBox.Show("Số điểm của hồ và mệnh này đã tồn tại trong hệ thống");
                    return;
                }
                else
                {
                    if (await _pointOfShapeService.AddPointOfShape(pointOfShape))
                    {
                        MessageBox.Show("Thêm điểm của hồ và mệnh thành công");
                        loadDataInit();
                    }
                    else
                    {
                        MessageBox.Show("Thêm điểm của hồ và mệnh thất bại");

                    }
                }


            }
        }

        private async void btn_UpdatePoint_Click(object sender, RoutedEventArgs e)
        {
            PointOfShape pointOfShape = new PointOfShape();
            if (string.IsNullOrWhiteSpace(cbPoint.SelectedValue.ToString()) || string.IsNullOrWhiteSpace(cbElement.SelectedValue.ToString()) || string.IsNullOrWhiteSpace(cbShape.SelectedValue.ToString()))
            {
                MessageBox.Show("Tất cả các trường không được bỏ trống !");
            }
            else
            {
                pointOfShape.ElementId = cbElement.SelectedValue.ToString();
                pointOfShape.ShapeId = cbShape.SelectedValue.ToString();
                pointOfShape.Point = double.Parse(cbPoint.SelectedValue.ToString());
                
                var _existPoint = await _pointOfShapeService.GetPointOfShape(pointOfShape.ElementId, pointOfShape.ShapeId);
                if (_existPoint == null)
                {

                    MessageBox.Show("Số điểm của hồ và mệnh này chưa tồn tại trong hệ thống");
                    return;
                }
                else
                {
                    if (await _pointOfShapeService.UpdatePointOfShape(pointOfShape))
                    {
                        MessageBox.Show("Cập nhật điểm thành công");
                        loadDataInit();
                    }
                    else
                    {
                        MessageBox.Show("Cập nhật điểm thất bại");

                    }
                }


            }
        }

        private async void btn_Search_Click(object sender, RoutedEventArgs e)
        {
            this.dtg_PointOfShape.ItemsSource = await _pointOfShapeService.SearchPointOfShapes(cbElement.SelectedValue?.ToString(), cbShape.SelectedValue?.ToString(), cbPoint.SelectedValue != null ? (double?)double.Parse(cbPoint.SelectedValue.ToString()) : null);
        }

        private void btn_Reset_Click(object sender, RoutedEventArgs e)
        {
            loadDataInit();
        }
    }
}
