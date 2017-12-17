# Proyecto - Procesamiento del Lenguaje Natural 📊

* **Asignatura**: Tecnologías de la Información para las Organizaciones - ULL
* **Año**: 2017/2018
* **Grado**: Ingeniería Informática
* **Itinerario**: Tecnologias de la Información

## Introducción 📙

Proyecto final de la asignatura *Tecnologías de la Información para las Organizaciones* (TIO), en la *Universidad de La Laguna* (ULL), el cual se basa en la aplicación de las tecnologías del procesamiento natural en la evaluación de contenidos dirigidos a una asignatura en concreto *(Arquitectura Avanzada de Computadores)*.

## Tecnologías empleadas

* **R**: Lenguaje de programación enfocado al análisis estadístico   ![](https://i.imgur.com/h8rtuGV.png)
* **R Studio**: IDE para el lenguaje de programación R   ![](https://i.imgur.com/zYKNr5d.png)
* **PostgreSQL**: Sistema gestor de bases de datos relaciones y libre   ![](https://i.imgur.com/X9UgIa8.png)

## Objetivos a cumplir ✅

Como hemos descrito anteriormente, necesitamos aplicar **tecnologías del procesamiento natural del lenguaje** a contenidos de una asginatura en concreto, con los que el profesor, al poder ver constrastada y comparada la información de los resultados de diversos cuestionarios (con preguntas iguales o similares en dos o más años distintos), podrá conocer sí, dando el mismo temario (o distinto), los alumnos responden de forma similar a las mismas preguntas de un año a otro.

Se nos cederá una *base de datos* en PostgreSQL con los datos de las preguntas realizadas por el profesor y una recopilación de las respuestas dadas por los alumnos de la asignatura a lo largo de los años.

El **fin de proyecto** es *realizar una comparación entre las distintas respuestas dadas por los alumnos a unas determinadas preguntas formuladas durante diversos años para así, poder observar cual es el grado de igualdad entre estas respuestas en función del temario impartido en la asignatura*.

Para ello, debemos cumplir los siguientes objetivos:
* Comprender las relaciones entre las múltiples tablas dadas en la base de datos ⚠️
* Obtener el conjunto de respuestas en función de sus correspondientes preguntas en años ⚠️
* Exportar estos datos a texto plano para poder tratarlos en R ⚠️
* Aplicar diversas transformaciones a los resultados para obtener un porcentaje de cercanía entre cursos ⚠️

## Conclusiones y resultados 🏁

Tras hacer un estudio en profundidad de los datos y tratar con ellos, en este caso, las respuestas dadas por los alumnos en los años **2009** y **2010** de la asignatura **Arquitectura Avanzada de Computadores** tienes un **índice de similitud del 87% entre las respuestas de ambos años**, por lo que podemos decir que hay un alto porcentaje de similitud entre las respuestas dadas por los alumnos en los dos años para las mismas preguntas.

Además, podemos observar que la **nubes de palabras** de, valga la redundancia, las palabras más repetidas en cada año son casi las mismas (a mayor tamaño, mayor número de veces que aparece en las respuestas):

![Nube-2009][1] ![Nube-2010][2]

 [1]: https://i.imgur.com/99SmLsK.png
 [2]: https://i.imgur.com/eZXArwi.png

Se puede observar como en ambas nubes de palabras como **"instrucciones", "anteriores", "ejecución" o "datos"** son muy repetidas en ambos años.

La nube de palabras resultante de la unión de los dos corpus se asemeja mucho a las nubes de palabras de los corpus individuales, como se puede ver en la siguiente imagen:

<center><img src="https://i.imgur.com/pe3uuGz.png" alt="nube" height="250" width="250"></center>

## Autores 👥
* [Néstor García Moreno]()
* [Darwin González Suárez]()
* [Carlos Andrés Castro García]()
* [Omar Mendo Mesa](https://ozzrocker95.github.io/)
* Cristina González Pacheco
* José Luis Doblado González