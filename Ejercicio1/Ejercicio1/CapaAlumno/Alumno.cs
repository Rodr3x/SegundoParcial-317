using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAlumno
{
    // Alumno.cs
    public class Alumno
    {
        private string[,] datosAlumnos = {
            { "123456789", "Juan Pérez", "19 años", "8.5" },
            { "987654321", "María García", "20 años", "9.2" },
            { "567891234", "Carlos López", "21 años", "7.8" },
            { "345678912", "Ana Martínez", "22 años", "8.0" },
            { "901234567", "Pedro Sánchez", "20 años", "8.9" },
            { "789123456", "Laura Rodríguez", "19 años", "7.5" },
            { "654321789", "Diego Gómez", "23 años", "9.5" },
            { "432198765", "Lucía Fernández", "21 años", "8.3" },
            { "876543219", "Sofía González", "20 años", "8.7" },
            { "210987654", "Javier Ramírez", "22 años", "9.0" }
        };


        public string ObtenerDatos(string ci)
        {
            string datos = "";

            // Buscar el alumno por CI
            for (int i = 0; i < datosAlumnos.GetLength(0); i++)
            {
                if (datosAlumnos[i, 0] == ci)
                {
                    datos = $"Nombre: {datosAlumnos[i, 1]}\n" +
                            $"Edad: {datosAlumnos[i, 2]}\n" +
                            $"Nota Promedio: {datosAlumnos[i, 3]}";
                    break;
                }
            }

            return datos;
        }
    }

}
