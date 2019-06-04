using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFutShow
{
    public class clsAdminCancha
    {
        public string Nombre { get; set; }
        public string TelefonoCancha { get; set; }
        public string direccion { get; set; }
        public string Descripcion { get; set; }


        internal bool ingresarAdminCancha(string nombre, string telefono, string direccion,
            string descripcion)
        {
            var hereda = App.Current as App;

            try
            {
                hereda.con.Open();

                string sql = "insert into tbladmin_cancha values(@nombre, @telefonoCancha, @direccion, @descripcion)";

                SqlCommand cmd = new SqlCommand(sql, hereda.con);

                cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 40).Value = nombre;
                cmd.Parameters.Add("@telefonoCancha", SqlDbType.VarChar, 40).Value = telefono;
                cmd.Parameters.Add("@direccion", SqlDbType.VarChar, 40).Value = direccion;
                cmd.Parameters.Add("@descripcion", SqlDbType.Text).Value = descripcion;

                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
                
            }
            finally
            {
                hereda.con.Close();
            }
        }

        internal object consultarAdminCancha()
        {
            List<clsAdminCancha> listaAdminCancha = new List<clsAdminCancha>();

            var hereda = App.Current as App;

            hereda.con.Open();

            string sql = "select * from tbladmin_cancha";

            SqlCommand cmd = new SqlCommand(sql, hereda.con);

            SqlDataReader lector = cmd.ExecuteReader();

            while (lector.Read()) {

                clsAdminCancha objAdminCancha = new clsAdminCancha();

                objAdminCancha.Nombre = lector.GetString(1);
                objAdminCancha.TelefonoCancha = lector.GetString(2);
                objAdminCancha.direccion = lector.GetString(3);
                objAdminCancha.Descripcion = lector.GetString(4);

                listaAdminCancha.Add(objAdminCancha);


            }

            hereda.con.Close();

            return listaAdminCancha;
        }
    }
    
}
