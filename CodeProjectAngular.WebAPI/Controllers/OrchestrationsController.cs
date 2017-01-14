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
        public IEnumerable<Orchestration> Get(
            string TITLE, 
            string COMP_LYR,
            string ARRANGER,
            string CATNUM,
            string PUBLISHER,
            string TITLEYEAR,
            string ARRANGYEAR,
            string ARRANGTYPE,
            string KEY,
            string PRODTYPE,
            string PRODTITLE,
            string ID,
            string NOTES,
            string PLATE_NUMBER,
            string PCN,
            string LARGE
            )
        {

 
            var model = _db.Database
                .SqlQuery<Orchestration>("GetOrchestrations @fTITLE, @fCOMP_LYR, @fARRANGER,@fCATNUM ,@fPUBLISHER ,@fTITLEYEAR ,@fARRANGYEAR, @fARRANGTYPE ,@fKEY ,@fPRODTYPE ,@fPRODTITLE ,@fID ,@fNOTES ,@fPLATE_NUMBER ,@fPCN ,@fLARGE ",
                new SqlParameter("@fTITLE", TITLE),
                new SqlParameter("@fCOMP_LYR",COMP_LYR),
                new SqlParameter("@fARRANGER",ARRANGER),
                new SqlParameter("@fCATNUM",CATNUM),
                new SqlParameter("@fPUBLISHER",PUBLISHER),
                new SqlParameter("@fTITLEYEAR",TITLEYEAR),
                new SqlParameter("@fARRANGYEAR",ARRANGYEAR),
                new SqlParameter("@fARRANGTYPE", ARRANGTYPE),
                new SqlParameter("@fKEY",KEY),
                new SqlParameter("@fPRODTYPE",PRODTYPE),
                new SqlParameter("@fPRODTITLE",PRODTITLE),
                new SqlParameter("@fID",ID),
                new SqlParameter("@fNOTES",NOTES),
                new SqlParameter("@fPLATE_NUMBER",PLATE_NUMBER),
                new SqlParameter("@fPCN",PCN),
                new SqlParameter("@fLARGE",LARGE)
                )
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
