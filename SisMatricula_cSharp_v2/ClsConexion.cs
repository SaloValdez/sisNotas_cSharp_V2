using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisMatricula_cSharp_v2
{
    public class ClsConexion
    {

        public string cadenaconexion()
        {
            string cn = "Data Source=SALONET;Initial Catalog=DBNOTAS;Integrated Security=True";
            return cn;
        }
    }
}