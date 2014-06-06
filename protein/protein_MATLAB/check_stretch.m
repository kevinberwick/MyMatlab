function [stretched] = check_stretch(protein, protein_length, link_number, x_new, y_new)
    %This function checks if a possible move will cause stretching of a protein
    %  Need to to check that  bond lengths on one (outer link) or both (inner link)
    %  sides of the link under consideration will remain 1 if the jump to the new position is made
    % Initialise
    
    stretched=false;
    
    if (link_number >1) &&  (link_number<protein_length);   % Must be inner link - identify both neighbours
        
        x_left=protein(2, link_number-1);
        y_left=protein(3, link_number-1);
        x_right=protein(2, link_number+1);
        y_right=protein(3, link_number+1);
        
        root_x_diff_squared_left=sqrt((x_new-x_left)^2);
        root_x_diff_squared_right=sqrt((x_new-x_right)^2);
        root_y_diff_squared_left=sqrt((y_new-y_left)^2);
        root_y_diff_squared_right=sqrt((y_new-y_right)^2);
        
        %  If distance of suggested location to neighbour on right or left is greater than 1 in the x or
        %  y direction there is a stretch
        
        if (root_x_diff_squared_left+root_y_diff_squared_left)>1 || (root_x_diff_squared_right+root_y_diff_squared_right)>1;
            stretched=true;
        end;
        
    else
        
        % must be an outer link either 1 or protein_length
        
        if link_number == 15;           % right end link,  nearest link on left
            
            x_nearest_end=protein(2, link_number-1);
            y_nearest_end=protein(3, link_number-1);
            
        else                                                % left end link, link_number =1,   nearest link on right
            x_nearest_end=protein(2, link_number+1);
            y_nearest_end=protein(3, link_number+1);
        end
        
        root_x_diff_squared=sqrt((x_new-x_nearest_end)^2);
        root_y_diff_squared=sqrt((y_new-y_nearest_end)^2);
        
        if  (root_x_diff_squared+root_y_diff_squared> 1);
            stretched=true;
        end;
    end
