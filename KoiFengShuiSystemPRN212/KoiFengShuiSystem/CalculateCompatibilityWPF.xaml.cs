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
			List<KoiVariety> Koilist = await _koiVarietyService.GetKoiVarieties();
			// Gán nguồn dữ liệu cho DataGrid
			this.KoiGrid.ItemsSource = Koilist;
			var element = await _elementService.GetElement();
			var elementWithAll = new List<dynamic> { new { ElementId = "Tất cả" } };
			elementWithAll.AddRange(element);
			this.cmb_element.ItemsSource = elementWithAll;
			this.cmb_element.DisplayMemberPath = "ElementId";
			this.cmb_element.SelectedValuePath = "ElementId";
			this.cmb_element.SelectedIndex = 0; // Select "Tất cả" by default

			var Color = await _colorService.GetColors();
			var listColor = new List<dynamic> { new { ColorId = "Tất cả" } };
			listColor.AddRange(Color);
			this.cmb_Color.ItemsSource = listColor;
			this.cmb_Color.DisplayMemberPath = "ColorId";
			this.cmb_Color.SelectedValuePath = "ColorId";
			this.cmb_Color.SelectedIndex = 0;

		}
		private async Task<List<KoiVariety>> SearchKoi(string color, string element, string koiType)
		{
			var allKoi = await _koiVarietyService.GetKoiVarieties();
			var filteredKoi = allKoi.AsQueryable();

			if (color != "Tất cả")
			{
				filteredKoi = filteredKoi.Where(k => k.TypeColors.Any(c => c.ColorId == color));
			}

			if (element != "Tất cả")
			{
				filteredKoi = filteredKoi.Where(k => k.Element.Equals(element));
			}

			if (!string.IsNullOrWhiteSpace(koiType))
			{
				filteredKoi = filteredKoi.Where(k => k.KoiType.Contains(koiType, StringComparison.OrdinalIgnoreCase));
			}

			return filteredKoi.ToList();
		}
		private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{

        }

		private async void cmb_element_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			string element = cmb_element.SelectedValue?.ToString() ?? "Tất cả";
			string color = cmb_Color.SelectedValue?.ToString() ?? "Tất cả";
			string koitype = txt_koiType.Text;

			var listsearch = await SearchKoi(color, element, koitype);
			this.KoiGrid.ItemsSource = listsearch;
		}

		private async void cmb_Color_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			string element = cmb_element.SelectedValue?.ToString() ?? "Tất cả";
			string color = cmb_Color.SelectedValue?.ToString() ?? "Tất cả";
			string koitype = txt_koiType.Text;

			var listsearch = await SearchKoi(color, element, koitype);
			this.KoiGrid.ItemsSource = listsearch;
		}

		private async void txt_koiType_TextChanged(object sender, TextChangedEventArgs e)
		{
			string element = cmb_element.SelectedValue?.ToString() ?? "Tất cả";
			string color = cmb_Color.SelectedValue?.ToString() ?? "Tất cả";
			string koitype = txt_koiType.Text;

			var listsearch = await SearchKoi(color, element, koitype);
			this.KoiGrid.ItemsSource = listsearch;
		}
	}
}
