using System;

namespace DemoAuditApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese su edad:");
            int edad = int.Parse(Console.ReadLine()); // Defecto: Falta validación, riesgo de formato incorrecto o nulo. No hay try-catch.
            
            if (edad > 18) // Defecto: Lógica débil, ¿qué ocurre si tiene exactamente 18 años? Falta de llaves.
            {
                Console.WriteLine("Acceso permitido");
            }
            else
            {
                Console.WriteLine("Acceso denegado");
            }
        }
    }
}