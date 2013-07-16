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

set style arrow 1 head filled

set arrow 1 from -0.08,0,0 to 1,0,0 front
set arrow 2 from 0,-0.08,0 to 0,1,0 front
set arrow 3 arrowstyle 1 from 0,0,0 to 0.5,0.5,0 front

set label 1 '{\Large $x^2$}' at -0.04,0.5,0 center front
set label 2 '{\Large $x^1$}' at  0.5,-0.04,0 center front
set label 3 '{\Large $\mathbf{x}$}' at  0.30,0.25,0 center front
set label 4 '{\Large $P$}' at  0.55,0.55,0 center front

splot [0:1][0:1][-0.1:0.1] 0 w l lc rgb 'gray'

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
set style arrow 2 head filled

set arrow arrowstyle 2 from 0,-0.25,0.25 to 0.2,-0.25,0.25 front
set arrow arrowstyle 2 from 0,-0.25,0.25 to 0,-0.05,0.25 front
set arrow arrowstyle 2 from 0,-0.25,0.25 to 0,-0.25,0.35 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0.5,0.5,0 front

set label '{\Large $\vec{i}$}' at 0.1,-0.3,0.25 center front
set label '{\Large $\vec{j}$}' at -0.05,-0.15,0.25 center front
set label '{\Large $\vec{k}$}' at  0,-0.3,0.32 center front
set label '{\Large $\vec{r}(\mathbf{x})$}' at  0.25,0.125,0.150 center front
set label '{\Large $P$}' at  0.55,0.55,0 center front
splot [0:1][0:1] (x-0.5)**2-(y-0.5)**2 w l lc rgb 'gray'

set output
reset

#CAMPO MEDIO = PARAMETRIZACIÓN

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

set title '$f_M(\zeta,t<0)$' offset 0,-1
plot [-2.5:2.5][-1.5:2] g(x,-1) 
set origin 0.475,0.225
clear

set title '$f_M(\zeta,t=0)$' offset 0,-1
plot [-2.5:2.5][-0.5:3] g(x,0)
set origin 0.700,0.550
clear

set title '$f_M(\zeta,t>0)$' offset 0,-1
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

#VECTORES DEFORMACIÓN

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

set style arrow 1 head filled

set arrow 1 arrowstyle 1 from 0,0,0 to 0.2,0,0 front 
set arrow 2 arrowstyle 1 from 0,0,0 to 0,0.2,0 front
set arrow 3 arrowstyle 1 from 0,0,0 to 0,0,1

set arrow 4 arrowstyle 1 from 0,0,0 to 0.5,0.5,h(0.5,0.5)
set arrow 5 arrowstyle 1 from 0,0,0 to 0.4,0.4,0 front
set arrow 6 arrowstyle 1 from 0.4,0.4,0 to 0.5,0.5,h(0.5,0.5)

set arrow 7 arrowstyle 1 from 0.5,0.5,h(0.5,0.5) to 0.65,0.5,h(0.65,0.5) front
set arrow 8 arrowstyle 1 from 0.4,0.4,0 to 0.55,0.4,0

set label 1 '$x$' at 0.05,0,-0.2
set label 2 '$y$' at 0,0.2,0.15
set label 3 '$z$' at 0,0.01,0.5

set label 4 '$\vec{r}(\mathbf{x})$' at 0.2,0.2,h(0.25,0.25)/2+0.25
set label 5 '$\vec{r}_0(\mathbf{x})$' at 0.2,0.2,0.25 front
set label 6 '$\vec{u}$' at 0.375,0.45,h(0.45,0.45)/2-0.2

set label 7 '$d\vec{r}$' at 0.57,0.5,h(0.5,0.5)+0.1 front
set label 8 '$d\vec{r}_0$' at 0.45,0.4,0.1 front

splot [0:1][0:1] h(x,y) with l lc rgb 'gray',0 with l lt 2 lc rgb 'gray'

set output
reset

#ESQUEMA POISSON

set terminal epslatex mono 
set output "Poisson-fig.tex"

poisson(x)=(1-x)/(1+x)

set multiplot

set logscale x
set xlabel '$\mu / K$'
set ylabel '$\sigma$'
plot [0.001:1000] poisson(x) notitle w l lw 3

unset tics
unset xtics
unset ytics
unset key
unset border
unset logscale x
unset xlabel
unset ylabel

set tmargin 0; set bmargin 0; set rmargin 0; set lmargin 0

