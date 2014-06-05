function [Energy] = Calculate_energy_chain( protein, J_interaction, protein_length)
    %This function calculates the energy of a protein chain using equation
    %12.1
    
    %  Check all neighbours and if occupied, note the indices of the interacting monomers, ie 1 to protein length. Look up the values in the Interaction
%      Matrix and add the energy to the Total Energy
     link_number=1:1:protein_length; % there are 8 nearest neighbours to each location on the protein. Need to examine each to see if occupied
     x=protein(2, link_number);
     y=protein(3, link_number);
     
                 % Choose neighbour above right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number)+1;
                   occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                 
                       % choose neighbour to right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number);
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                                              % choose neighbour below right
                    x_neighbour=protein(2, link_number)+1;
                    y_neighbour=protein(3, link_number)-1;
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                                           %choose neighbour below
                    x_neighbour=protein(2, link_number);
                    y_neighbour=protein(3, link_number)-1;
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                                                 %choose neighbour below left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number)-1;
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                                            % choose neighbour  left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number);
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                                           % direction must be  above left
                    x_neighbour=protein(2, link_number)-1;
                    y_neighbour=protein(3, link_number)+1;
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
                              % direction must be above
                    x_neighbour=protein(2, link_number);
                    y_neighbour=protein(3, link_number)+1;
                    occupied=site_occupied (x_neighbour,y_neighbour, protein);
                   if occupied
                       Add_Energy(x,y, x_neighbour, y_neighbour, J_interaction)
                   end;
     
  
    
