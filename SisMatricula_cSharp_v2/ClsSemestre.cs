using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsSemestre
    {
        public DataSet Listar_Semestre()
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
                        cmd.CommandText = "listar_semestre";
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
        public DataSet Insertar_Semestre(string descripcion)
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
                        cmd.CommandText = "insertar_semestre";
                        cmd.Parameters.Add("@descripcion", SqlDbType.VarChar).Value = descripcion;
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
        public int Actualizar_Semestre(string descripcion, int id)
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
                    cmd.CommandText = "actualizar_semestre";
                    cmd.Parameters.Add("@descripcion", SqlDbType.VarChar).Value = descripcion;
                    cmd.Parameters.Add("@idsemestre", SqlDbType.Int).Value = id; 
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }

            return iret;
        }
        // ========================== ELIMINAR-EMPLEADO ==========================
        public int Eliminar_Semestre(int id)
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
                    cmd.CommandText = "eliminar_semestre";
                    cmd.Parameters.Add("@idsemestre", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }

            return iret;

        }
        // ========================== LISTAR-COMBO-EMPLEADO ==========================
        public DataSet Listar_semestre_rep()
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
                        cmd.CommandText = "listar_semestre";
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
        public DataSet Listar_Buscar_Semestre(int id)
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
                        cmd.CommandText = "listar_buscar_semestre";
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