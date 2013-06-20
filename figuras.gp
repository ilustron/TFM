#!/usr/bin/gnuplot

set terminal epslatex mono
set output "test.tex"
test
set output
reset

#VECTORES TANGENTES

set terminal epslatex size 2.5,1.75 mono 
set output "vectores_tangentes-fig.tex"

unset key
unset border
unset tics

set view 30,45,1.5,1
set hidden3d

set isosamples 9

set style arrow 1 head size 0.1,30,90 filled

set arrow 5 arrowstyle 1 from 0,0,0 to 0.8,0,0 front
set arrow 6 arrowstyle 1 from 0,0,0 to 0,-0.8,0 front

set arrow 1 from 1,1,0 to -1,1,0 nohead 
set arrow 2 from -1,1,0 to -1,-1,0 nohead 
set arrow 3 from -1,-1,0 to 1,-1,0 nohead 
set arrow 4 from 1,-1,0 to 1,1,0 nohead 

set label '$\vec{t}_1$' at 0.5,0,0.8 center front
set label '$\vec{t}_2$' at  0,-0.5,0.8 center front
set label '$P$' at  0,0,0 center front point pt 7 ps 1 offset 0,0.3,0
set label '$T_P S$' at  1,1,0.8 center front

splot [-1.2:1.2][-1.2:1.2] -x**2-y**2 w l lc rgb 'gray50'

set output
reset

#COORDENADAS INTERNAS

set terminal epslatex mono 
set output "coordenadas_internas-fig.tex"

unset key
unset border
unset tics

set view equal xy
set view 0,0,2,1
set isosamples 7
set hidden3d

set style arrow 1 head size 0.05,30,90 filled

set arrow arrowstyle 1 from 0,0,0 to 0.16,0,0 front
set arrow arrowstyle 1 from 0,0,0 to 0,0.16,0 front
set arrow arrowstyle 1 from 0,0,0 to 0.5,0.5,0 front

set label '{\Large $\mathbf{x}_1$}' at -0.04,0.08,0 center front
set label '{\Large $\mathbf{x}_2$}' at  0.08,-0.04,0 center front
set label '{\Large $\mathbf{x}$}' at  0.30,0.25,0 center front


splot [0:1][0:1][-0.1:0.1] 0 w l lc rgb 'gray50'

reset

#COORDENADAS EXTERNAS

set terminal epslatex mono 
set output "coordenadas_externas-fig.tex"

unset key
unset border
unset tics

set view equal xy
set view 45,45,1.5,1
set isosamples 7
set hidden3d

set style arrow 1 head size 0.02,30,90 filled

set arrow arrowstyle 1 from 0,-0.25,0.25 to 0.2,-0.25,0.25 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0,-0.05,0.25 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0,-0.25,0.35 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0.5,0.5,0 front

set label '{\Large $\vec{i}$}' at 0.1,-0.3,0.25 center front
set label '{\Large $\vec{j}$}' at -0.05,-0.15,0.25 center front
set label '{\Large $\vec{k}$}' at  0,-0.3,0.32 center front
set label '{\Large $\vec{r}(\mathbf{x})$}' at  0.25,0.125,0.150 center front

splot [0:1][0:1] (x-0.5)**2-(y-0.5)**2 w l lc rgb 'gray50'

set output
reset

#CAMPO MEDIO = MONGE

set terminal epslatex mono 
set output "campo_medio-fig.tex"

unset key
unset border
unset tics

set view equal xy
set view 50,135,1.25,1
set isosamples 7
set hidden3d

set style arrow 1 head size 0.02,30,90 filled
set style arrow 2 head size 0.02,30,90 empty

set arrow arrowstyle 1 from 1,0,0 to 1,0.2,0 front
set arrow arrowstyle 2 from 1,0,0 to 1,0.1,0 front
set arrow arrowstyle 1 from 1,0,0 to 0.8,0,0 front
set arrow arrowstyle 2 from 1,0,0 to 0.9,0,0 front
set arrow arrowstyle 2 from 1,0,0 to 1,0,0.1 front

set label '$\zeta\mathbf{x}_1\equiv\vec{i}$' at 1.14,0.1,0 center front
set label '$\zeta\mathbf{x}_2\equiv\vec{j}$' at 0.75,0.12,0 center front
set label '$\vec{k}$' at 1.1,0,0.15 center front

