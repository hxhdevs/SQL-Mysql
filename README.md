"# SQL-Mysql" 
## 60 Uso de transacciones en MySQL
Una transaccion se elabora mas del lado backend con
START TRANSACTION;

CUERPO

ROLLBACK;
COMMIT;
## 61 Eventos en el motor de MySQL
Los eventos funcionan mas a nivel tabla, no sirve para respaldos(hacer con cron),
estos son la programacion de una tarea en cierta condicion determinada
periodicamente por el usuario, permite dar mantenimiento a la tabla desde el motor
sin intervenccion del lenguaje(back-end)
