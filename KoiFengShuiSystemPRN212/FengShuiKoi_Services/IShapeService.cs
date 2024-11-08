using FengShuiKoi_BO;
using FengShuiKoi_DAO;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public interface IShapeService
    {
        Task<Shape> GetShapeById(string id);
        Task<List<Shape>> GetShapes();
        Task<bool> AddShape(Shape shape);
        Task<bool> DeleteShape(string id);
        Task<bool> UpdateShape(Shape shape);
        Task<Shape> GetShapeByImg(string img);
        Task<bool> UpdateShapeImg(string shapeId, string Img);
        Task<List<Shape>> GetShapeByContainsShape(string shape);
        Task<List<Shape>> GetShapesAndPoint();
        Task<bool> UpdateShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes);
        Task<bool> AddShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes);

    }
}