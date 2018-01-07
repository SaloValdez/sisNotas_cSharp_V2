using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsAlumno
    {
        public DataSet Listar_Alumno()
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
                        cmd.CommandText = "listar_alumno";
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
        public DataSet Insertar_Alumno(string nombre, string apellido, string direccion, int carrera, int semestre)
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
                        cmd.CommandText = "insertar_alumno";
                        cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = nombre;
                        cmd.Parameters.Add("@apellido", SqlDbType.VarChar).Value = apellido;
                        cmd.Parameters.Add("@direccion", SqlDbType.VarChar).Value = direccion;
                        cmd.Parameters.Add("@carrera", SqlDbType.Int).Value = carrera;
                        cmd.Parameters.Add("@semestre", SqlDbType.Int).Value = semestre;
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
        public int Actualizar_Alumno(string nombre, string apellido, string direccion, int carrera, int semestre, int id)
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
                    cmd.CommandText = "actualizar_alumno";
                    cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = nombre;
                    cmd.Parameters.Add("@apellido", SqlDbType.VarChar).Value = apellido;
                    cmd.Parameters.Add("@direccion", SqlDbType.VarChar).Value = direccion;
                    cmd.Parameters.Add("@carrera", SqlDbType.Int).Value = carrera;
                    cmd.Parameters.Add("@semestre", SqlDbType.Int).Value = semestre;
                    cmd.Parameters.Add("@idalumno", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }

            return iret;
        }
        // ========================== ELIMINAR-EMPLEADO ==========================
        public int Eliminar_alumno(int id)
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
                    cmd.CommandText = "eliminar_alumno";
                    cmd.Parameters.Add("@idalumno", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }

            return iret;

        }
        // ========================== LISTAR-COMBO-EMPLEADO ==========================
        public DataTable Listar_alumno_rep()
        {
            DataTable ds = new DataTable();
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
                        cmd.CommandText = "listar_alumno_rep";
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
        public DataSet Listar_Buscar_alumno(int id)
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
                        cmd.CommandText = "listar_buscar_alumno";
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


        public DataSet Listar_Alumno_Combo()
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
                        cmd.CommandText = "listar_alumno_combo";
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