using CodeProjectAngular.WebAPI.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeProjectAngular.WebAPI.Controllers
{
    public class OrchestrationsController : ApiController
    {
        CatalogDbEntities _db = new CatalogDbEntities();

        // GET api/values
        //public IEnumerable<Orchestration> Get()
        //{
        //    var model = _db.Orchestrations.ToList();
        //    return model;
        //}

         // GET api/values
        public IEnumerable<Orchestration> Get() { 
        
            var titleParameter = new SqlParameter("@TITLEFILTER","old");

            var model = _db.Database
                .SqlQuery<Orchestration>("GetOrchestrations @TITLEFILTER", titleParameter)
                .ToList();

            return model;

        }

        // GET api/values
        public IEnumerable<Orchestration> Get(string titleContainsParam, string compLyrContainsParam)
        {

 
            var titleParameter = new SqlParameter("@TITLEFILTER", titleContainsParam);
            var compLyrParameter = new SqlParameter("@COMPLYRFILTER", compLyrContainsParam);

            var model = _db.Database
                .SqlQuery<Orchestration>("GetOrchestrations @TITLEFILTER, @COMPLYRFILTER", titleParameter, compLyrParameter)
                .ToList();

            return model;

        }


        protected override void Dispose(bool disposing)
        {
            if (_db != null){
                _db.Dispose();
            }
            
            base.Dispose(disposing);
        }



 
    }
}
