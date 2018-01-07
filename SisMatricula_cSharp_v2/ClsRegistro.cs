using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SisMatricula_cSharp_v2
{
    public class ClsRegistro
    {
        public DataSet Listar_Registro()
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
                        cmd.CommandText = "listar_registro_Rep";
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
        public DataSet Insertar_Registro(int idalumno, int idcurso, int iddocente, int Nota1, int Nota2, int Nota3, decimal promedio, string observaciones)
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
                        cmd.CommandText = "insertar_registro";
                        cmd.Parameters.Add("@idalumno", SqlDbType.Int).Value = idalumno;
                        cmd.Parameters.Add("@idcurso", SqlDbType.Int).Value = idcurso;
                        cmd.Parameters.Add("@iddocente", SqlDbType.Int).Value = iddocente;
                        cmd.Parameters.Add("@nota1", SqlDbType.Int).Value = Nota1;
                        cmd.Parameters.Add("@nota2", SqlDbType.Int).Value = Nota2;
                        cmd.Parameters.Add("@nota3", SqlDbType.Int).Value = Nota3;
                        cmd.Parameters.Add("@promedio", SqlDbType.Decimal).Value = promedio;
                        cmd.Parameters.Add("@observacion", SqlDbType.VarChar).Value = observaciones;
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
        public int Actualizar_Registro(int idalumno, int idcurso, int iddocente, int Nota1, int Nota2, int Nota3, decimal promedio, string observaciones, int id)
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
                    cmd.CommandText = "[actualizar_registro]";
                    cmd.Parameters.Add("@idcurso", SqlDbType.Int).Value = idcurso;
                    cmd.Parameters.Add("@idalumno", SqlDbType.Int).Value = idalumno;
                    cmd.Parameters.Add("@iddocente", SqlDbType.Int).Value = iddocente;
                    cmd.Parameters.Add("@nota1", SqlDbType.Int).Value = Nota1;
                    cmd.Parameters.Add("@nota2", SqlDbType.Int).Value = Nota2;
                    cmd.Parameters.Add("@nota3", SqlDbType.Int).Value = Nota3;
                    cmd.Parameters.Add("@promedio", SqlDbType.Decimal).Value = Nota1;
                    cmd.Parameters.Add("@observacion", SqlDbType.VarChar).Value = observaciones;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }

            return iret;
        }
        // ========================== ELIMINAR-EMPLEADO ==========================
        public int Eliminar_Registro(int id)
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
                    cmd.CommandText = "eliminar_registro";
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                    cn.Open();
                    iret = cmd.ExecuteNonQuery();
                    cn.Close();
                }

            }

            return iret;

        }
        // ========================== LISTAR-COMBO-EMPLEADO ==========================
        public DataTable Listar_registro_rep()
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
                        cmd.CommandText = "listar_registro";
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
        public DataSet Listar_Buscar_Registro(int id)
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
                        cmd.CommandText = "listar_buscar_registro";
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