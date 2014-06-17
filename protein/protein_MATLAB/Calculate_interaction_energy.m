function [Energy] = Calculate_interaction_energy(x_neighbour, y_neighbour, protein, link_number, J_interaction)
%Calculate the interaction energy of two monomers
Energy=0;
    occupied=site_occupied (x_neighbour,y_neighbour, protein);
    if occupied                % need to extract link number of the neighbouring monomer

       
       [~, x_values]=find(protein(2,:)==x_neighbour); 
       [~, y_values]=find(protein(3,:)==y_neighbour);
       interacting_link_number=intersect(x_values, y_values);
%                   % this is the link number of the interacting monomer
                         if abs(interacting_link_number - link_number)>1;    %non-  adjacent monomer
                            monomer_1=protein(1, link_number);                          %Row number
                            monomer_2=protein(1,interacting_link_number);      %Column number
                            Energy=J_interaction(monomer_1, monomer_2);
                         end;
    end;

    

