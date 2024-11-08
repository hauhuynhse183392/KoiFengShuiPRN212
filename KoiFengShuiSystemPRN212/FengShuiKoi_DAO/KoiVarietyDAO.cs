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
            return await dbContext.KoiVarieties.SingleOrDefaultAsync(m => m.KoiType.Equals(type));
        }

        public async Task<List<KoiVariety>> GetKoiVarieties()
        {
            return await dbContext.KoiVarieties.Include(k => k.TypeColors).ToListAsync();
        }

        public async Task<List<KoiVariety>> GetKoiVarietiesByElemnet(string element)
        {
            return await dbContext.KoiVarieties.Where(m => m.Element.Equals(element)).ToListAsync();
        }

        public async Task<List<KoiVariety>> SearchKoiVarietiesByElementOrTypeOrColorId(string? element, string? koiType, string? colorId)
        {
            var query = dbContext.KoiVarieties
                                 .Include(k => k.TypeColors)
                                     .ThenInclude(tc => tc.Color)
                                 .AsQueryable();

            if (!string.IsNullOrEmpty(element))
            {
                query = query.Where(k => k.Element.Equals(element));
            }

            if (!string.IsNullOrEmpty(koiType))
            {
                query = query.Where(k => k.KoiType.Contains(koiType));
            }

            if (!string.IsNullOrEmpty(colorId))
            {
                query = query.Where(k => k.TypeColors.Any(tc => tc.ColorId.Equals(colorId)));
            }

            return await query.ToListAsync();
        }

        public async Task<bool> AddKoiVariety(KoiVariety variety)
        {
            bool isSuccess = false;
            try
            {
                var koiVariety = await GetKoiVarietyByType(variety.KoiType);
                if (koiVariety == null)
                {
                    await dbContext.KoiVarieties.AddAsync(variety);
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

        public async Task<bool> DeleteKoiVariety(string type)
        {
            bool isSuccess = false;
            try
            {
                var koiVariety = await GetKoiVarietyByType(type);
                if (koiVariety != null)
                {
                    dbContext.KoiVarieties.Remove(koiVariety);
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

        public async Task<bool> UpdateKoiVariety(KoiVariety updatedKoi)
        {
            try
            {
                var existingKoi = await dbContext.KoiVarieties.FirstOrDefaultAsync(k => k.KoiType == updatedKoi.KoiType);
                if (existingKoi == null)
                {
                    return false;
                }

                existingKoi.Image = updatedKoi.Image;
                existingKoi.Description = updatedKoi.Description;
                existingKoi.Element = updatedKoi.Element;

                dbContext.Entry(existingKoi).State = EntityState.Modified;
                int affectedRows = await dbContext.SaveChangesAsync();

                return affectedRows > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi cập nhật KoiVariety: {ex.Message}");
                return false;
            }
        }
    }
}