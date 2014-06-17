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
protein(2,3)=13;
protein(3,3)=19;
protein(2,2)=14;
protein(3,2)=19;
protein(2,1)=15;
protein(3,1)=19;
plot(protein(2,:),protein(3,:), '.-r','MarkerSize',5);
axis([0 30 0 30]);  

link_number=2

x_neighbour=14;
y_neighbour=20;


answer=Calculate_interaction_energy(x_neighbour, y_neighbour, protein, link_number, J_interaction)