splot [0:1][0:1] 2*(x-0.5)**3-2*(y-0.5)**3-0.3*rand(0)+0.2 w l lc rgb 'black',0 w l lt 3 lc rgb 'gray40'
set output
reset

#CAMPO MEDIO = ENERGÍA LIBRE

set terminal epslatex mono 
set output "energia_libre_CM-fig.tex"
f(x,a) = x<a ? sqrt(a-2*x) : 0 # Magnetization
g(x,b) = 0.25*x**4 + b*x**2 # Free Energy
set multiplot
set grid
set ylabel '$\zeta_0$' offset 2,0
set xlabel '$t$' offset 0,0.3
plot [-3:2.5][-1.5:2] f(x,0) notitle w l lw 3
unset grid
unset tics
unset xtics
unset ytics
unset key
unset ylabel
set xlabel '$\zeta$' offset 0,0.3
set tmargin 0; set bmargin 0; set rmargin 0; set lmargin 0
set size 0.2
set origin 0.220,0.530
clear

set title '$f(\zeta,t<0)$' offset 0,-1
plot [-2.5:2.5][-1.5:2] g(x,-1) 
set origin 0.475,0.225
clear

set title '$f(\zeta,t=0)$' offset 0,-1
plot [-2.5:2.5][-0.5:3] g(x,0)
set origin 0.700,0.550
clear

set title '$f(\zeta,t>0)$' offset 0,-1
plot [-2.5:2.5][-0.5:3] g(x,1)

unset multiplot

set output
reset

#FASE PLANA

set terminal epslatex mono 
set output "fase_plana-fig.tex"

set view equal xyz
set xyplane at 30
set view 50,299,1.70,1

set hidden3d
unset key
unset border
unset tics
splot "./source_plots/snapshot_x_L64_K2.0-64.dat" with l lc rgb 'gray50'
reset

#FASE ARRUGADA

set terminal epslatex mono 
set output "fase_arrugada-fig.tex"

set view equal xyz
set view 82,63,1.9,1
set xyplane at 0
set hidden3d
unset key
unset border
unset tics
splot "./source_plots/snapshot_x_L64_K0.5-999.dat" with l lc rgb 'gray50'
reset

#FASE ARRUGADA

set terminal epslatex mono 
set output "deformacion-fig.tex"

set view 65,45,1.2,1
set xyplane at 0
set hidden3d

unset key
unset border
unset tics

h(x,y)=-0.5*x**2+0.5*y**2+3
dhx(x)=-x
dhy(y)=y

set style arrow 1 head size 0.02,30,90 filled

set arrow arrowstyle 1 from 0,0,0 to 0.2,0,0
set arrow arrowstyle 1 from 0,0,0 to 0,0.2,0
set arrow arrowstyle 1 from 0,0,0 to 0,0,1

set arrow arrowstyle 1 from 0,0,0 to 0.5,0.5,h(0.5,0.5)
set arrow arrowstyle 1 from 0,0,0 to 0.4,0.4,0
set arrow arrowstyle 1 from 0.4,0.4,0 to 0.5,0.5,h(0.5,0.5)

set arrow arrowstyle 1 from 0.5,0.5,h(0.5,0.5) to 0.65,0.5,h(0.65,0.5)
set arrow arrowstyle 1 from 0.4,0.4,0 to 0.55,0.4,0

splot [0:1][0:1] h(x,y) with l lc rgb 'gray50',0 with l lc rgb 'gray10'

set output
reset

#RESULTADOS:

#ENERGÍA DE CURVATURA

set terminal epslatex mono 
set output "Se_plot.tex"

set xlabel '$\kappa$'
set ylabel '$E_c$'
set key right bottom
plot "./source_plots/Medidas_Se_L64.dat" u 1:2:3 title 'L=64' w yerrorlines pt 6 lt 1,\
     "./source_plots/Medidas_Se_L46.dat" u 1:2:3 title 'L=46' w yerrorlines pt 7 lt 0,\
     "./source_plots/Medidas_Se_L32.dat" u 1:2:3 title 'L=32' w yerrorlines pt 4 lt 2,\
     "./source_plots/Medidas_Se_L24.dat" u 1:2:3 title 'L=24' w yerrorlines pt 5 lt 5,\
     "./source_plots/Medidas_Se_L16.dat" u 1:2:3 title 'L=16' w yerrorlines pt 8 lt 14
