; --------------------------------------------------------------
;  PROBLEMA DEL MONO Y LA BANANA
;  Autor: Carlos Iván Sainz Torres
; --------------------------------------------------------------

(clear)
(reset)

; --------------------------------------------------------------
;  TEMPLATES
; --------------------------------------------------------------

(deftemplate estado
   (slot mono-posicion)
   (slot caja-posicion)
   (slot banana-posicion)
   (slot mono-en-caja)   ; si el mono está sobre la caja (si/no)
   (slot tiene-banana))  ; si el mono tiene la banana (si/no)

; --------------------------------------------------------------
;  HECHOS INICIALES
; --------------------------------------------------------------

(assert
   (estado
      (mono-posicion puerta)
      (caja-posicion centro)
      (banana-posicion centro)
      (mono-en-caja no)
      (tiene-banana no))
)

; --------------------------------------------------------------
;  REGLAS DE ACCIÓN
; --------------------------------------------------------------

(defrule mover-a-caja
   ?f <- (estado (mono-posicion puerta)
                 (caja-posicion centro)
                 (mono-en-caja no))
   =>
   (printout t "El mono camina desde la puerta hacia el centro de la habitación." crlf)
   (retract ?f)
   (assert (estado (mono-posicion centro)
                   (caja-posicion centro)
                   (banana-posicion centro)
                   (mono-en-caja no)
                   (tiene-banana no)))))

(defrule subir-a-caja
   ?f <- (estado (mono-posicion centro)
                 (caja-posicion centro)
                 (mono-en-caja no))
   =>
   (printout t "El mono se sube a la caja." crlf)
   (retract ?f)
   (assert (estado (mono-posicion centro)
                   (caja-posicion centro)
                   (banana-posicion centro)
                   (mono-en-caja si)
                   (tiene-banana no)))))

(defrule tomar-banana
   ?f <- (estado (mono-en-caja si)
                 (banana-posicion centro)
                 (tiene-banana no))
   =>
   (printout t "El mono alcanza la banana y la toma." crlf)
   (retract ?f)
   (assert (estado (mono-posicion centro)
                   (caja-posicion centro)
                   (banana-posicion centro)
                   (mono-en-caja si)
                   (tiene-banana si)))))

(defrule comer-banana
   (estado (tiene-banana si))
   =>
   (printout t "El mono se come la banana. ¡Objetivo logrado!" crlf)
   (printout t "---- Fin del plan de acciones ----" crlf))

; --------------------------------------------------------------
;  EJECUCIÓN AUTOMÁTICA
; --------------------------------------------------------------

(run)