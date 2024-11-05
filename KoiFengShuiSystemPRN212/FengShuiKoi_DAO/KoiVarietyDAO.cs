using FengShuiKoi_BO;
using FungShuiKoi_DAO;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FengShuiKoi_DAO
{
    public class KoiVarietyDAO
    {
        private SWP391_FengShuiKoiConsulting_DBContext dbContext;
        private static KoiVarietyDAO instance = null;

        public static KoiVarietyDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new KoiVarietyDAO();
                }
                return instance;
            }
        }

        public KoiVarietyDAO()
        {
            dbContext = new SWP391_FengShuiKoiConsulting_DBContext();
        }

        public async Task<KoiVariety> GetKoiVarietyByType(string type)
        {
            return await dbContext.KoiVarieties.Include(k => k.TypeColors).SingleOrDefaultAsync(m => m.KoiType.Equals(type));
        }

        public async Task<List<KoiVariety>> GetKoiVarieties()
        {
            return await dbContext.KoiVarieties.Include("TypeColors").ToListAsync();
        }

        public async Task<List<KoiVariety>> GetKoiVarietiesByElemnet(string element)
        {
            return await dbContext.KoiVarieties.Where(m => m.Element.Equals(element)).ToListAsync();
        }

        public async Task<bool> AddKoiVariety(KoiVariety variety, List<TypeColor> colors)
        {
            using var transaction = await dbContext.Database.BeginTransactionAsync();
            try
            {
                // Kiểm tra nếu KoiVariety đã tồn tại
                var existingKoi = await GetKoiVarietyByType(variety.KoiType);
                if (existingKoi != null)
                {
                    return false; // KoiVariety đã tồn tại
                }

                // Thêm KoiVariety
                await dbContext.KoiVarieties.AddAsync(variety);
                await dbContext.SaveChangesAsync();

                // Thêm TypeColors
                foreach (var color in colors)
                {
                    if (await dbContext.TypeColors.AnyAsync(tc => tc.KoiType == color.KoiType && tc.ColorId == color.ColorId))
                    {
                        return false; // Tìm thấy màu trùng lặp
                    }
                    await dbContext.TypeColors.AddAsync(color);
                }

                await dbContext.SaveChangesAsync();
                await transaction.CommitAsync();
                return true;
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                Console.WriteLine($"Lỗi khi thêm KoiVariety và TypeColors: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> DeleteKoiVariety(string type)
        {
            using var transaction = await dbContext.Database.BeginTransactionAsync();
            try
            {
                var existingKoi = await GetKoiVarietyByType(type);
                if(existingKoi == null)
                {
                    return false;
                }
                dbContext.TypeColors.RemoveRange(existingKoi.TypeColors);
                dbContext.KoiVarieties.Remove(existingKoi);
                await dbContext.SaveChangesAsync();
                await transaction.CommitAsync();
                return true;
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                Console.WriteLine($"Lỗi khi xóa KoiVariety và TypeColors: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> UpdateKoiVariety(KoiVariety updatedKoi, List<TypeColor> colors)
        {
            using var transaction = await dbContext.Database.BeginTransactionAsync();
            try
            {
                var existingKoi = await GetKoiVarietyByType(updatedKoi.KoiType);
                if (existingKoi == null)
                {
                    return false;
                }
                existingKoi.Description = updatedKoi.Description;   
                existingKoi.Element = updatedKoi.Element;
                existingKoi.Image = updatedKoi.Image;   
                dbContext.TypeColors.RemoveRange(existingKoi.TypeColors);
                foreach (var color in colors)
                {
                    color.KoiType = existingKoi.KoiType;
                    await dbContext.TypeColors.AddAsync(color);
                }
                await dbContext.SaveChangesAsync();
                await transaction.CommitAsync();
                return true;

            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                Console.WriteLine($"Lỗi khi update KoiVariety và TypeColors: {ex.Message}");
                return false;
            }
        }

        public async Task<List<KoiVariety>> GetKoiVarietiesByKoiType(string koiType)
        {
            if (string.IsNullOrWhiteSpace(koiType))
            {
                return await instance.GetKoiVarieties();
            }
            return await dbContext.KoiVarieties.Include(k => k.TypeColors).Where(m => m.KoiType.Contains(koiType)).ToListAsync();
        }
    }
}