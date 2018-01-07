using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsLogeo
    {
        public DataTable Logeo(string usuario, string contrasena)
        {
            DataTable dt = new DataTable();
            ClsConexion cadenaconexion = new ClsConexion();
            using (SqlConnection cn = new SqlConnection())
            {
                using (SqlDataAdapter da = new SqlDataAdapter())
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cn.ConnectionString = cadenaconexion.cadenaconexion();
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "login";
                        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = usuario;
                        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = contrasena;
                        da.SelectCommand = cmd;
                        cn.Open();
                        da.Fill(dt);
                        cn.Close();
                    }
                }


            }
            return dt;
        }





    }
}