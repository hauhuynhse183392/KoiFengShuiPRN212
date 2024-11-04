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
	/// Interaction logic for CalculateCompatibilityWPF.xaml
	/// </summary>
	public partial class CalculateCompatibilityWPF : Window
	{
		private readonly IElementService _elementService;
		private readonly LunarCalendarConverter _lunarCalendarConverter;
		private readonly ILifePlaceService _lifePlaceService;
		private readonly IKoiVarietyService _koiVarietyService;
		private readonly IElementColorService _elementColorService;
		private readonly ITypeColorService _typeColorService;
		private readonly IPointOfShapeService _pointOfShapeService;
		private readonly ILifePlaceDirectionService _lifePlaceDirectionService;
		private readonly IColorService _colorService;
		public CalculateCompatibilityWPF()
		{
			InitializeComponent();
			_elementService = new ElementService();
			_lifePlaceDirectionService = new LifePlaceDirectionService();
			_elementColorService = new ElementColorService();
			_lunarCalendarConverter = new LunarCalendarConverter();
			_typeColorService = new TypeColorService();
			_pointOfShapeService = new PointOfShapeService();
			_koiVarietyService = new KoiVarietyService();
			_lifePlaceService = new LifePlaceService();
			_colorService = new ColorService();
			loadDataInit();
		}
		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			loadDataInit();
		}
		private async void loadDataInit()
		{
			List<KoiVariety> Koi = await _koiVarietyService.GetKoiVarieties();
			// Gán nguồn dữ liệu cho DataGrid
			this.KoiGrid.ItemsSource = Koi;
			this.cmb_element.ItemsSource = await _elementService.GetElement();
			this.cmb_element.DisplayMemberPath = "ElementId";
			this.cmb_element.SelectedValuePath = "ElementId";
			this.cmb_Color.ItemsSource = await _colorService.GetColors();
			this.cmb_Color.DisplayMemberPath = "ColorId";
			this.cmb_Color.SelectedValuePath = "ColorId";

		}
		private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{

        }
    }
}
