%% 
%Protein folding program created using MATLAB
%Based on Chapter 12 Computational Physics, N Giordano and  H Nakanishi,
% Pearson, 2006 and
% E Shaknovich, G Farztdinov, A Gutin and M Karplus, ""Protein folding bottlenecks:
% A Lattice Monte Carlo Simulation", Phys. Rev. Lett., 67, 1665, (1991).
% Written by Kevin Berwick.
%
%% Initialisation block

clear;
close;

%Initialise

T=10; % Initialise Temperature in Kelvin

number_of_runs=1000;
monomer_number=20;
protein_length=15;
low_interaction=-2;
high_interaction=-4;



%                 Generate the interaction matrix
%                 Interaction values from Cleland, Andrew and Wisthoff, Addison,
%                 "Computational Studies of Protein Folding" (2012).
%                 Annual Linfield College Science and Social Science Symposium.
%                  Event. Submission 24.
%                  http:%digitalcommons.linfield.edu/studsymp_sci/2012/all/24.
%                  Also in Giordano book

J_interaction=randi([high_interaction,low_interaction], monomer_number,monomer_number);

% Generate the initial protein matrix

protein=make_protein_matrix(protein_length, monomer_number);
Total_energy='0';
E_before_move=Calculate_energy_chain(protein,J_interaction, protein_length); % calculate energy 
 
%% Choose a link to consider at random and see if a move is possible
 for  step=1:number_of_runs
     Total_energy = Total_energy+E_before_move;   
    link_number=ceil(protein_length*rand); % pick  a link at random
    direction=ceil(8*rand()); %There are  8 neighbours you can jump to on the square lattice - pick one at random and label
    %                                        % the point (x_new, y_new)
    % 
            switch direction
                    case 1                                % choose neighbour above right
                        x_new=protein(2, link_number)+1;
                        y_new=protein(3, link_number)+1;
                    case 2                               % choose neighbour to right
                        x_new=protein(2, link_number)+1;
                        y_new=protein(3, link_number);
                    case 3                              % choose neighbour below right
                        x_new=protein(2, link_number)+1;
                        y_new=protein(3, link_number)-1;
                    case 4                                %choose neighbour below
                        x_new=protein(2, link_number);
                        y_new=protein(3, link_number)-1;
                    case 5                               %choose neighbour below left
                        x_new=protein(2, link_number)-1;
                        y_new=protein(3, link_number)-1;
                    case 6                              % choose neighbour  left
                        x_new=protein(2, link_number)-1;
                        y_new=protein(3, link_number);
                    case   7                           % direction must be  above left
                        x_new=protein(2, link_number)-1;
                        y_new=protein(3, link_number)+1;
                    otherwise                           % direction must be above
                        x_new=protein(2, link_number);
                        y_new=protein(3, link_number)+1;
            end;

            %   Check site is not occupied already
            occupied=site_occupied(x_new, y_new, protein);
            % Check if stretching occurs as a result of the suggested move
            stretched=check_stretch(protein, protein_length, link_number, x_new, y_new);
%            
%             % Make copy of protein matrix for energy difference calculation 
%              protein_after_move = protein;%  If not occupied and unstretched site 
            if ~occupied && ~stretched;   
                  
               protein_after_move=protein;   % Make a copy and update with new position
               protein_after_move(2, link_number) = x_new;
               protein_after_move (3, link_number) = y_new; 
               E_after_move=Calculate_energy_chain(protein_after_move,J_interaction, protein_length);
               delta_E=E_before_move-E_after_move;
                      
%%  Only perform the move is the Energy decreases, or, Monte Carlo, if increase Energy if the energy increaperform the move 
 %     

                     if delta_E>0;      % delta_E is positive, If delta E is small want to make the move more often than if 
                                                  %delta E is large, but randomly
                        
                                   Boltzmann_factor=exp(-delta_E/T); % for simplicity we measure energy in units of Boltzmann's constant
                                                                                                  % , so Temperature and energy are effectively unitless
                                                x=rand;                                                  
                                   if Boltzmann_factor>rand
                                        protein=protein_after_move; % update protein structure
                                        E_before_move=E_after_move; % update energy.
                                   end;
            
                      else                                % delta_E<=0  make the move since it is energetically favourable
                
                                        protein=protein_after_move; % update protein structure
                                        E_before_move=E_after_move; % update energy
         
                     end;
                     
                     end_to_end=length_end_to_end(protein, protein_length);
                     
                     %% Plot the output 
               
                     
           subplot(2,2,1);
           scatter(step, E_before_move,1, 'k', 'filled');
           axis([0 number_of_runs -30 5]);
           xlabel('Monte Carlo steps');
           ylabel('Energy');
           legend ('Energy vs time');         
            hold on;
            drawnow;       
            
            subplot(2,2,2);
           plot(protein(2,:),protein(3,:), '.-r','MarkerSize',5);
           axis([0 30 0 30]);  
           legend ('Protein');   
           drawnow;           
           subplot(2,2,3);
           plot(step, end_to_end, '.g','MarkerSize',5);
           axis([0 number_of_runs 0 15]);
           legend ('End to end protein length'); 
           hold on;
           drawnow;           
           
            end;    
            
 end;        
 
 
 % need to fix this with DISP
print ('Average Energy is', Total_energy/number_of_runs); 
print ('End to End length is', Total_energy/number_of_runs); 

