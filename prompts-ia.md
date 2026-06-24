### Prompt Ejecutado
Actúa como auditor de sistemas y experto en la norma IEEE 1028. Necesito automatizar un checklist de pruebas estáticas para una aplicación C# en .NET 8. 
El checklist debe evaluar estándares de código, seguridad básica, mantenibilidad, documentación y DevOps.
Por favor, proporciona:
1. Las propiedades que deben agregarse al archivo `.csproj` para activar `.NET Analyzers` de forma estricta.
2. Un script en PowerShell (`audit-script.ps1`) que compile el proyecto simulando el pipeline de CI, capture errores de análisis estático y retorne un código de salida adecuado (0 si pasa, 1 si falla) para integrarse en un pipeline.

---

### Respuesta de la IA (Resumen de Reglas y Configuración Aplicada)

Para automatizar el checklist mediante herramientas nativas, se configuran las reglas de análisis estático directamente en el motor de compilación de .NET (Roslyn Analyzers), complementado con un script PowerShell para la orquestación.