# Configuración del entorno y diagnóstico DevOps

| # | Problema | Fase del ciclo | Rol responsable | Práctica propuesta |
|-|-|-|-|-|
| 1 | Los despliegues se hacen una vez al mes, de forma manual por SSH, y tardan unas 6 horas | Deploy | DevOps | Automatizar el proceso de despliegue |
| 2 | Cerca del 30 % de los despliegues provoca errores en producción | Build/Deploy | DevOps | Investigar si el problema viene del codigo (dependencias, malas configurationes, o similar) o si el entorno de producción no esta bien configurado |
| 3 | No existen pruebas automatizadas y cada versión se prueba a mano durante 3 días | Build | DevOps | Implementar pruebas unitarias/integracion |
| 4 | Las caídas del sitio se detectan cuando los clientes se quejan en redes sociales | Operate | SRE | Implementar un sistema de monitoreo y observabilidad |
| 5 | Los desarrolladores esperan hasta 2 semanas para obtener un servidor de pruebas | Plan | Platform Engineering |  |
| 6 | Las contraseñas de la base de datos están escritas en el código del repositorio | Build | DevSecOps | Implementar mejores parcticas de seguridad para resguardar las contraseñas |
| 7 | Si un despliegue falla, no existe un procedimiento de reversión y la recuperación tarda horas | Deploy | SRE |  |
| 8 | El modelo de recomendación de productos se reentrena a mano cada pocos meses y nadie mide si sus predicciones empeoran | Plan | MLOps | Planificar una estrategía paso a paso para el mantenimiento y evaluación de los resultados del modelo |


### IA
| # | Problema | Fase del ciclo | Rol responsable | Práctica propuesta |
|---|---|---|---|---|
| 1 | Los despliegues se hacen una vez al mes, de forma manual por SSH, y tardan unas 6 horas | Deploy; Build/Test como etapas habilitadoras | Desarrollo y operaciones, con apoyo de Platform Engineering | Implementar un pipeline de CI/CD con validaciones previas y despliegues pequeños y frecuentes. |
| 2 | Cerca del 30 % de los despliegues provoca errores en producción | Test, Release, Deploy y Operate | Desarrollo y operaciones; SRE puede apoyar el análisis de confiabilidad | Analizar las causas de los fallos —código, pruebas, configuración o entorno— y añadir pruebas, validaciones y seguimiento posteriores al despliegue. |
| 3 | No existen pruebas automatizadas y cada versión se prueba a mano durante 3 días | Test, integrado en Build/CI | Desarrollo y QA | Incorporar pruebas unitarias y de integración en CI, y pruebas de aceptación o de extremo a extremo según el riesgo. |
| 4 | Las caídas del sitio se detectan cuando los clientes se quejan en redes sociales | Monitor/Operate | SRE y equipo responsable del servicio | Implementar métricas, logs, trazas y alertas accionables; definir objetivos de servicio (SLO) y revisar que las alertas permitan responder a tiempo. |
| 5 | Los desarrolladores esperan hasta 2 semanas para obtener un servidor de pruebas | Provision/Deploy y operación de la plataforma | Platform Engineering, en colaboración con desarrollo y seguridad | Usar infraestructura como código, entornos estandarizados y aprovisionamiento autoservicio, con controles de seguridad. |
| 6 | Las contraseñas de la base de datos están escritas en el código del repositorio | Code y Build/CI | Desarrollo y DevSecOps | Retirar las contraseñas del código y rotarlas si pudieron exponerse; usar un gestor de secretos y añadir escaneo preventivo al flujo de desarrollo y CI. |
| 7 | Si un despliegue falla, no existe un procedimiento de reversión y la recuperación tarda horas | Deploy y Operate | Equipo responsable del servicio, con apoyo de SRE | Definir y probar una estrategia de rollback, automatizarla cuando sea seguro y documentar el procedimiento de recuperación. |
| 8 | El modelo de recomendación de productos se reentrena a mano cada pocos meses y nadie mide si sus predicciones empeoran | MLOps: Train, Deploy y Monitor | MLOps y equipo responsable del modelo | Automatizar el pipeline de entrenamiento con validación del modelo y monitorear la calidad de las predicciones, la deriva y los resultados en producción. |