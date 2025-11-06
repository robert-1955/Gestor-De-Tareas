Algoritmo GestorDeTareas_v1_1
	Definir tareas, estado Como Cadena
	Definir opcion, i, numTareas, tareaSeleccionada Como Entero
	Dimension tareas[100], estado[100]
	numTareas <- 0
	
	Repetir
		Limpiar Pantalla
		Escribir "GESTOR DE TAREAS v1.1"
		Escribir "1. Agregar tarea"
		Escribir "2. Ver todas las tareas"
		Escribir "3. Ver tareas completadas"
		Escribir "4. Marcar tarea como completada"
		Escribir "5. Eliminar tarea"
		Escribir "6. Salir"
		Escribir "Elige una opción:"
		Leer opcion
		
		Segun opcion Hacer
			1:
				Si numTareas < 100 Entonces
					numTareas <- numTareas + 1
					Escribir "Ingresa la nueva tarea:"
					Leer tareas[numTareas]
					estado[numTareas] <- "Pendiente"
					Escribir "Tarea agregada con éxito."
				SiNo
					Escribir "No se pueden agregar más tareas."
				FinSi
				
			2:
				Si numTareas = 0 Entonces
					Escribir "No hay tareas registradas."
				SiNo
					Escribir "TODAS LAS TAREAS"
					Para i <- 1 Hasta numTareas Hacer
						Escribir i, ". ", tareas[i], " - Estado: ", estado[i]
					FinPara
				FinSi
				
			3:
				Definir hayCompletadas Como Logico
				hayCompletadas <- Falso
				Para i <- 1 Hasta numTareas Hacer
					Si estado[i] = "Completada" Entonces
						Si hayCompletadas = Falso Entonces
							Escribir "TAREAS COMPLETADAS"
							hayCompletadas <- Verdadero
						FinSi
						Escribir i, ". ", tareas[i]
					FinSi
				FinPara
				Si hayCompletadas = Falso Entonces
					Escribir "No tienes tareas completadas aún."
				FinSi
				
			4:
				Si numTareas = 0 Entonces
					Escribir "No hay tareas para marcar."
				SiNo
					Escribir "Ingresa el número de la tarea a marcar como completada:"
					Leer tareaSeleccionada
					Si tareaSeleccionada >= 1 Y tareaSeleccionada <= numTareas Entonces
						Si estado[tareaSeleccionada] = "Completada" Entonces
							Escribir "Esa tarea ya estaba completada."
						SiNo
							estado[tareaSeleccionada] <- "Completada"
							Escribir "Tarea marcada como completada."
						FinSi
					SiNo
						Escribir "Número de tarea inválido."
					FinSi
				FinSi
				
			5:
				Si numTareas = 0 Entonces
					Escribir "No hay tareas para eliminar."
				SiNo
					Escribir "Ingresa el número de la tarea a eliminar:"
					Leer tareaSeleccionada
					Si tareaSeleccionada >= 1 Y tareaSeleccionada <= numTareas Entonces
						Para i <- tareaSeleccionada Hasta numTareas-1 Hacer
							tareas[i] <- tareas[i+1]
							estado[i] <- estado[i+1]
						FinPara
						numTareas <- numTareas - 1
						Escribir "Tarea eliminada correctamente."
					SiNo
						Escribir "Número de tarea inválido."
					FinSi
				FinSi
		FinSegun
		
		Escribir ""
		Escribir "Presiona ENTER para continuar..."
		Esperar Tecla
	Hasta Que opcion = 6
	
	Escribir "Gracias por usar el Gestor de Tareas v1.1!"
FinAlgoritmo