set size 0.2,0.5
set origin 0.25,0.3
set title '$\sigma>0$'
clear
set arrow 1 heads from 1,0.3 to 1.2,0.3 #dx
set arrow 2 heads from 0.5,1 to 0.5,0.8 #dy
set arrow 3 from 1.2,0.5 to 1.5,0.5     #+Tx
set arrow 4 from -0.2,0.5 to -0.5,0.5   #-Tx

set label 1 '$\delta x^1$' at 1.06,0.35 center front
set label 2 '$\delta x^2$' at 0.7,0.9 center front
set label 3 '$\vec{T}$' at 1.275,0.55 front
set label 4 '$\vec{T}$' at -0.375,0.55 front
plot [-0.2:1.2][-0.2:1.2] "./source_plots/esquema_Poisson.dat" u 1:2 w l lt 3,\
                          "" u 3:4 w l lt 1

set origin 0.675,0.3
set title '$\sigma<0$'
 
clear
set arrow 2 heads from 0.5,1 to 0.5,1.2
set label 2 '$\delta x^2$' at 0.7,1.1 front
plot [-0.2:1.2][-0.2:1.2] "./source_plots/esquema_Poisson.dat" w l lt 3,\
     			  "" u 5:6 w l lt 1
unset multiplot
set output
reset

#CURVATURA

set terminal epslatex mono 
set output "curvatura-fig.tex"

f(x,y)=exp(-0.5*(x**2+2*y**2))
set size 1,1
set multiplot

unset tics
unset xtics
unset ytics
unset key
unset border


set view 60,315,1,1
#set hidden3d
set xyplane at 0
set view equal xyz
set isosamples 13

#VECTORES
set style arrow 1 head filled

set arrow 1 arrowstyle 1 from 0,0,f(0,0) to 1,0,f(0,0) front
set arrow 2 arrowstyle 1  from 0,0,f(0,0) to 0,-1,f(0,0) front
set arrow 3 arrowstyle 1  from 0,0,f(0,0) to 0,0,f(0,0)+0.9 front

set label 1 '$\vec{t}_1$' at 0.65,0.2,f(0,0) center front
set label 2 '$\vec{t}_2$' at 0.2,-0.4,f(0,0) center front
set label 3 '$\vec{n}$' at 0,-0.15,f(0,0)+0.6 center front

splot [-1.5:1.5][-1.5:1.5] f(x,y) with l lc rgb 'gray50'

set tmargin 0; set bmargin 0; set rmargin 0; set lmargin 0

set size 1,1

set origin -0.27,0.17 

unset arrow 2
unset label 2
set arrow 4  arrowstyle 1 from 0,0,0 to 0.3,0,f(0.3,0) front
set label 4 '$\mathcal{R}_1$' at -0.12,0,f(0.3,0)/2 center front
splot [-1.5:1.5][0:1.5] f(x,y) with l lc rgb 'gray50' #x

set origin 0.3,0.17
unset arrow 1
unset label 1
set label 2 '$\vec{t}_2$' at 0.2,-0.4,f(0,0) center front
set arrow 2  arrowstyle 1 from 0,0,f(0,0) to 0,-1,f(0,0) front
set arrow 4  arrowstyle 1 from 0,0,0.5 to 0,0.3,f(0,0.3) front
set label 4 '$\mathcal{R}_2$' at 0,0.4,0.5 center front
splot [0:1.5][-1.5:1.5] f(x,y) with l lc rgb 'gray50' #y

unset multiplot
set output
reset

#MODELO DISCRETO

set terminal epslatex mono 
set output "red_triangular-fig.tex"

set view equal xyz
set view 0,0,2.5,1

unset key
unset border
unset tics

set style arrow 1 head filled
set arrow 1 arrowstyle 1 from 0,0,0 to 0.5,0.866025,0.0 front
set arrow 2 arrowstyle 1 from 0,0,0 to 1,0,0 front
set arrow 3 heads from 0,-0.3,0 to 7,-0.3,0 front

set label 1 '$j$' at 0,0.4,0.0 front
set label 2 '$i$' at 0.5,0.15,0 front
set label '$L$' at 3.5,-1,0
splot [-1.5:][:][-1:1] "./source_plots/flat_L8_triangular.dat" w lp lc rgb 'gray' pt 7 ps 3
set output
reset

#NORMALES ADYACENTES
set terminal epslatex monochrome  
set output "normales_adyacentes-fig.tex"
unset key
unset border
unset tics

set style arrow 1 head filled

