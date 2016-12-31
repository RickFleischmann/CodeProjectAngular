using CodeProjectAngular.WebAPI.DTO;
using System;
using System.Collections.Generic;
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
        public IEnumerable<Orchestration> Get()
        {
            var model = _db.Orchestrations.ToList();
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
