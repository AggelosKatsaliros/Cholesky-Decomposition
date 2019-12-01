n = input( 'Give size:');
format long g
tStart = tic;
a2=zeros(n,n);
for i=1:n;  %kyria diagwnios
  a2(i,i)=7;
endfor
for i=1:n-1;
  a2(i,i+1)=-4;
endfor
for i=2:n;
  a2(i,i-1)=-4;
endfor
for i=1:n-2;
  a2(i,i+2)=1;
endfor
for i=3:n;
  a2(i,i-2)=1;
endfor
b2=ones(n,1);
b2(1)=4;
b2(n)=4;
b2(2)=0;
b2(n-1)=0;
L=zeros(n);
L(1,1)=sqrt(a2(1,1));
L(2,1)=a2(2,1)/L(1,1);
L(2,2)=sqrt(a2(2,2)-L(2,1)^2);
L(3,1) = a2(3,1)/L(1,1);
L(3,2)=(a2(3,2)-L(3,1)*L(2,1))/L(2,2);
L(3,3)=sqrt(a2(3,3)-(L(3,1))^2-(L(3,2))^2);
starting_index=2; #to kanw gia na elegxw ta 2 teleytaia psifia tou L ta alla einai 0
for i=4:n
   for j=i-2:i-1
     sum=0;
     for k=starting_index:j-1
       sum=sum+L(i,k)*L(j,k);
     end
     L(i,j)=(a2(i,j)-sum)/L(j,j); 
   end
   starting_index=starting_index+1;
   sum=0;
   for j=i-2:i-1
     sum=L(i,j)^2+sum;
   end
   L(i,i)=sqrt(a2(i,i)-sum);
end
y=L\b2; %Diairo ton b1 me ton L
x=L'\y; %Diairo ton y me ton L antistrofo
disp('Ta pente arxika psifia')
for i=1:5
    x(i)
end
disp('Ta pente mesaia psifia')
for i=(n/2)-2:(n/2)+2
    x(i)
end
disp('Ta pente teleutaia psifia')
for i=n-4:n
    x(i)
end
tEnd = toc(tStart)