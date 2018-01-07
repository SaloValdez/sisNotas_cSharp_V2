using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace SisMatricula_cSharp_v2
{
    public partial class form_Registro : System.Web.UI.Page
    {
        ClsRegistro obj = new ClsRegistro();
        protected void Page_Load(object sender, EventArgs e)
        {
            listar();
            txtAlerta.Visible = false;
            txtCorrecto.Visible = false;
            if (!IsPostBack) {
                cargar_combo_Alumno();
                cargar_combo_Curso();
                cargar_combo_Docente();
            
            }
        }

        private void listar()
        {   //----para listar
            gwRegistro.DataSource = obj.Listar_Registro();
            gwRegistro.DataBind();
        }


        private void cargar_combo_Alumno()
        {
            ClsAlumno oj = new ClsAlumno();
            droAlumno.DataSource = oj.Listar_Alumno();
            droAlumno.DataValueField = "idalumno";
            droAlumno.DataTextField = "nombre";
            droAlumno.DataBind();
        }
        private void cargar_combo_Curso()
        {
            ClsCurso oj = new ClsCurso();
            droCurso.DataSource = oj.Listar_curso();
            droCurso.DataValueField = "idcurso";
            droCurso.DataTextField = "nombre";
            droCurso.DataBind();
        }
        private void cargar_combo_Docente()
        {
            ClsDocente oj = new ClsDocente();
            droDocente.DataSource = oj.Listar_docente();
            droDocente.DataValueField = "iddocente";
            droDocente.DataTextField = "nombre";
            droDocente.DataBind();
        }
        private void limpiar()
        {
            txtId.Text = "";
            txtNota1.Text = "";
            txtNota2.Text = "";
            txtNota3.Text = "";
            txtPromedio.Text = "";
            txtObservacion.Text = "";
            txtAlerta.Visible = false;
            txtCorrecto.Visible = false;

        }

        private void listar_buscar()
        {
            DataSet dt = new DataSet();
            //--------------buscar id
            dt = obj.Listar_Buscar_Registro(Convert.ToInt32(txtId.Text));
            droCurso.SelectedValue = Convert.ToString(dt.Tables[0].Rows[0][1]);
            droAlumno.SelectedValue = Convert.ToString(dt.Tables[0].Rows[0][2]);

            droDocente.SelectedValue = Convert.ToString(dt.Tables[0].Rows[0][3]);
            txtNota1.Text = Convert.ToString(dt.Tables[0].Rows[0][4]);
            txtNota2.Text = Convert.ToString(dt.Tables[0].Rows[0][5]);
            txtNota3.Text = Convert.ToString(dt.Tables[0].Rows[0][6]);
            txtPromedio.Text = Convert.ToString(dt.Tables[0].Rows[0][7]);
            txtObservacion.Text = Convert.ToString(dt.Tables[0].Rows[0][8]);
           

        }


        protected void btnInsertar_Click1(object sender, EventArgs e)
        {
            if (txtNota1.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor llene los campos que faltan";
            }
            else
            {

                int num1,num2,num3;
                decimal promedio;
                string obs;

                num1 = Convert.ToInt32(txtNota1.Text);
                num2 = Convert.ToInt32(txtNota2.Text);
                num3 = Convert.ToInt32(txtNota3.Text);

                promedio = Convert.ToDecimal((num1 + num2 + num3) / 3);


                if (promedio > 10)
                {

                    obs = "Aprobado";
                }
                else {

                    obs = "Desaprobado";
                
                
                }

                //=======INSERTAR
                obj.Insertar_Registro(Convert.ToInt16(droAlumno.SelectedValue), Convert.ToInt16(droCurso.SelectedValue), Convert.ToInt16(droDocente.SelectedValue), Convert.ToInt16(txtNota1.Text), Convert.ToInt16(txtNota2.Text), Convert.ToInt16(txtNota3.Text), promedio, obs);
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



                int num1, num2, num3;
                decimal promedio;
                string obs;

                num1 = Convert.ToInt32(txtNota1.Text);
                num2 = Convert.ToInt32(txtNota2.Text);
                num3 = Convert.ToInt32(txtNota3.Text);

                promedio = Convert.ToDecimal((num1 + num2 + num3) / 3);


                if (promedio > 10)
                {

                    obs = "Aprobado";
                }
                else
                {

                    obs = "Desaprobado";


                }

                //======ACTUALIZAR
                obj.Actualizar_Registro(Convert.ToInt32(droAlumno.SelectedValue), Convert.ToInt32(droCurso.SelectedValue), Convert.ToInt32(droDocente.SelectedValue),Convert.ToInt32(txtNota1.Text), Convert.ToInt32(txtNota2.Text), Convert.ToInt32(txtNota3.Text),promedio,obs,Convert.ToInt32(txtId.Text));
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
                obj.Eliminar_Registro(Convert.ToInt16(txtId.Text));
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

        protected void gwRegistro_SelectedIndexChanged(object sender, EventArgs e)
        {   //=====PARA  MOSTRAR REGISTROS EN CAJAS
            txtId.Text = gwRegistro.SelectedRow.Cells[1].Text;
            listar_buscar();

        }

        protected void gwRegistro_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //=====PARA PIE DE PAGINA
            gwRegistro.PageIndex = e.NewPageIndex;
            listar();
        }

        protected void btnCarcular_Click(object sender, EventArgs e)
        {
            if (txtNota1.Text == "" || txtNota2.Text == "" || txtNota3.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "Por favor Ingrese las tres notas.";
            }else{
            int num1, num2, num3;
            decimal promedio;
            string obs;

            num1 = Convert.ToInt32(txtNota1.Text);
            num2 = Convert.ToInt32(txtNota2.Text);
            num3 = Convert.ToInt32(txtNota3.Text);

            promedio = Convert.ToDecimal((num1 + num2 + num3) / 3);


            if (promedio > 10)
            {

                obs = "Aprobado";
            }
            else
            {

                obs = "Desaprobado";


            }

            txtPromedio.Text = Convert.ToString(promedio);
            txtObservacion.Text = obs;
                }
        }
    }
}