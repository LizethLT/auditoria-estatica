# Reporte de Auditoría de Calidad y Pruebas Estáticas

**Proyecto:** DemoAuditApp  
**Normativa Aplicada:** IEEE 1028 (Auditoría e Inspección de Software)  
**Estado del Pipeline:** ❌ RECHAZADO (FALLIDO)

---

## 1. Hallazgos y Defectos Detectados
El análisis estático automatizado y la revisión por pares identificaron las siguientes inconformidades en `Program.cs`:

1. **Vulnerabilidad de Denegación de Servicio Local / Bloqueo Inesperado:** El método `int.Parse(Console.ReadLine())` no realiza ninguna validación previa de datos. Si un usuario ingresa una cadena no numérica o un valor nulo, la aplicación arrojará una excepción no controlada (`FormatException` / `ArgumentNullException`) interrumpiendo abruptamente la ejecución.
2. **Ausencia de Bloques Estructurados de Manejo de Excepciones:** No existe una estructura `try-catch` que mitigue errores en tiempo de ejecución.
3. **Omisión de Estándares de Documentación:** Ausencia total de documentación técnica interna (comentarios XML de tipo `///`) requerida para la mantenibilidad a largo plazo.
4. **Lógica de Control Débil:** La condición `if (edad > 18)` excluye de manera errónea el valor exacto de `18` del bloque de "Acceso permitido", cuando de acuerdo a los parámetros legales estándar en la región de Tarija, la mayoría de edad se consolida precisamente a los 18 años.

---

## 2. Matriz de Riesgos

| ID | Riesgo Identificado | Probabilidad | Impacto | Efecto Sistémico |
|---|---|---|---|---|
| **R-01** | Caídas concurrentes del sistema por entradas maliciosas o erróneas de usuarios. | Alta | Alto | Inestabilidad del servicio y mala experiencia de usuario. |
| **R-02** | Incremento de la Deuda Técnica por falta de documentación y estándares homogéneos. | Media | Media | Dificultad severa para la inducción de nuevos desarrolladores en el equipo. |
| **R-03** | Errores en las reglas del negocio en ambientes de producción debido a lógica ambigua. | Alta | Alto | Violación de requisitos funcionales y potenciales contingencias legales. |

---

## 3. Recomendaciones de Mitigación (Prevención y Visión Sistémica)

Para transformar estas prácticas reactivas en un modelo robusto de prevención continua, el equipo de auditores propone la reestructuración completa del componente bajo el siguiente estándar preventivo:

### Solución de Código Refactorizado y Seguro:
```csharp
using System;

namespace DemoAuditApp
{
    /// <summary>
    /// Clase principal encargada de orquestar el control de accesos de la aplicación.
    /// </summary>
    public static class Program
    {
        /// <summary>
        /// Punto de entrada del programa. Solicita y valida de manera segura la edad ingresada.
        /// </summary>
        /// <param name="args">Argumentos de la línea de comandos.</param>
        public static void Main(string[] args)
        {
            Console.WriteLine("Ingrese su edad:");
            string? entrada = Console.ReadLine();

            // Prevención integral de errores de conversión y nulos
            if (!int.TryParse(entrada, out int edad))
            {
                Console.WriteLine("Error: La entrada proporcionada no es un número válido.");
                return;
            }

            // Corrección de lógica de negocio (Inclusión estricta de la mayoría de edad)
            if (edad >= 18)
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