using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace SisMatricula_cSharp_v2
{
    public partial class Login : System.Web.UI.Page
    {
        ClsLogeo obj = new ClsLogeo();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtAlerta.Visible = false;
        }

     

        protected void txtEntrar_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "" || txtContrasena.Text == "")
            {
                txtAlerta.Visible = true;
                txtAlerta.Text = "!Campos vacios! Por favor ingrese lso datos";
            }
            else { 
                DataTable dt = new DataTable();
                dt = obj.Logeo(txtUsuario.Text, txtContrasena.Text);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
                txtAlerta.Visible = true;
                txtAlerta.Text = "Contraseña o Usuario Incorrectos";

            }
        }

    }
}