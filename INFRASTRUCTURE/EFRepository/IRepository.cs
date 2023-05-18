﻿using INFRASTRUCTURE.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INFRASTRUCTURE.EFRepository
{
    public interface IRepository<TEntity> where TEntity : class
    {
        IQueryable<TEntity> GetAll();
        IQueryable<TEntity> GetReadOnlyList();
        IQueryable<TEntity> GetNotDeleted();
        Task<TEntity> Get<T>(T id);

        Task Add(TEntity entity, bool isSaveChanges = true);

        Task Change(TEntity entity, bool isSaveChanges = true);
        Task ChangeRange(List<TEntity> entity, bool isSaveChanges = true);
        Task SeederChangeRange(List<TEntity> entity, bool isSaveChanges = true);


        Task Delete<T>(T id, bool isSaveChanges = true);
        Task DeleteRange<T>(List<T> ids, bool isSaveChanges = true);
        Task RemoveRangeAsync(List<TEntity> entities, bool isSaveChanges = true);
        Task AddRangeAsync(List<TEntity> entities, bool isSaveChanges = true);
        Task Save();
        Task SoftDelete(BaseEntity entity);
        Task SeederAddRangeAsync(List<TEntity> entities, bool isSaveChanges = true);
    }
}
