﻿using FengShuiKoi_BO;
using FengShuiKoi_DAO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FengShuiKoi_Services
{
    public interface IPointOfShapeService
    {
        Task<PointOfShape> GetPointOfShape(string element, string shape);
        Task<List<PointOfShape>> GetPointOfShapes();
        Task<bool> AddPointOfShape(PointOfShape pointOfShape);
        Task<bool> DeletePointOfShape(string element, string shape);
        Task<bool> UpdatePointOfShape(PointOfShape pointOfShape);
        Task<List<PointOfShape>> GetGoodShapeByElemnet(string element);
        Task<PointOfShape> GetPointOfShapeByShapeID(string shape);
        Task<bool> DeletePointOfShapeByShapeID(string shapeID);
        Task<List<PointOfShape>> SearchPointOfShapes(string? Element, string? shapeID, double? point);
    }
}