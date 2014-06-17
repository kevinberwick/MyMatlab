function [occupied] =  site_occupied(x, y, protein)
    
    % Check if suggested new site is occupied already
    %  Check if x is in x_coords in protein
    
    lia=ismember(protein(2,:),x);
    
    %  Check if y is in y_coords in protein
    
    lib=ismember(protein(3,:),y);
    
    %  Logically AND the two arrays, if any 1s occur in the resulting array then the
    %  location is already occupied
    
    occupied=any(lia & lib);
    
end

