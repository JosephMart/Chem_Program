function [  ] = eleminfo( S )
%eleminfo: This function takes in an element name or symbol as a string and 
% outputs the information for that element.
load('ElemStruc.mat');
Struc = ElemStruc;
Table = struct2table(Struc);
Symbols = Table.Symbol;
Name = Table.Name;
a=0;
if S == 0
   S = periodic_table; 
   S = S{1};
end
for i = 1:118
    if sum(strfind(Symbols{i},S)) == 1 && sum(strfind(S,Symbols{i})) == 1
        Struc(i)
        a=1;
    elseif sum(strfind(upper(Name{i}),upper(S))) == 1 && sum(strfind(upper(S),upper(Name{i}))) == 1
        Struc(i)
        a=1;
    end
end

if a == 0
    fprintf('Element not found. Make sure input is a string.\nElement symbol must have proper capitalization\n')
end



