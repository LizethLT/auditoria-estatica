# Evidencia de Uso de IA Generativa en la Auditoría

**Herramienta utilizada:** Claude (Anthropic)  
**Fecha:** Junio 2026  
**Integrantes del equipo:** [Nombres del equipo]

---

## Prompt 1 — Generación del Checklist y Script

### Prompt Ejecutado
Actúa como auditor de sistemas y experto en la norma IEEE 1028.
Necesito automatizar un checklist de pruebas estáticas para una
aplicación C# en .NET 8.
El checklist debe evaluar estándares de código, seguridad básica,
mantenibilidad, documentación y DevOps.
Por favor, proporciona:
1. Las propiedades que deben agregarse al archivo `.csproj` para
   activar `.NET Analyzers` de forma estricta.
2. Un script en PowerShell (`audit-script.ps1`) que compile el
   proyecto simulando el pipeline de CI, capture errores de análisis
   estático y retorne un código de salida adecuado (0 si pasa, 1 si
   falla) para integrarse en un pipeline.

### Respuesta de la IA

La IA proporcionó los siguientes artefactos y configuraciones:

**1. Configuración del `.csproj` para análisis estricto:**
```xml
<PropertyGroup>
  <AnalysisLevel>latest-all</AnalysisLevel>
  <AnalysisMode>All</AnalysisMode>
  <TreatWarningsAsErrors>true</TreatWarningsAsErrors>
  <EnforceCodeStyleInBuild>true</EnforceCodeStyleInBuild>
</PropertyGroup>

<ItemGroup>
  <PackageReference Include="Microsoft.CodeAnalysis.NetAnalyzers"
                    Version="8.0.0" />
</ItemGroup>
```

Esta configuración activa todas las reglas de análisis estático del
compilador Roslyn y convierte cualquier advertencia de calidad en un
error que frena la compilación, cumpliendo el principio de control
preventivo exigido por IEEE 1028.

**2. Script PowerShell generado (`audit-script.ps1`):**

La IA generó un script que:
- Restaura las dependencias del proyecto con `dotnet restore`
- Ejecuta `dotnet build` con los analyzers activos
- Captura el código de salida y emite un resultado legible
- Retorna `Exit 1` si hay violaciones, bloqueando el pipeline de CI/CD

**3. Checklist IEEE 1028 generado:**

La IA estructuró el checklist en 5 categorías auditables:
- Estándares de código y convenciones C# (PascalCase, camelCase,
  llaves, usings)
- Seguridad básica (validación de entradas, parsing seguro,
  exposición de datos)
- Mantenibilidad (complejidad ciclomática, SRP, manejo de
  excepciones)
- Documentación (comentarios XML `///`, nombres autodescriptivos)
- Cumplimiento DevOps (logging, TreatWarningsAsErrors)

---

## Prompt 2 — Análisis de Defectos en Program.cs

### Prompt Ejecutado
Tengo el siguiente código C# con defectos intencionales.
Actúa como auditor IEEE 1028 e identifica: hallazgos, riesgos
y recomendaciones de mitigación. También genera el código
refactorizado y seguro.

```csharp
using System;
namespace DemoAuditApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese su edad:");
            int edad = int.Parse(Console.ReadLine());
            if (edad > 18)
                Console.WriteLine("Acceso permitido");
            else
                Console.WriteLine("Acceso denegado");
        }
    }
}
```

### Respuesta de la IA

La IA identificó los siguientes defectos:

| # | Defecto | Categoría IEEE 1028 |
|---|---------|----------------------|
| 1 | `int.Parse()` sin validación causa `FormatException` | Seguridad / Robustez |
| 2 | Ausencia de bloque `try-catch` | Mantenibilidad |
| 3 | Sin documentación XML `///` | Documentación |
| 4 | Condición `> 18` excluye a personas de exactamente 18 años | Lógica de negocio |
| 5 | Sin logging ni trazabilidad | Cumplimiento DevOps |

La IA generó el código refactorizado usando `int.TryParse`,
documentación XML, corrección de lógica a `>= 18` y estructura
de clase pública, el cual fue incorporado en `audit-report.md`
como recomendación de mitigación.

---

## Conclusión del Uso de IA

El uso de IA Generativa permitió al equipo:
- Reducir el tiempo de diseño del checklist de horas a minutos
- Obtener reglas automatizables directamente desde los criterios
  IEEE 1028
- Validar hallazgos con respaldo técnico contextualizado
- Generar evidencia documental estructurada para el entregable

La IA actuó como asistente de auditoría, no como reemplazo del
juicio profesional del equipo auditor.