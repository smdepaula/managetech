Algoritmo ProyectoFinal
	Dimension Libros[50]
	Dimension Estudiantes[50]
	Definir indLibro,indEstudiante,Opc Como Entero
	indLibro <- 1; Opc <- 0; indEstudiante <- 1
	Repetir
		Escribir 'Elige una opción'
		Escribir '1. Registrar estudiante'
		Escribir '2. Registrar libro'
		Escribir '3. Prestar libro'
		Escribir '4. Devolver libro'
		Escribir '5. Ver libros'
		Escribir '6. Salir'
		Leer Opc
		Borrar Pantalla
		Segun Opc  Hacer
			1:
				Estudiantes[indEstudiante] <- NuevoEstudiante
				indEstudiante <- indEstudiante+1
				Escribir 'Presione una tecla para continuar'
				Esperar Tecla
				Borrar Pantalla
			2:
				Libros[indLibro] <- NuevoLibro
				indLibro <- indLibro+1
				Escribir 'Presione una tecla para continuar'
				Esperar Tecla
				Borrar Pantalla
			3:
				Si Longitud(Estudiantes[1])>0 Y Longitud(Libros[1])>0 Entonces
					Escribir 'Escoge un libro'
					Para i<-1 Hasta 50 Hacer
						Si Libros[i]<>'' Entonces
							Escribir i,'. ',Libros[i]
						FinSi
					FinPara
					Leer lib
					Escribir 'Escoge un estudiante'
					Para i<-1 Hasta 50 Hacer
						Si Estudiantes[i]<>'' Entonces
							Escribir i,'. ',Estudiantes[i]
						FinSi
					FinPara
					Leer est
					Si PrestarLibro(Libros[lib])<>'F' Entonces
						Libros[lib] <- PrestarLibro(Libros[lib])
						Estudiantes[est] <- Estudiantes[est]+' | '+Libros[lib]
					SiNo
						Escribir 'Este libro no está disponible'
					FinSi
					Borrar Pantalla
				SiNo
					Escribir 'Debe registrar datos'
				FinSi
				Escribir 'Presione una tecla para continuar'
				Esperar Tecla
				Borrar Pantalla
			4:
				Si Longitud(Libros[1])>0 Entonces
					Escribir 'Escoge un libro'
					Para i<-1 Hasta 50 Hacer
						Si Libros[i]<>'' Entonces
							Escribir i,'. ',Libros[i]
						FinSi
					FinPara
					Leer lib
					Escribir DevolverLibro(Libros[lib])
					Para i<-1 Hasta 50 Hacer
						a <- Longitud(Estudiantes[i])
						b <- a-Longitud(Libros[lib])
						resto <- Subcadena(Estudiantes[i],b,a)
						Si resto=Libros[lib] Entonces
							Escribir 'Hola'
						FinSi
					FinPara
					Esperar Tecla
					Borrar Pantalla
				SiNo
					Escribir 'Debe registrar datos'
				FinSi
				Escribir 'Presione una tecla para continuar'
				Esperar Tecla
				Borrar Pantalla
			5:
				Para i<-1 Hasta 50 Hacer
					Si Libros[i]<>'' Entonces
						Escribir i,'. ',Libros[i]
					FinSi
				FinPara
				Si Libros[1]='' Entonces
					Escribir 'No hay libros Registrados'
				FinSi
				Esperar Tecla
				Borrar Pantalla
		FinSegun
	Hasta Que Opc>5
	Imprimir "Saúl del Carmen Montas | 19-SIIN-1-086"
	Imprimir "Samuel Félix De Paula Rodríguez | 19-SIIN-1-070"
	Imprimir "Feliz R. Tavárez.B | 19-SIIN-1-051"
FinAlgoritmo

Funcion Alumno = NuevoEstudiante()
	Escribir 'Ingrese el nombre'
	Leer Nombre
	Escribir 'Ingrese la carrera'
	Leer Carrera
	Escribir 'Ingrese la matricula'
	Leer Matricula
	Alumno <- Nombre+' | '+Carrera+' | '+Matricula
FinFuncion

Funcion libro = NuevoLibro()
	Escribir 'Ingrese el título'
	Leer Titulo
	Escribir 'Ingrese el autor'
	Leer Autor
	Estado <- 'Disp.'
	libro <- Titulo+' | '+Autor+' | '+Estado
FinFuncion

Funcion Obra = PrestarLibro(libro)
	long <- Longitud(libro)
	j <- long-5
	Prestado <- Concatenar(Subcadena(libro,1,j),'Pres.')
	Si Subcadena(libro,j,long)=' Disp.' Entonces
		Obra <- Prestado
	SiNo
		Obra <- 'F'
	FinSi
FinFuncion

Funcion Devolver = DevolverLibro(libro)
	longlibro <- Longitud(libro)
	j <- longlibro-5
	Devuelto <- Concatenar(Subcadena(libro,1,j),'Disp.')
	Devolver <- Devuelto
FinFuncion
