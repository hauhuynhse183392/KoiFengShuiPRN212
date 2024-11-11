using FengShuiKoi_BO;
using FengShuiKoi_Repository;
using FengShuiKoi_Services;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using System.IO;
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
using System.Xml;

namespace KoiFengShuiSystem
{

    public partial class PointOfShapeWPF : Window
    {
        private readonly IPointOfShapeService _pointOfShapeService;
        private readonly IShapeService _shapeService;
        private readonly IElementService _elementService;
        private ObservableCollection<PointOfShape> points;
        public FengShuiKoi_BO.Shape PointOfShape { get; set; } = null;
        public PointOfShapeWPF()
        {
            InitializeComponent();
            _pointOfShapeService = new PointOfShapeService();
            points = new ObservableCollection<PointOfShape>();
            _shapeService = new ShapeService();
            _elementService = new ElementService();
            ListPoint.ItemsSource = points;
            
            
            
        }
        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            loadDataInit();
            await fillBox(PointOfShape);
            if (PointOfShape != null)
            {
                labelPoint.Content = "Cập nhật Hồ và điểm tương ứng";
                string imagePath = PointOfShape.Image;
                if (File.Exists(imagePath))
                {

                    img.Source = new BitmapImage(new Uri(imagePath, UriKind.Absolute));
                }
            }
            else
            {
                labelPoint.Content = "Tạo Hồ và điểm tương ứng";
            }
        }
        private async void loadDataInit()
        {
            this.cbElement.ItemsSource = await _elementService.GetElement();
            this.cbPoint.ItemsSource = new List<double> { 0.25, 0.5, 0.75, 1 };
            this.cbPoint.DisplayMemberPath = ""; 
            this.cbPoint.SelectedValuePath = "";
            this.cbElement.DisplayMemberPath = "ElementId";
            this.cbElement.SelectedValuePath = "ElementId";
            this.cbElement.Text = "";
            this.cbPoint.Text = "";
        }

        private async Task fillBox(FengShuiKoi_BO.Shape _shape)
        {
            if (_shape == null)
            {
                return;
            }
            txtShapeId.Text = _shape.ShapeId;
            txtShapeId.IsEnabled = false;
            txtImage.Text = _shape.Image;
            points.Clear();

            foreach (var _point in _shape.PointOfShapes)
            {
                points.Add(new PointOfShape
                {
                    ElementId = _point.ElementId,
                    Point = _point.Point,
                });
            }
        }


        private void btn_Back_Click(object sender, RoutedEventArgs e)
        {
           
            this.Close();
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
            if (File.Exists(txtImage.Text))
            {

                img.Source = new BitmapImage(new Uri(txtImage.Text, UriKind.Absolute));
            }
        }
        private async void btn_DeletePoint_Click(object sender, RoutedEventArgs e)
        {
            if (ListPoint.SelectedItem is PointOfShape selectedPoint)
            {
                points.Remove(selectedPoint);
            }
        }

        private async void btn_AddPoint_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(cbElement.Text.ToString()) || string.IsNullOrWhiteSpace(cbPoint.Text))
            {
                MessageBox.Show("Xin hãy nhập Mệnh và số điểm tương ứng");
                return;
            }

            if (!double.TryParse(cbPoint.Text, out double point))
            {
                return;
            }
            string selectedElementId = cbElement.Text.ToString();
            if (points.Any(c => c.ElementId == selectedElementId))
            {
                MessageBox.Show("Mệnh này đã được thêm vào danh sách. Vui lòng chọn mệnh khác!");
                return;
            }
            points.Add(new PointOfShape { ElementId = cbElement.Text.ToString(), Point = point });
            cbElement.SelectedItem = null;
            cbPoint.SelectedItem = null;
        }

        private async void btn_Save_Click(object sender, RoutedEventArgs e)
        {
            var success = false;
            if (string.IsNullOrWhiteSpace(txtShapeId.Text))
            {
                MessageBox.Show("Vui lòng nhập Tên hồ!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtImage.Text))
            {
                MessageBox.Show("Vui lòng nhập đường dẫn hình ảnh");
                return;
            }
            
            var shape = new FengShuiKoi_BO.Shape
            {
                ShapeId = txtShapeId.Text,
                Image = txtImage.Text,
               
            };

            var pointOfShape = points.Select(c => new PointOfShape
            {
                ElementId = c.ElementId,
                ShapeId = shape.ShapeId,
                Point = c.Point 
            }).ToList();
            if (PointOfShape == null)
            {
                success = await _shapeService.AddShapeAndPoint(shape, pointOfShape);
            }
            else
            {
                success = await _shapeService.UpdateShapeAndPoint(shape, pointOfShape);
            }
            if (success)
            {
                MessageBox.Show(PointOfShape == null ? "Thêm Hồ thành công!" : "Cập nhật Hồ thành công");
                this.Close();
            }
            else
            {
                MessageBox.Show(PointOfShape == null ? "Thêm cá Koi thất bại." : "Cập nhật cá Koi thất bại");
            }
        }
    }
}
