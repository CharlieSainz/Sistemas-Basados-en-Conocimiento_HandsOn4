# Sistemas-Basados-en-Conocimiento_HandsOn4
Assignments de la materia de Sistemas Basados en Conocimiento (Monkey and Banana)

# Sistema Basado en Conocimiento - Monkey and Banana

## Descripción general
Este proyecto fue hecho en CLIPS y representa el clásico problema del mono y la banana.  
El objetivo es que el sistema muestre paso a paso las acciones que el mono debe realizar para alcanzar y comerse la banana, usando reglas lógicas.

## Componentes del sistema
El sistema usa una base de conocimiento con hechos y reglas.

### Hechos
Representan el estado actual del entorno:
- Dónde está el mono (puerta o centro)
- Dónde está la caja
- Dónde está la banana
- Si el mono está sobre la caja o no
- Si el mono ya tiene la banana

### Reglas
Cada regla indica una acción que el mono puede hacer:
1. Moverse hacia la caja.
2. Subirse a la caja.
3. Tomar la banana.
4. Comer la banana.
