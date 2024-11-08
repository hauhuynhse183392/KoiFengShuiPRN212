using FengShuiKoi_BO;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;

namespace FengShuiKoi_DAO
{
    public class ShapeDAO
    {
        private SWP391_FengShuiKoiConsulting_DBContext dbContext;
        private static ShapeDAO instance = null;
        public static ShapeDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShapeDAO();
                }
                return instance;
            }
        }

        public ShapeDAO()
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
        }

        public async Task<Shape> GetShapeById(string id)
        {
            return await dbContext.Shapes.FirstOrDefaultAsync(s => s.ShapeId == id);
        }
        public async Task<List<Shape>> GetShapeByContainsShape(string shape)
        {
            return await dbContext.Shapes.Where(s => s.ShapeId.Contains(shape)).ToListAsync();
        }
        public async Task<Shape> GetShapeByImg(string img)
        {
            return await dbContext.Shapes.FirstOrDefaultAsync(s => s.Image == img);
        }

        public async Task<List<Shape>> GetShapes()
        {
            return await dbContext.Shapes.ToListAsync();
        }
        public async Task<List<Shape>> GetShapesAndPoint()
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
            var shapes = await dbContext.Shapes
            .Include(s => s.PointOfShapes) 
            .ToListAsync(); 

            return shapes; 

        }


        public async Task<bool> AddShape(Shape shape)
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
            bool isSuccess = false;
            Shape existingShape = await this.GetShapeById(shape.ShapeId);
            try
            {
                if (existingShape == null)
                {
                    await dbContext.Shapes.AddAsync(shape);
                    await dbContext.SaveChangesAsync();
                    dbContext.Entry(shape).State = EntityState.Detached;
                    isSuccess = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return isSuccess;
        }

        public async Task<bool> DeleteShape(string id)
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
            bool isSuccess = false;
            Shape shape = await this.GetShapeById(id);
            try
            {
                if (shape != null)
                {
                    dbContext.Shapes.Remove(shape);
                    await dbContext.SaveChangesAsync();
                    isSuccess = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return isSuccess;
        }

        public async Task<bool> UpdateShape(Shape shape)
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
            bool isSuccess = false;
            try
            {
               
                var existingEntity = await dbContext.Shapes
                    .FirstOrDefaultAsync(s => s.ShapeId == shape.ShapeId);

                if (existingEntity != null)
                {
                    dbContext.Entry(existingEntity).State = EntityState.Detached; 
                }

               
              
                dbContext.Entry(shape).State = EntityState.Modified; 

                await dbContext.SaveChangesAsync();
                dbContext.Entry(shape).State = EntityState.Detached;
                isSuccess = true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error updating Shape: {ex.Message}", ex);
            }
            return isSuccess;
        }
		public async Task<bool> UpdateShapeImg(string shapeId, string Img)
		{
			try
			{
				var shape = await dbContext.Shapes.FindAsync(shapeId);

				if (shape == null)
				{
					return false;
				}
				shape.Image = Img;
				dbContext.Entry(shape).Property(x => x.Image).IsModified = true;
				await dbContext.SaveChangesAsync();

				return true;
			}
			catch (Exception ex)
			{
				throw new Exception($"Lỗi khi cập nhật ảnh Shape: {ex.Message}", ex);
			}
		}
        public async Task<bool> AddShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes)
        {
            using var transaction = await dbContext.Database.BeginTransactionAsync();
            try
            {
               
                var existingShape = await GetShapeById(_shape.ShapeId);
                if (existingShape != null)
                {
                    return false; 
                }

               
                await dbContext.Shapes.AddAsync(_shape);
                await dbContext.SaveChangesAsync();

                foreach (var point in pointOfShapes)
                {
                    if (await dbContext.PointOfShapes.AnyAsync(tc => tc.ShapeId == point.ShapeId && tc.ElementId == point.ElementId))
                    {
                        return false; 
                    }
                    await dbContext.PointOfShapes.AddAsync(point);
                }

                await dbContext.SaveChangesAsync();
                await transaction.CommitAsync();
                return true;
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                Console.WriteLine($"Lỗi khi thêm Hồ và điểm của hồ đó: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> UpdateShapeAndPoint(Shape _shape, List<PointOfShape> pointOfShapes)
        {
            using var transaction = await dbContext.Database.BeginTransactionAsync();
            try
            {
                var existingShape = await GetShapeById(_shape.ShapeId);
                if (existingShape == null)
                {
                    return false;
                }
               
                existingShape.Image = _shape.Image;
                dbContext.PointOfShapes.RemoveRange(existingShape.PointOfShapes);
                foreach (var point  in pointOfShapes)
                {
                    point.ShapeId = existingShape.ShapeId; 
                    await dbContext.PointOfShapes.AddAsync(point);
                }
                await dbContext.SaveChangesAsync();
                await transaction.CommitAsync();
                return true;

            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                Console.WriteLine($"Lỗi khi update Hồ và điểm của hồ đó: {ex.Message}");
                return false;
            }
        }
    }
}