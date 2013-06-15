#!/usr/bin/gnuplot

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

set arrow arrowstyle 1 from 0,0,0 to 1,0,0 front
set arrow arrowstyle 1 from 0,0,0 to 0,-1,0 front

set label '$\vec{t}_1$' at 0.5,0,0.8 center front
set label '$\vec{t}_2$' at  0,-0.5,0.8 center front
set label '$\mathbf{x}$' at  0,0,0 center front point pt 7 ps 1 offset 0,0.3,0

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

set arrow arrowstyle 1 from 0,0,0 to 1,0,0 front
set arrow arrowstyle 1 from 0,0,0 to 0,1,0 front


#set label '$\vec{t}_1$' at 0,0,0.8 center front
#set label '$\vec{t}_2$' at  0,-0.5,0.8 center front

splot [0:1][0:1][-1:1] 0 w l lc rgb 'gray50'

reset

#COORDENADAS EXTERNAS

set terminal epslatex mono 
set output "coordenadas_externas-fig.tex"

unset key
unset border
unset tics

set view equal xy
set view 45,45,1.4,1
set isosamples 7
set hidden3d

set style arrow 1 head size 0.02,30,90 filled

set arrow arrowstyle 1 from 0,-0.25,0.25 to 0.2,-0.25,0.25 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0,-0.05,0.25 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0,-0.25,0.35 front
set arrow arrowstyle 1 from 0,-0.25,0.25 to 0.5,0.5,0 front

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
