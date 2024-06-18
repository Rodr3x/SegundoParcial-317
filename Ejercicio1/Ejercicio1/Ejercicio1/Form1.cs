using CapaAlumno;
namespace Ejercicio1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Alumno alumno = new Alumno();
            String datos = "";
            String ci = textBox1.Text;
            datos = alumno.ObtenerDatos(ci);
            if (datos != "")
                MessageBox.Show(datos);
            else
                MessageBox.Show("ALUMNO NO EXISTE / NO ENCONTRADO");

        }
    }
}