reset

#resultados calor específico

set terminal epslatex mono 
set output "Cv_plot.tex"

set xlabel '$\kappa$'
set ylabel '$C_v$'
plot [0.5:1.2][0:3.7] "./source_plots/Medidas_Cv_L64.dat" u 1:2:3 title 'L=64' w yerrorlines pt 6 lt 1,\
     	       	      "./source_plots/Medidas_Cv_L46.dat" u 1:2:3 title 'L=46' w yerrorlines pt 7 lt 0,\
     	       	      "./source_plots/Medidas_Cv_L32.dat" u 1:2:3 title 'L=32' w yerrorlines pt 4 lt 2,\
     	       	      "./source_plots/Medidas_Cv_L24.dat" u 1:2:3 title 'L=24' w yerrorlines pt 5 lt 5,\
     	       	      "./source_plots/Medidas_Cv_L16.dat" u 1:2:3 title 'L=16' w yerrorlines pt 8 lt 14
reset

#resultados maximo calor específico

set terminal epslatex mono 
set output "max_Cv_plot.tex"

set xlabel '$\kappa$'
set ylabel '$C_v$'
plot [0.77:0.89][1:3.7] "./source_plots/Medidas_Cv_L64_zoom.dat" u 1:2:3 title '' w yerrorbars pt 10 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L64_K0.79.dat" title '' w l lt 0,\
	       		"./source_plots/maximo_Cv_L64_K0.79.dat" u 2:4:3:5 title 'L=64' w xyerrorlines pt 11 lt 1,\
			"./source_plots/Medidas_Cv_L46_zoom.dat" u 1:2:3 title '' w yerrorbars pt 6 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L46_K0.8.dat" title '' w l lt 0,\
	       		"./source_plots/maximo_Cv_L46_K0.8.dat" u 2:4:3:5 title 'L=46' w xyerrorlines pt 7 lt 1,\
	       		"./source_plots/Medidas_Cv_L32_zoom.dat" u 1:2:3 title '' w yerrorbars pt 12 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L32_K0.78.dat" title '' w l lt 0,\
	       		"./source_plots/maximo_Cv_L32_K0.78.dat" u 2:4:3:5 title 'L=32' w xyerrorlines pt 13 lt 1,\
			"./source_plots/Medidas_Cv_L16.dat" u 1:2:3 title '' w yerrorbars pt 4 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L16_K0.82.dat" title '' w l lt 0,\
	       		"./source_plots/maximo_Cv_L16_K0.82.dat" u 2:4:3:5 title 'L=16' w xyerrorlines pt 5 lt 1,\
	       		"./source_plots/Medidas_Cv_L24.dat" u 1:2:3 title '' w yerrorbars pt 8 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L24_K0.83.dat" title '' w l lt 0,\
	       		"./source_plots/maximo_Cv_L24_K0.83.dat" u 2:4:3:5 title 'L=24' w xyerrorlines pt 9 lt 1
set output
reset

#resultados calor específico vs L

set terminal epslatex mono 
set output "Cv_L_plot.tex"

set xlabel '$L$'
set ylabel '$C_v$'
a= 0.102904
b= 0.773719
c= 0.79573 
f(x)=a*x**b+c

plot "./source_plots/maximos_Cv.dat" u 1:4:5 title '$C_v(T_c)$' w yerrorbars,f(x) title '$f(\kappa)=a\,\kappa^b+c$'

reset   
  	       
#resultados Tc (CV) vs L

set terminal epslatex mono 
set output "Cv_T_L_plot.tex"
set xlabel '$L$'
set ylabel '$\kappa_c$'
plot "./source_plots/maximos_Cv.dat" u 1:2:3 title '$\kappa_c$' w yerrorbars
reset
  
#resultados radio de giro