set arrow arrowstyle 1 from 0.5,0.3,0 to 0.5,0.3,0.7 front
set arrow arrowstyle 1 from 0.5,0,-0.3 to 0.5,-1,-0.3 front

set label '$\vec{n}_a$' at 0.6,0.3,0.35
set label '$\vec{n}_b$' at 0.5,-0.5,-0.40

set xyplane at 0
set view equal xyz
set view 69,35,1.0

splot "./source_plots/normales_adyacentes.dat"  i 1 u 1:2:3:($4-$1):($5-$2):($6-$3) with vectors nohead,"" with p pointtype 7 pointsize 2

set output
reset

#BASE HEXAGONAL

set terminal epslatex mono 
set output "base-hexagonal-fig.tex"


unset key
unset border
unset tics

set view equal xyz
set view 0,0,2.3,1

set style arrow 1 head filled
set style arrow 2 nohead filled lt 2
set arrow 1 arrowstyle 1 from 0,0,0 to 1,0,0 front
set arrow 2 arrowstyle 1  from 0,0,0 to 0,1,0 front

set arrow 3  arrowstyle 2  from 0,0.6*0.866,0 to 0.6*0.5,0.6*0.866,0 front
set arrow 4  arrowstyle 2  from 0.6*0.5,0,0 to 0.6*0.5,0.6*0.866,0 front
set arrow 5 heads from 0,0,0 to 0.6*0.5,-0.6*0.866,0 front

set label 1 '$a$' at 0.15,-0.21
set label 2 '$\vec{e}_1$' at 0.5,-0.1,0

set label 3 '$x_q^2$' at 0.6*0.5+0.02,(0.6*0.866)/2,0
set label 4 '$x_q^1$' at (0.6*0.5)/2-0.08,0.6*0.866+0.05,0

set label 6 '$\vec{e}_2$' at -0.1,0.5,0
set label 7 '$P$' at -0.09,-0.09,0 front
set label 8 '$Q$' at 0.6*0.5+0.06,0.6*0.866+0.06,0 front

splot  [-1:1.1][-0.9:1.1][-1:1]"./source_plots/hexagono.dat" u (0.6*($1)):(0.6*($2)):3 w lp lc rgb 'gray' pt 7 ps 3

set output
reset
#METODOS
set terminal epslatex mono 
set output "ejemplo_error-fig.tex"

set xlabel 'tamaño del bloque'
set ylabel '$\langle R_G^2\rangle$'
set nokey
set title '$L=64$ $\kappa=0.7$'
set logscale x
plot "./source_plots/error_Rg2_L64_K0.7.dat" u 1:2 w lp pt 7 lt 1 
set output
reset

set terminal epslatex mono 
set output "ejemplo_termal-fig.tex"

set xlabel 'n\textdegree actualizaciones/$\tau_0$'
set ylabel '$\langle R_G^2\rangle$'
set title '$L=64$ $\kappa=0.7$'
set nokey
set logscale x
plot "./source_plots/Rg2_L64_K0.7.dat" u 1 w lp pt 7 lt 1 
set output
reset

set terminal epslatex mono 
set output "ejemplo_logtermal-fig.tex"

set xlabel '$\tau_0$/actualizaciones conservados'
set ylabel '$\langle R_G^2\rangle$'
set nokey
set title '$L=64$ $\kappa=0.7$'
set logscale x
plot "./source_plots/logtermal_Rg2_L64_K0.7.dat" u 1:2 w lp pt 7 lt 1 
set output
reset
#RESULTADOS:

#ENERGÍA DE CURVATURA

set terminal epslatex mono 
set output "Se_plot.tex"

set logscale x 2 
set mxtics 10

#set xtics add (0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,2.0)
set xlabel '$\kappa$'
set ylabel '$\langle e_c \rangle $'
set key right bottom
plot [0.4:2.2] "./source_plots/Medidas_Se_L64.dat" u 1:2:3 title '$64^2$' w yerrorlines pt 6 lt 1,\
     "./source_plots/Medidas_Se_L46.dat" u 1:2:3 title '$46^2$' w yerrorlines pt 7 lt 0,\
     "./source_plots/Medidas_Se_L32.dat" u 1:2:3 title '$32^2$' w yerrorlines pt 4 lt 2,\
     "./source_plots/Medidas_Se_L24.dat" u 1:2:3 title '$24^2$' w yerrorlines pt 5 lt 5,\
     "./source_plots/Medidas_Se_L16.dat" u 1:2:3 title '$16^2$' w yerrorlines pt 8 lt 14
