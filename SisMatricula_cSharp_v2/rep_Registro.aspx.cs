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
    public partial class rep_Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                reporte_empleado();

            }
        }


        private void reporte_empleado()
        {

            ReportDataSource rds = new ReportDataSource();
            DataTable dtsdatos = new DataTable();
            ClsRegistro obj = new ClsRegistro();

            try
            {
                rds.Name = "DataSet1";
                dtsdatos = obj.Listar_registro_rep();

                if (dtsdatos.Rows.Count > 0)
                {
                    rds.Value = dtsdatos;
                    repRegistro.LocalReport.DataSources.Clear();
                    repRegistro.LocalReport.DataSources.Add(rds);
                    repRegistro.LocalReport.ReportPath = "inf_Registro.rdlc";
                    repRegistro.DataBind();
                }
            }
            catch
            {
            }




        }

    }
}