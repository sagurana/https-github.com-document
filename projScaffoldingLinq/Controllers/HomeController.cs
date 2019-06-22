using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Linq;
using System.Configuration;
//using projScaffoldingLinq.Models;

namespace projScaffoldingLinq.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        DataContext dc = new DataContext(ConfigurationManager.ConnectionStrings["cnndbStudent"].ToString());
        public ActionResult Index()
        {
            IEnumerable<StudMst> objStud = dc.GetTable<StudMst>();
            return View(objStud);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(StudMst obj)
        {
            dc.GetTable<StudMst>().InsertOnSubmit(obj);
            dc.SubmitChanges();
            return View();
        }
        [HttpGet]
        [ActionName("Edit")]
        public ActionResult Edit_get(int id)
        {
            StudMst stud = dc.GetTable<StudMst>().Single(x => x.id == Convert.ToInt32(id));
            return View(stud);
        }
        [HttpPost]
        [ActionName("Edit")]
        public ActionResult Edit_post(int id)
        {
            StudMst stud= dc.GetTable<StudMst>().Single(x => x.id == Convert.ToInt32(id));
               UpdateModel(stud);
               dc.SubmitChanges();
            return View();
        }
        [HttpGet]
        [ActionName("Delete")]
        public ActionResult Del_get(int? id)
        {
            StudMst stud = dc.GetTable<StudMst>().Single(x => x.id == Convert.ToInt32(id));
            return View(stud);
        }
        [HttpPost]
        [ActionName("Delete")]
        public ActionResult Del_post(int id)
        {
            StudMst stud = dc.GetTable<StudMst>().Single(x => x.id == Convert.ToInt32(id));
            dc.GetTable<StudMst>().DeleteOnSubmit(stud);
            dc.SubmitChanges();
            return View();
        }

    }
}