set terminal epslatex mono 
set output "Rg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$R_g^2$'
plot "./source_plots/Medidas_Rg2_L16.dat" u 1:2:3 title 'L=16' w yerrorlines,\
     "./source_plots/Medidas_Rg2_L24.dat" u 1:2:3 title 'L=24' w yerrorlines,\
     "./source_plots/Medidas_Rg2_L32.dat" u 1:2:3 title 'L=32' w yerrorlines,\
     "./source_plots/Medidas_Rg2_L46.dat" u 1:2:3 title 'L=46' w yerrorlines,\
     "./source_plots/Medidas_Rg2_L64.dat" u 1:2:3 title 'L=64' w yerrorlines

reset

#resultados radio de giro conexo

set terminal epslatex mono 
set output "Drg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$\langle R_g^2 s_c \rangle$'
plot [0.5:1.2] "./source_plots/Medidas_Drg2_L16.dat" u 1:2:3 title 'L=16' w yerrorlines,\
     "./source_plots/Medidas_Drg2_L24.dat" u 1:2:3 title 'L=24' w yerrorlines,\
     "./source_plots/Medidas_Drg2_L32.dat" u 1:2:3 title 'L=32' w yerrorlines,\
     "./source_plots/Medidas_Drg2_L46.dat" u 1:2:3 title 'L=46' w yerrorlines,\
     "./source_plots/Medidas_Drg2_L64.dat" u 1:2:3 title 'L=64' w yerrorlines
reset
#resultados maximo calor específico

set terminal epslatex mono 
set output "max_Drg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$\langle R_g^2 E_c\rangle$'
plot [0.75:0.9] "./source_plots/Medidas_Drg2_L16.dat" u 1:2:3 title '' w yerrorbars pt 4 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L16_K0.84.dat" title '' w l lt 0,\
     	       "./source_plots/maximo_Drg2_L16_K0.84.dat" u 2:4:3:5 title '$16^2$' w xyerrorlines pt 5 lt 1,\
     	       "./source_plots/Medidas_Drg2_L24_zoom.dat" u 1:2:3 title '' w yerrorbars pt 8 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L24_K0.84.dat" title '' w l lt 0,\
     	       "./source_plots/maximo_Drg2_L24_K0.84.dat" u 2:4:3:5 title '$24^2$' w xyerrorlines pt 9 lt 1,\
     	       "./source_plots/Medidas_Drg2_L32_zoom.dat" u 1:2:3 title '' w yerrorbars pt 12 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L32_K0.82.dat" title '' w l lt 0,\
     	       "./source_plots/maximo_Drg2_L32_K0.82.dat" u 2:4:3:5 title '$32^2$' w xyerrorlines pt 13 lt 1,\
     	       "./source_plots/Medidas_Drg2_L46_zoom.dat" u 1:2:3 title '' w yerrorbars pt 6 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L46_K0.82.dat" title '' w l lt 0,\
     	       "./source_plots/maximo_Drg2_L46_K0.82.dat" u 2:4:3:5 title '$46^2$' w xyerrorlines pt 7 lt 1,\
     	       "./source_plots/Medidas_Drg2_L64_zoom.dat" u 1:2:3 title '' w yerrorbars pt 10 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L64_K0.79.dat" title '' w l lt 0,\
     	       "./source_plots/maximo_Drg2_L64_K0.79.dat" u 2:4:3:5 title '$64^2$' w xyerrorlines pt 11 lt 1
set output
reset

#resultados radio giro conexo vs L

set terminal epslatex mono 
set output "Drg2_L_plot.tex"

set xlabel '$L$'
set ylabel '$\langle R_g^2 E_c\rangle_{max}$'

a= 0.00221621
b= 0.883242     
f(x)=a*x**b

plot "./source_plots/maximos_Drg2.dat" u 1:4:5 title '$(T_c)$' w yerrorbars,f(x) title '$f(L)=a\,L^b$'

reset   

#resultados Temperatura crítica

set terminal epslatex mono 
set output "kappac_plot.tex"

set xlabel '$L$'
set ylabel '$\kappa_c$'

plot "./source_plots/maximos_Cv.dat" u 1:2:3 title 'Estimación $C_v$' w yerrorbars pt 5 lt 1,\
     "./source_plots/maximos_Drg2.dat" u 1:2:3 title 'Estimación $\langle R_g^2 E_c\rangle_{max}$' w yerrorbars pt 7 lt 0

reset   
