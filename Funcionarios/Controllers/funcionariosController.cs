using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Funcionarios;

namespace Funcionarios.Controllers
{
    public class funcionariosController : Controller
    {
        private P2Entities db = new P2Entities();

        // GET: funcionarios
        public ActionResult Index()
        {
            var funcionario = db.funcionario.Include(f => f.Atividade).Include(f => f.Empresa).Include(f => f.Setor);
            return View(funcionario.ToList());
        }

        // GET: funcionarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            funcionario funcionario = db.funcionario.Find(id);
            if (funcionario == null)
            {
                return HttpNotFound();
            }
            return View(funcionario);
        }

        // GET: funcionarios/Create
        public ActionResult Create()
        {
            ViewBag.AtividadeId = new SelectList(db.Atividade, "Id", "nome");
            ViewBag.Empresa_id = new SelectList(db.Empresa, "id", "nome");
            ViewBag.Setor_id = new SelectList(db.Setor, "id", "nome");
            return View();
        }

        // POST: funcionarios/Create
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nome,endereco,idade,Empresa_id,AtividadeId,Setor_id")] funcionario funcionario)
        {
            if (ModelState.IsValid)
            {
                db.funcionario.Add(funcionario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AtividadeId = new SelectList(db.Atividade, "Id", "nome", funcionario.AtividadeId);
            ViewBag.Empresa_id = new SelectList(db.Empresa, "id", "nome", funcionario.Empresa_id);
            ViewBag.Setor_id = new SelectList(db.Setor, "id", "nome", funcionario.Setor_id);
            return View(funcionario);
        }

        // GET: funcionarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            funcionario funcionario = db.funcionario.Find(id);
            if (funcionario == null)
            {
                return HttpNotFound();
            }
            ViewBag.AtividadeId = new SelectList(db.Atividade, "Id", "nome", funcionario.AtividadeId);
            ViewBag.Empresa_id = new SelectList(db.Empresa, "id", "nome", funcionario.Empresa_id);
            ViewBag.Setor_id = new SelectList(db.Setor, "id", "nome", funcionario.Setor_id);
            return View(funcionario);
        }

        // POST: funcionarios/Edit/5
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nome,endereco,idade,Empresa_id,AtividadeId,Setor_id")] funcionario funcionario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(funcionario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AtividadeId = new SelectList(db.Atividade, "Id", "nome", funcionario.AtividadeId);
            ViewBag.Empresa_id = new SelectList(db.Empresa, "id", "nome", funcionario.Empresa_id);
            ViewBag.Setor_id = new SelectList(db.Setor, "id", "nome", funcionario.Setor_id);
            return View(funcionario);
        }

        // GET: funcionarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            funcionario funcionario = db.funcionario.Find(id);
            if (funcionario == null)
            {
                return HttpNotFound();
            }
            return View(funcionario);
        }

        // POST: funcionarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            funcionario funcionario = db.funcionario.Find(id);
            db.funcionario.Remove(funcionario);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
