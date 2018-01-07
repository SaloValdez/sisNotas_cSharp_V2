using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SisMatricula_cSharp_v2
{
    public partial class form_Carrera : System.Web.UI.Page
    {
        ClsCarrera obj = new ClsCarrera();
        protected void Page_Load(object sender, EventArgs e)
        {
            listar();
               txtAlerta.Visible = false;
               txtCorrecto.Visible = false;
        }

        private void listar()
        {   //----para listar
            gwCarrera.DataSource = obj.Listar_Carrera();
            gwCarrera.DataBind();
        }
        private void limpiar()
        {
            txtId.Text = "";
            txtDescripcion.Text = "";
            txtAlerta.Visible = false;
            txtCorrecto.Visible = false;

        }

        private void listar_buscar() {
            DataSet dt = new DataSet();
            //--------------buscar id
            dt = obj.Listar_Buscar_Carrera(Convert.ToInt32(txtId.Text));

            txtDescripcion.Text = Convert.ToString(dt.Tables[0].Rows[0][1]);
          
        }
     

        protected void btnInsertar_Click1(object sender, EventArgs e)
        {
            if (txtDescripcion.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor llene los campos que faltan";
            }
            else {
                //=======INSERTAR
                obj.Insertar_Carrera(txtDescripcion.Text);
                listar();
                limpiar();
                txtCorrecto.Visible = true;
                txtCorrecto.Text = "Se Guardo Correctamente";
            
            }
        }

        protected void btnActualizar_Click1(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor seleccione un registro para Actualizar";

            }
            else { 
                //======ACTUALIZAR
                obj.Actualizar_Carrera(txtDescripcion.Text, Convert.ToInt16(txtId.Text));
                listar();
                limpiar();
                txtCorrecto.Visible = true;
                txtCorrecto.Text = "Se Guardo Correctamente";  
            }  
        }

        protected void btnEliminar_Click1(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor seleccione un registro para Eliminar";
            }
            else {
                //======ELIMINAR
                obj.Eliminar_Carrera(Convert.ToInt16(txtId.Text));
                listar();
                limpiar();
                txtCorrecto.Visible = true;
                txtCorrecto.Text = "Se Eliminó Correctamente";
            
            }
           
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void gwCarrera_SelectedIndexChanged(object sender, EventArgs e)
        {   //=====PARA  MOSTRAR REGISTROS EN CAJAS
            txtId.Text = gwCarrera.SelectedRow.Cells[1].Text;
            listar_buscar();

        }

        protected void gwCarrera_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {   
            //=====PARA PIE DE PAGINA
            gwCarrera.PageIndex = e.NewPageIndex;
            listar();
        }
    }
}