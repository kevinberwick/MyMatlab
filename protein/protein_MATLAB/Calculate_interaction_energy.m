function [Energy] = Calculate_interaction_energy(x_neighbour, y_neighbour, protein, link_number, J_interaction)
%Calculate the interction energy of two monomers
Energy=0;
    occupied=site_occupied (x_neighbour,y_neighbour, protein);
    if occupied                % need to extract link number
        [~, column]=find(protein(2,:)==x_neighbour);
                if  y_neighbour==protein(3, column);  % match of x and y coordinates
                    interacting_link_number=column;   % this is the link number of the interacting monomer
                        if abs(interacting_link_number - link_number)~=1;    %non-  adjacent monomer
                            monomer_1=protein(1, link_number);                          %Row number
                            monomer_2=protein(1,interacting_link_number);      %Column number
                            Energy=J_interaction(monomer_1, monomer_2);
                        end;
                end;
    end;
    