reset

#resultados calor específico

set terminal epslatex mono 
set output "Cv_plot.tex"

set xlabel '$\kappa$'
set ylabel '$C_V$'
plot [0.5:1.2][0:3.7] "./source_plots/Medidas_Cv_L64.dat" u 1:2:3 title '$64^2$' w yerrorlines pt 6 lt 1,\
     	       	      "./source_plots/Medidas_Cv_L46.dat" u 1:2:3 title '$46^2$' w yerrorlines pt 7 lt 0,\
     	       	      "./source_plots/Medidas_Cv_L32.dat" u 1:2:3 title '$32^2$' w yerrorlines pt 4 lt 2,\
     	       	      "./source_plots/Medidas_Cv_L24.dat" u 1:2:3 title '$24^2$' w yerrorlines pt 5 lt 5,\
     	       	      "./source_plots/Medidas_Cv_L16.dat" u 1:2:3 title '$16^2$' w yerrorlines pt 8 lt 14
reset

#resultados maximo calor específico

set terminal epslatex mono 
set output "max_Cv_plot.tex"

set xlabel '$\kappa$'
set ylabel '$C_V$'
plot [0.77:0.89][1:3.7] "./source_plots/Medidas_Cv_L64_zoom.dat" u 1:2:3 title '' w yerrorbars pt 10 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L64_K0.79.dat" title '' w l lt 1 lc rgb 'gray',\
	       		"./source_plots/maximo_Cv_L64_K0.79.dat" u 2:4:3:5 title '$64^2$'  w xyerrorlines pt 11 lt 1,\
			"./source_plots/Medidas_Cv_L46_zoom.dat" u 1:2:3 title '' w yerrorbars pt 6 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L46_K0.8.dat" title '' w l lt 1 lc rgb 'gray',\
	       		"./source_plots/maximo_Cv_L46_K0.8.dat" u 2:4:3:5 title '$46^2$' w xyerrorlines pt 7 lt 1,\
	       		"./source_plots/Medidas_Cv_L32_zoom.dat" u 1:2:3 title '' w yerrorbars pt 12 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L32_K0.81.dat" title '' w l lt 1  lc rgb 'gray',\
	       		"./source_plots/maximo_Cv_L32_K0.81.dat" u 2:4:3:5 title '$32^2$' w xyerrorlines pt 13 lt 1,\
			"./source_plots/Medidas_Cv_L16.dat" u 1:2:3 title '' w yerrorbars pt 4 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L16_K0.82.dat" title '' w l lt 1 lc rgb 'gray',\
	       		"./source_plots/maximo_Cv_L16_K0.82.dat" u 2:4:3:5 title '$16^2$' w xyerrorlines pt 5 lt 1,\
	       		"./source_plots/Medidas_Cv_L24.dat" u 1:2:3 title '' w yerrorbars pt 8 lt 2,\
     	       		"./source_plots/extrapolacion_Cv_L24_K0.83.dat" title '' w l lt 1  lc rgb 'gray',\
	       		"./source_plots/maximo_Cv_L24_K0.83.dat" u 2:4:3:5 title '$24^2$' w xyerrorlines pt 9 lt 1
set output
reset

#resultados calor específico vs L

set terminal epslatex mono 
set output "Cv_L_plot.tex"

set xlabel '$L$'
set ylabel '$C_V$'
set key right bottom 

#set logscale x 2
#set logscale y 2

#set mxtics 10
#set mytics 10


a0= 0.7702
a1=0.1098
omega= 0.7602

Cv(x)=a0+a1*x**omega

plot "./source_plots/maximos_Cv.dat" u 1:4:5 title '$\kappa_c(L)$' w yerrorbars pt 7,Cv(x) title '$c_0+c_1L^{c_2}$'

reset   
  	       
#resultados Tc (CV) vs L

set terminal epslatex mono 
set output "Cv_T_L_plot.tex"
set xlabel '$L$'
a1=0.777
b1=4.349
nu1=1.38
g1(x)=a1+b1*(x**(-nu1))

a2=0.774
b2=3.41
nu2=1.38-0.09
g2(x)=a2+b2*(x**(-nu2))

a3=0.779
b3=5.62
nu3=1.38+0.09
g3(x)=a3+b3*(x**(-nu3))

