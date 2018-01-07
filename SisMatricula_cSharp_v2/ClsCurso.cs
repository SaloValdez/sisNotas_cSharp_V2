using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsCurso
    {
        public DataSet Listar_curso()
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
                        cmd.CommandText = "listar_curso";
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
        public DataSet Insertar_curso(string nombre)
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
                        cmd.CommandText = "insertar_curso";
                        cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = nombre;
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
        public int Actualizar_curso(string nombre, int id)
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
                    cmd.CommandText = "actualizar_curso";
                    cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = nombre;
                    cmd.Parameters.Add("@idcurso", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }

            return iret;
        }
        // ========================== ELIMINAR-EMPLEADO ==========================
        public int Eliminar_curso(int id)
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
                    cmd.CommandText = "eliminar_curso";
                    cmd.Parameters.Add("@idcurso", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }

            return iret;

        }
        // ========================== LISTAR-COMBO-EMPLEADO ==========================
        public DataSet Listar_curso_rep()
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
                        cmd.CommandText = "listar_curso";
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
        public DataSet Listar_Buscar_Curso(int id)
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
                        cmd.CommandText = "listar_buscar_curso";
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