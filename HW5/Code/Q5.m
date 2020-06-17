formatSpec = '%f';
fileID = fopen('Q5_table.txt','r');
A = fscanf(fileID,formatSpec);
time = A(1:20);
velocity = A(21:40);
height = A(41:60);