plot "./source_plots/maximos_Cv.dat" u 1:2:3 title '$C_v \rightarrow \kappa_c(L)$' w yerrorbars pt 7,g1(x) title '$c_0+c_1\,L^{-1/\nu}$' w l lt 1 lc rgb 'gray',g2(x) title '$c_0+c_1\,L^{-1/\nu-0.09}$',g3(x) title '$c_0+c_1\,L^{-1/\nu+0.09}$'
reset
  
#resultados radio de giro

set terminal epslatex mono 
set output "Rg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$R_g^2$'
set key left top

plot "./source_plots/Medidas_Rg2_L64.dat" u 1:2:3 title '$64^2$'  w yerrorlines pt 6 lt 1,\
     "./source_plots/Medidas_Rg2_L46.dat" u 1:2:3 title '$46^2$' w yerrorlines pt 7 lt 0,\
     "./source_plots/Medidas_Rg2_L32.dat" u 1:2:3 title '$32^2$' w yerrorlines pt 4 lt 2,\
     "./source_plots/Medidas_Rg2_L24.dat" u 1:2:3 title '$24^2$' w yerrorlines pt 5 lt 5,\
     "./source_plots/Medidas_Rg2_L16.dat" u 1:2:3 title '$16^2$' w yerrorlines pt 8 lt 14
reset


#escala radiod e giro
set terminal epslatex mono 
set output "rg2_plano_plot.tex"

set xlabel '$L$'
set ylabel '$\langle R_g^2 \rangle$'
set logscale x
set logscale y
set key left top

c0=0.141
c1=0.0159
nu=1.996
f(x)=c0+c1*(x**nu)
plot "./source_plots/rg2_escala.dat" u 1:6:7  title '$\kappa=2.0$' w yerrorbars pt 5 lt 1,f(x) title '$c_0+c_1\;L^{c_2}$'
reset

#escala radio de giro transicion
set terminal epslatex mono 
set output "rg2_transicion_plot.tex"

set xlabel '$L$'
set ylabel '$R_g^2$'

set key left top

c0=-0.535325  
c1=0.0471556  
nu=1.38315    
f(x)=c0+c1*(x**nu)
plot "./source_plots/Rg2_critico.dat" u 1:4:5  title '$\kappa_c(L)$' w yerrorbars pt 5 lt 1,f(x) title '$c_0+c_1\;L^{2\nu}$'
reset

#escala radio de giro rugosa
set terminal epslatex mono 
set output "rg2_rugosa_plot.tex"

set xlabel '$\log L$'
set ylabel '$\langle R_g^2 \rangle$'
set key left top
c0=-0.176
c1=0.247
f(x)=c0+c1*log(x)
plot "./source_plots/rg2_escala.dat" u (log($1)):3:4  title '$\kappa=0.5$' w yerrorbars pt 5 lt 1,f(exp(x)) title '$c_0+c_1\; \log L$'
reset

#Funcion de escala radio de giro

set terminal epslatex mono 
set output "rg2_funcion_escala_plot.tex"

inv_nu=1.38
kc=0.777
two_nu=4/2.7

set key left top

set xrange [-50:50]
set xlabel '$L^{1/\nu}(\kappa-\kappa_c)$'
set ylabel '$\frac{R_g^2}{L^{4/d_H}}$'
plot [-50:50] "./source_plots/Medidas_Rg2_L64.dat" u\
      (64**inv_nu*($1-kc)):($2/64**(two_nu)):($3/64**(two_nu)) w yerrorlines pt 6 lt 1 title '$64^2$',\
      "./source_plots/Medidas_Rg2_L46.dat" u\
      (46**inv_nu*($1-kc)):($2/46**(two_nu)):($3/46**(two_nu)) w yerrorlines pt 7 lt 0 title '$46^2$',\
      "./source_plots/Medidas_Rg2_L32.dat" u\
      (32**inv_nu*($1-kc)):($2/32**(two_nu)):($3/32**(two_nu)) w yerrorlines pt 4 lt 2  title '$32^2$',\
       "./source_plots/Medidas_Rg2_L24.dat" u\
       (24**inv_nu*($1-kc)):($2/24**(two_nu)):($3/24**(two_nu))   w yerrorlines pt 5 lt 5  title '$24^2$',\
       "./source_plots/Medidas_Rg2_L16.dat" u\
       (16**inv_nu*($1-kc)):($2/16**(two_nu)):($3/16**(two_nu))   w yerrorlines pt 8 lt 14 title '$16^2$'

reset
set output

#resultados radio de giro conexo

