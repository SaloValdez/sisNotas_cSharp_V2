using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Microsoft.Reporting.WebForms;

namespace SisMatricula_cSharp_v2
{
    public partial class rep_Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                reporte_alumno();
            }
        }


        private void reporte_alumno()
        {

            ReportDataSource rds = new ReportDataSource();
            DataTable dtsdatos = new DataTable();
            ClsAlumno obj = new ClsAlumno();

            try
            {
                rds.Name = "DataSet1";
                dtsdatos = obj.Listar_alumno_rep();

                if (dtsdatos.Rows.Count > 0)
                {
                    rds.Value = dtsdatos;
                    repAlumno.LocalReport.DataSources.Clear();
                    repAlumno.LocalReport.DataSources.Add(rds);
                    repAlumno.LocalReport.ReportPath = "inf_Alumno.rdlc";
                    repAlumno.DataBind();
                }
            }
            catch
            {
            }




        }
    }
}