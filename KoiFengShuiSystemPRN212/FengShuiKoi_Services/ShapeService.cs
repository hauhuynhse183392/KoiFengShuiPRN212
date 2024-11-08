using FengShuiKoi_BO;
using FengShuiKoi_DAO;
using FengShuiKoi_Repository;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public class ShapeService : IShapeService
    {
        private IShapeRepo shapeRepo;

        public ShapeService()
        {
            shapeRepo = new ShapeRepo();
        }
        public async Task<Shape> GetShapeByImg(string img) => await shapeRepo.GetShapeByImg(img);
        public async Task<Shape> GetShapeById(string id) => await shapeRepo.GetShapeById(id);

        public async Task<List<Shape>> GetShapes() => await shapeRepo.GetShapes();

        public async Task<bool> AddShape(Shape shape) => await shapeRepo.AddShape(shape);

        public async Task<bool> DeleteShape(string id) => await shapeRepo.DeleteShape(id);

        public async Task<bool> UpdateShape(Shape shape) => await shapeRepo.UpdateShape(shape);
        public async Task<bool> UpdateShapeImg(string shapeId, string Img) => await shapeRepo.UpdateShapeImg(shapeId, Img);
        public async Task<List<Shape>> GetShapeByContainsShape(string shape)=> await shapeRepo.GetShapeByContainsShape(shape);
        public async Task<List<Shape>> GetShapesAndPoint()=> await shapeRepo.GetShapesAndPoint();
        public async Task<bool> UpdateShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes) => await shapeRepo.UpdateShapeAndPoint(_shape, pointOfShapes);
        public async Task<bool> AddShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes) => await shapeRepo.AddShapeAndPoint(_shape, pointOfShapes);

    }
}