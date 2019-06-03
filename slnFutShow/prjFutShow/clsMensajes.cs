using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFutShow
{
    public class clsMensajes
    {
        public int IdJugador { get; set; }
        public int IdAmigo { get; set; }
        public DateTime HoraDiaEnvio { get; set; }
        public string Mensaje { get; set; }

    }
}
