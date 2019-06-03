using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjFutShow
{
    public class clsHorario
    {
        public int IdAdmin { get; set; }
        public string Dia { get; set; }
        public int HoraInicio { get; set; }
        public int HoraCierre { get; set; }
        public decimal Precio { get; set; }
    }
}
