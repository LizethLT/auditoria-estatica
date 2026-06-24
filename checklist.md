# Checklist de Auditoría Estática de Código (Basado en IEEE 1028)

## 1. Estándares de Código y Buenas Prácticas C#
- [ ] ¿El código sigue las convenciones de nombres oficiales de Microsoft (PascalCase para clases/métodos, camelCase para variables locales)?
- [ ] ¿Se evita el uso de números mágicos (valores "hardcoded") en la lógica de negocio?
- [ ] ¿Las llaves `{}` están correctamente formateadas y alineadas en bloques condicionales?
- [ ] ¿Se eliminan los `using` innecesarios y las dependencias sin utilizar en el archivo?

## 2. Seguridad Básica
- [ ] ¿Las entradas del usuario a través de `Console.ReadLine()` o APIs externas están sanitizadas y validadas antes de procesarse?
- [ ] ¿Se evita el desbordamiento de tipo (Buffer/Type Overflow) al realizar conversiones (`parsing`) explícitas?
- [ ] ¿Existe exposición inadvertida de datos sensibles o vulnerabilidades de inyección?

## 3. Mantenibilidad y Complejidad
- [ ] ¿La complejidad ciclomática de los métodos se mantiene baja (idealmente < 10)?
- [ ] ¿El método principal o las funciones tienen una única responsabilidad (Single Responsibility Principle)?
- [ ] ¿Se implementa un manejo estructurado de excepciones (`try-catch`) para prevenir fallos catastróficos inesperados?

## 4. Documentación
- [ ] ¿Las clases y métodos públicos cuentan con comentarios XML (`///`) explicativos?
- [ ] ¿El código es autodocumentado mediante nombres de variables claros que describen su propósito?

## 5. Cumplimiento DevOps
- [ ] ¿El proyecto incorpora un mecanismo centralizado de registro de eventos (Logging) para auditar fallos en producción?
- [ ] ¿La configuración del proyecto obliga a tratar las advertencias de compilación como errores (`TreatWarningsAsErrors`) para evitar deuda técnica?