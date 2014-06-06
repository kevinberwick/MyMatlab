
%This function generates the protein matrix, consisting of the enumerated monomers
% on row 1 and the x and y coordinates of each monomer on rows 2 and 3 respectively

function [protein] = make_protein_matrix(protein_length, monomer_number);
    
    rng('default') ;                                                    %Choose Mersenne Twister with seed of 0 to make random number string repeatable
    % Create array A of length protein_length containing random positive integers from
    % 1 to monomer_number distributed uniformly.
    
    A=randi(monomer_number,1,protein_length);
    
    
    
    dims=1;                                               %Create an initial matrix structure for the tertiary structure containing the location of
                                                                 % each monomer in the protein together with the monomer enumerated type [1..20].
    
    x_array_Initial=10: protein_length+9;       % Nice to plot away from the origin
    y_array_Initial=ones(1,protein_length)*20;
    protein=cat(dims,A,x_array_Initial,y_array_Initial);
    
end

