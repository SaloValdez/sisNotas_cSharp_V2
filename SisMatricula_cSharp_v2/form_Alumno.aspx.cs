using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace SisMatricula_cSharp_v2
{
    public partial class form_Alumno : System.Web.UI.Page
    {
        ClsAlumno obj = new ClsAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            listar();
            txtAlerta.Visible = false;
            txtCorrecto.Visible = false;

            if (!IsPostBack) {
                cargar_combo_Carrera();
                cargar_combo_Semestre();
            }
        }

        private void listar()
        {   //----para listar
            gwAlumno.DataSource = obj.Listar_Alumno();
            gwAlumno.DataBind();
        }

        private void cargar_combo_Carrera()
        {
            ClsCarrera oj = new ClsCarrera();
            droCarrera.DataSource = oj.Listar_Carrera();
            droCarrera.DataValueField = "idCarrera";
            droCarrera.DataTextField = "descripcion";
            droCarrera.DataBind();
        }

        private void cargar_combo_Semestre()
        {
            ClsSemestre oj = new ClsSemestre();
            droSemestre.DataSource = oj.Listar_Semestre();
            droSemestre.DataValueField = "idsemestre";
            droSemestre.DataTextField = "descripcion";
            droSemestre.DataBind();
        }


        private void limpiar()
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDireccion.Text = "";
            
            txtAlerta.Visible = false;
            txtCorrecto.Visible = false;

        }

        private void listar_buscar()
        {
            DataSet dt = new DataSet();
            //--------------buscar id
            dt = obj.Listar_Buscar_alumno(Convert.ToInt32(txtId.Text));

            txtNombre.Text = Convert.ToString(dt.Tables[0].Rows[0][1]);
            txtApellido.Text = Convert.ToString(dt.Tables[0].Rows[0][2]);
            txtDireccion.Text = Convert.ToString(dt.Tables[0].Rows[0][3]);
            droCarrera.SelectedValue = Convert.ToString(dt.Tables[0].Rows[0][4]);
            droSemestre.SelectedValue = Convert.ToString(dt.Tables[0].Rows[0][5]);

        }


        protected void btnInsertar_Click1(object sender, EventArgs e)
        {
            if (txtNombre.Text == "" & txtApellido.Text == "" & txtDireccion.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor llene los campos que faltan";
            }
            else
            {
                //=======INSERTAR
                obj.Insertar_Alumno(txtNombre.Text, txtApellido.Text, txtDireccion.Text, Convert.ToUInt16(droCarrera.SelectedValue), Convert.ToUInt16(droSemestre.SelectedValue));
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
            else
            {
                //======ACTUALIZAR
                obj.Actualizar_Alumno(txtNombre.Text, txtApellido.Text, txtDireccion.Text, Convert.ToUInt16(droCarrera.SelectedValue), Convert.ToUInt16(droSemestre.SelectedValue), Convert.ToInt16(txtId.Text));
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
            else
            {
                //======ELIMINAR
                obj.Eliminar_alumno(Convert.ToInt16(txtId.Text));
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

        protected void gwAlumno_SelectedIndexChanged(object sender, EventArgs e)
        {   //=====PARA  MOSTRAR REGISTROS EN CAJAS
            txtId.Text = gwAlumno.SelectedRow.Cells[1].Text;
            listar_buscar();

        }

        protected void gwAlumno_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //=====PARA PIE DE PAGINA
            gwAlumno.PageIndex = e.NewPageIndex;
            listar();
        }
    }
}