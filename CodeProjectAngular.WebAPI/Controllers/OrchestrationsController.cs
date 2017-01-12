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
        public IEnumerable<Orchestration> Get(string id)
        {

            string titleContainsParam = "{}";
            string compLyrContainsParam = "{}";
            
            var idParameter = new SqlParameter("@IDFILTER", id);
            var titleParameter = new SqlParameter("@TITLEFILTER", titleContainsParam);
            var compLyrParameter = new SqlParameter("@COMPLYRFILTER", compLyrContainsParam);

            var model = _db.Database
                .SqlQuery<Orchestration>("GetOrchestrations @IDFILTER, @TITLEFILTER, @COMPLYRFILTER", idParameter, titleParameter, compLyrParameter)
                .ToList();

            return model;

        }
        
        
        // GET api/values
        public IEnumerable<Orchestration> Get(string idParam, string titleContainsParam = "{}", string compLyrContainsParam = "{}")
        {

            var idParameter = new SqlParameter("@IDFILTER", idParam);
            var titleParameter = new SqlParameter("@TITLEFILTER", titleContainsParam);
            var compLyrParameter = new SqlParameter("@COMPLYRFILTER", compLyrContainsParam);

            var model = _db.Database
                .SqlQuery<Orchestration>("GetOrchestrations @IDFILTER, @TITLEFILTER, @COMPLYRFILTER",idParameter, titleParameter, compLyrParameter)
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
