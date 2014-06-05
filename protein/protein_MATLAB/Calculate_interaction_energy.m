function [ Energy] = Calculate_interaction_energy(x_neighbour, y_neighbour, protein, link_number, J_interaction)
%Calculate the interction energy of two monomers
Energy=0;
occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied                % need to extract link number
                       [~, column]=find(protein(2,:)==x_neighbour);
                       if  y_neighbour=protein(3,column);  % match of x and y coodinates
                           interacting_link_number=column   % this is the link number of the interacting monomer
                       end;
                       
                       if abs(interacting_link_number-link_number)~=1    %non-  adjacent monomer
                          protein(1, link_number)=monomer_1;
                          protein(1,interacting_link_number)=monomer_2;
                          Energy=J_interaction(monomer_1, monomer2);
                          
                       end;
                   end;

end

