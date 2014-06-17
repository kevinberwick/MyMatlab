clear;

%Initialise


k = 1.38e-23   % Boltzmann in Joules per Kelvin

T=10; % Initialise Temperature in Kelvin

number_of_runs=5000;
monomer_number=20;
protein_length=15;
low_interaction=-2;
high_interaction=4;
E_before_move=0;
E_after_move=0;

%                 Generate the interaction matrix


 J_interaction=randi([low_interaction,high_interaction], monomer_number,monomer_number);

% Generate the initial protein matrix

protein=make_protein_matrix(protein_length, monomer_number);
protein(2,1)=17;
protein(3,1)=18;
protein(2,2)=16;
protein(3,2)=18;
protein(2,3)=16;
protein(3,3)=19
protein(2,4)=17;
protein(3,4)=19;
protein(2,5)=18;
protein(3,5)=19;

protein(2,6)=18;
protein(3,6)=20;
protein(2,7)=19;
protein(3,7)=20;
protein(2,8)=20;
protein(3,8)=20;
protein(2,9)=21;
protein(3,9)=20;
protein(2,10)=22;
protein(3,10)=20;

protein(2,11)=23;
protein(3,11)=20;
protein(2,12)=24;
protein(3,12)=20;
protein(2,13)=25;
protein(3,13)=20
protein(2,14)=25;
protein(3,14)=19;
protein(2,15)=24;
protein(3,15)=19;

plot(protein(2,:),protein(3,:), '.-r','MarkerSize',5);
axis([0 30 0 30]);  

link_number=2

x_neighbour=14;
y_neighbour=20;


answer=Calculate_energy_chain(protein, J_interaction, protein_length)