set terminal epslatex mono 
set output "Drg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$\langle R_g^2 e_c \rangle$'
plot [0.5:1.2] "./source_plots/Medidas_Drg2_L64.dat" u 1:2:3 title '$64^2$' w yerrorlines pt 6 lt 1,\
     	       "./source_plots/Medidas_Drg2_L46.dat" u 1:2:3 title '$46^2$' w yerrorlines pt 7 lt 0,\
     	       "./source_plots/Medidas_Drg2_L32.dat" u 1:2:3 title '$32^2$' w yerrorlines pt 4 lt 2,\
     	       "./source_plots/Medidas_Drg2_L24.dat" u 1:2:3 title '$24^2$' w yerrorlines pt 5 lt 5,\
     	       "./source_plots/Medidas_Drg2_L16.dat" u 1:2:3 title '$16^2$'  w yerrorlines pt 8 lt 14
reset
#resultados maximo radio de giro conexo

set terminal epslatex mono 
set output "max_Drg2_plot.tex"

set xlabel '$\kappa$'
set ylabel '$\langle R_g^2 e_c\rangle$'
plot [0.75:0.9] "./source_plots/Medidas_Drg2_L16.dat" u 1:2:3 title '' w yerrorbars pt 4 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L16_K0.84.dat" title '' w l lt 1 lc rgb 'gray',\
     	       "./source_plots/maximo_Drg2_L16_K0.84.dat" u 2:4:3:5 title '$16^2$' w xyerrorlines pt 5 lt 1,\
     	       "./source_plots/Medidas_Drg2_L24_zoom.dat" u 1:2:3 title '' w yerrorbars pt 8 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L24_K0.84.dat" title '' w l lt 1 lc rgb 'gray',\
     	       "./source_plots/maximo_Drg2_L24_K0.84.dat" u 2:4:3:5 title '$24^2$' w xyerrorlines pt 9 lt 1,\
     	       "./source_plots/Medidas_Drg2_L32_zoom.dat" u 1:2:3 title '' w yerrorbars pt 12 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L32_K0.83.dat" title '' w l lt 1 lc rgb 'gray',\
     	       "./source_plots/maximo_Drg2_L32_K0.83.dat" u 2:4:3:5 title '$32^2$' w xyerrorlines pt 13 lt 1,\
     	       "./source_plots/Medidas_Drg2_L46_zoom.dat" u 1:2:3 title '' w yerrorbars pt 6 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L46_K0.82.dat" title '' w l lt 1 lc rgb 'gray',\
     	       "./source_plots/maximo_Drg2_L46_K0.82.dat" u 2:4:3:5 title '$46^2$' w xyerrorlines pt 7 lt 1,\
     	       "./source_plots/Medidas_Drg2_L64_zoom.dat" u 1:2:3 title '' w yerrorbars pt 10 lt 2,\
     	       "./source_plots/extrapolacion_Drg2_L64_K0.79.dat" title '' w l lt 1  lc rgb 'gray',\
     	       "./source_plots/maximo_Drg2_L64_K0.79.dat" u 2:4:3:5 title '$64^2$' w xyerrorlines pt 11 lt 1
set output
reset

#resultados radio giro conexo vs L

set terminal epslatex mono 
set output "Drg2_L_plot.tex"

set xlabel '$L$'
#set ylabel '$\langle R_g^2 e_c\rangle_{max}$'
set key right bottom
c1=0.00238419
omega= 0.860348 
g(x)=c1*(x**omega)

plot "./source_plots/maximos_Drg2.dat" u 1:4:5 title '$\langle R_g^2 e_c\rangle_{max}$' w yerrorbars pt 5 lt 1,g(x) title '$c_0\,L^{c_1}$'

reset   

#resultados Temperatura crítica

set terminal epslatex mono 
set output "kappac_plot.tex"

set xlabel '$L$'
set ylabel '$\kappa$'

c0= 0.779059
c1= 0.441665
nu= 1.60002
g(x)=c0+c1/(x**(1/nu))
plot "./source_plots/maximos_Drg2.dat" u 1:2:3 title '$\langle R_g^2 E_c\rangle_{max}\rightarrow\kappa_c(L)$' w yerrorbars pt 5 lt 1,g(x) title '$c_0+c1\ L^{-1/\nu}$'

reset
   
#resultados medida del M poisson

set terminal epslatex mono 
set output "poisson_plot.tex"

set xlabel '$L$'
set ylabel '$\sigma$'

plot "./source_plots/sigma_K2.0.dat" u 1:2:3 title '' w yerrorbars pt 5 lt 1

reset   
