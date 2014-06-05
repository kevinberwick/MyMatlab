function [Energy] = Calculate_energy_chain( protein, J_interaction, protein_length)
    %This function calculates the energy of a protein chain using equation
    %12.1
     link_number=1:1:protein_length; % there are 8 nearest neighbours to each location on the protein. Need to examine each to see if occupied
     x=protein(2, link_number);
     y=protein(3, link_number);
     
     case 1                                % choose neighbour above right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number)+1;
                   occupied=site_occupied (x_neighbour,y_neighbour, protein);
                  if occupied
                      Add_Energy()
                  end
    case 2                               % choose neighbour to right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number);
                case 3                              % choose neighbour below right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number)-1;
                case 4                                %choose neighbour below
                    x_neighbour=protein(2, link_number);
                    y_neighbour=protein(3, link_number)-1;
                case 5                               %choose neighbour below left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number)-1;
                case 6                              % choose neighbour  left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number);
                case   7                           % direction must be  above left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number)+1;
                otherwise                           % direction must be above
                    x_neighbour=protein(2, link_number);
                    y_neighbour=protein(3, link_number)+1;
     
     occupied=site_occupied (x_neighbour,y_neighbour, protein);
%      Check all neighbours and if occupied, note the indices of the interacting monomers, ie 1 to proten length. Look up the values in the Interaction
%      Matrix and add energy tothe Total Energy
     Energy=
     
     
     protein(i)
        
    
end





% the point (x_new, y_new)

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

