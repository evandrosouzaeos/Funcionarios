//------------------------------------------------------------------------------
// <auto-generated>
//    O código foi gerado a partir de um modelo.
//
//    Alterações manuais neste arquivo podem provocar comportamento inesperado no aplicativo.
//    Alterações manuais neste arquivo serão substituídas se o código for gerado novamente.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Funcionarios
{
    using System;
    using System.Collections.Generic;
    
    public partial class Setor
    {
        public Setor()
        {
            this.funcionario = new HashSet<funcionario>();
        }
    
        public int id { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
    
        public virtual ICollection<funcionario> funcionario { get; set; }
    }
}
