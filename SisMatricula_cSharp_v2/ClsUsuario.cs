using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsUsuario
    {
        public DataSet Listar_Usuario()
        {
            DataSet ds = new DataSet();
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
                        cmd.CommandText = "listar_usuario";
                        da.SelectCommand = cmd;
                        cn.Open();
                        da.Fill(ds);
                        cn.Close();
                    }
                }
            }
            return ds;
        }
        // ========================== INSERTAR-EMPLEADO ==========================
        public DataSet Insertar_Usuario(string usuario, string contrasena)
        {
            DataSet ds = new DataSet();
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
                        cmd.CommandText = "insertar_usuario";
                        cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = usuario;
                        cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = contrasena;
                        da.SelectCommand = cmd;
                        cn.Open();
                        da.Fill(ds);
                        cn.Close();
                    }
                }
            }
            return ds;
        }

        // ========================== ACTUALIZAR-EMPLEADO ==========================
        public int Actualizar_Usuario(string usuario, string contrasena, int id)
        {
            int iret;
            ClsConexion cadenaconexion = new ClsConexion();
            using (SqlConnection cn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cn.ConnectionString = cadenaconexion.cadenaconexion();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "actualizar_usuario";
                    cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = usuario;
                    cmd.Parameters.Add("@contrasena", SqlDbType.VarChar).Value = contrasena;

                    cmd.Parameters.Add("@idusuario", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }

            return iret;
        }
        // ========================== ELIMINAR-EMPLEADO ==========================
        public int Eliminar_Usuario(int id)
        {
            int iret;
            ClsConexion cadenaconexion = new ClsConexion();
            using (SqlConnection cn = new SqlConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cn.ConnectionString = cadenaconexion.cadenaconexion();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "eliminar_usuario";
                    cmd.Parameters.Add("@idusuario", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }

            return iret;

        }
        // ========================== LISTAR-COMBO-EMPLEADO ==========================
        public DataSet Listar_usuario_rep()
        {
            DataSet ds = new DataSet();
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
                        cmd.CommandText = "listar_usuario";
                        da.SelectCommand = cmd;
                        cn.Open();
                        da.Fill(ds);
                        cn.Close();
                    }
                }
            }
            return ds;
        }
        // ========================== BUSACAR-POR-ID EMPLEADO ==========================
        public DataSet Listar_Buscar_Usuario(int id)
        {
            DataSet ds = new DataSet();
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
                        cmd.CommandText = "listar_buscar_usuario";
                        cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                        da.SelectCommand = cmd;
                        cn.Open();
                        da.Fill(ds);
                        cn.Close();
                    }
                }
            }
            return ds;
        }
    
    
    }
}