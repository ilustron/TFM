inv_nu=1.38

kc=0.777

two_nu=4/2.7
set xrange [-50:50]                                                                  

#set nokey


plot "./source_plots/Medidas_Rg2_L64.dat" u (64**inv_nu*($1-kc)):($2/64**(two_nu)):($3/64**(two_nu))   w yerrorlines title"L=64"


replot "./source_plots/Medidas_Rg2_L46.dat" u (46**inv_nu*($1-kc)):($2/46**(two_nu)):($3/46**(two_nu))   w yerrorlines title"L=46"


replot "./source_plots/Medidas_Rg2_L32.dat" u\
(32**inv_nu*($1-kc)):($2/32**(two_nu)):($3/32**(two_nu))   w yerrorlines  title"L=32"


replot "./source_plots/Medidas_Rg2_L24.dat" u\
(24**inv_nu*($1-kc)):($2/24**(two_nu)):($3/24**(two_nu))   w yerrorlines  title"L=24"


replot "./source_plots/Medidas_Rg2_L16.dat" u (16**inv_nu*($1-kc)):($2/16**(two_nu)):($3/16**(two_nu))   w yerrorlines title"L=16"
