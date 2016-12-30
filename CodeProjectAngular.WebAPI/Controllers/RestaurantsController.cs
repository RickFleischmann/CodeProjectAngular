using CodeProjectAngular.WebAPI.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeProjectAngular.WebAPI.Controllers
{
    public class RestaurantsController : ApiController
    {
        OdeToDb1 _db = new OdeToDb1();

        // GET api/values
        public IEnumerable<Restaurant> Get()
        {
            var model = _db.Restaurants.ToList();
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
