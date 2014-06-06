function [occupied] =  site_occupied(x_new, y_new, protein);
    
    % Check if suggested new site is occupied already
    %  Check if x_neighbour is in x_coords in protein
    
    lia=ismember(protein(2,:),x_new);
    
    %  Check if y_neighbour is in y_coords in protein
    
    lib=ismember(protein(3,:),y_new);
    
    %  AND the two arrays, if any 1s occur in the resulting array then the
    %  location is already occupied
    
    occupied=any(lia & lib);
    
end

