% 
%Protein folding program created using MATLAB
%Based on Chapter 12 Computational Physics, N Giordano and  H Nakanishi,
% Pearson, 2006 and 
% E Shaknovich, G Farztdinov, A Gutin and M Karplus, ""Protein folding bottlenecks:
% A Lattice Monte Carlo Simulation", Phys. Rev. Lett., 67, 1665, (1991).
% Written by Kevin Berwick.
%

clear;

%Initialise

monomer_number=20;
protein_length=15;
low_interaction=-2;
high_interaction=4;  
number_of_runs=500;

% Generate the initial protein matrix

protein=make_protein_matrix(protein_length, monomer_number);

%                 Generate the interaction matrix
%                 Interaction values from Cleland, Andrew and Wisthoff, Addison, 
%                 "Computational Studies of Protein Folding" (2012). 
%                 Annual Linfield College Science and Social Science Symposium.
%                  Event. Submission 24.
%                  http:%digitalcommons.linfield.edu/studsymp_sci/2012/all/24.
%                  Also in Giordano book

                                                     
 J_interaction=randi([low_interaction,high_interaction], monomer_number,monomer_number);      
% 
% % Choose a link to consider at random
 for  step=1:number_of_runs
%     
     link_number=ceil(protein_length*rand);
%     
%      if ((link_number > 2 ) & (link_number <= protein_length-1)); % It is an inner link
%         NEED TO REVISIT THIS TO LOOK AT EDGE LINKS
%        Randomly pick a neighbouring point from the eight available on the lattice,
%         
         direction=ceil(8*rand()); %There are  8 neighbours you can jump to on the square lattice
%         
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
            case   7                           % direction must be 4, above left
                x_new=protein(2, link_number)-1;
                y_new=protein(3, link_number)+1;  
            otherwise                           % direction must be above 
                x_new=protein(2, link_number);
                y_new=protein(3, link_number)+1;
        end;
        
%   Check link is not occupied already
%  Check if x_neighbour is in x_coords in protein
 lia=ismember(protein(2,:),x_new);
%  Check if y_neighbour is in y_coords in protein
 lib=ismember(protein(3,:),y_new);
%  AND the two arrays, if any 1s occur in the resulting array then the 
%  location is already occupied
 occupied=any(lia & lib);
 if occupied ==false    % unoccupied site update location 
             protein(2, link_number) = x_new;
             protein(3, link_number) = y_new;
             x_coords = protein(2,:);
             y_coords= protein (3,:);
 end;
             plot(protein(2,:),protein(3,:), 'or');
             axis([0 50 0 50]);
             drawnow;
 end;

%  end;
% end;
%  Now need to check that the links to the new location are not stretched 
 


%         % check that bond lengths both sides of the link under consideration will remain 1 if the jump to the new position is made
%         
%         if    sqrt((x_neighbour-x_left)^2)==1 && sqrt ((y_neighbour-y_left)^2) == 1)if    sqrt(      (x_neighbour-x_left)^2+(y_neighbour-y_left)^2        ) == 1 ;
%            if   sqrt(   (x_neighbour-x_right)^2+(y_neighbour-y_right)^2     )==1;
% % %                NEED TO RETHNK THIS BIT    ^
%            
%             % move allowed, update protein data structure
%             protein(x, link_number)=x_neighbour;
%             protein(y, link_number)=y_neighbour;
%             plot(x_neighbour, y_neighbour, 'or');
%             axis ([0 30 0 20]);
%             xlabel('x');
%             ylabel('y');
%             hold on;
%             pause (0.01); %pause 1 s
%       end;   
%         end;
%     end;
% end;

                    
   