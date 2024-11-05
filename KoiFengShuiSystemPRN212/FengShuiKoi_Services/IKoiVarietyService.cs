﻿using FengShuiKoi_BO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public interface IKoiVarietyService
    {
        Task<KoiVariety> GetKoiVarietyByType(string type);
        Task<List<KoiVariety>> GetKoiVarieties();
        Task<List<KoiVariety>> GetKoiVarietiesByElemnet(string element);
        Task<bool> AddKoiVariety(KoiVariety variety, List<TypeColor> colors);
        Task<bool> DeleteKoiVariety(string type);
        Task<bool> UpdateKoiVariety(KoiVariety updatedKoi, List<TypeColor> colors);
        Task<List<KoiVariety>> GetKoiVarietiesByKoiType(string koiType);
    }
}