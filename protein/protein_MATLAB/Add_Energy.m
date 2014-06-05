function [Energy ] = Add_energy( protein, link_number, interacting_link_number, J_interaction )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   protein(1, link_number)=monomer_1;
   protein(1,interacting_link_number)=monomer_2;
  Energy=J_interaction(monomer_1, monomer2);
 end

