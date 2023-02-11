clc
close all
clear

 % i) Matrix A [5,100] with rand nums between -1 and 2
 A = -1+rand(100,5)*(2+1);
 % ii) Same matrix with elements ^3
 B = A.^3;
 % iii) Vector x equal to 2nd column of A
 x = A(:,2);
 % iv) Vector y equal to 2nd last column (4th column) of B
 y = B(:,4);
 % v) Mask m, making positive values in y
 m = y < 0;
 % vi) Substitues y's negative values with random values between 0 and 2
 y(m) = rand(1,1)*(2);
 % vii) Plot y vs x using red circle markers
 figure(1)
 plot(x,y,'ro')
 title('Q7 plot - random variables')
 % viii) Same plot as previous question, but with blue crosses and limit
 % domain between -1 and 1
 mask = x > 1;
 % the values permitted are xlim([-1,1])
 x(mask) = NaN;
 figure(2)
 % plot graph x vs y
 plot(x,y,'bx')
 title('Q8 plot - random variables with domain limit [-1,1]')
 % ix) Make C vector with sum of the columns of B
 C = sum(B,2);
 % x) Plot the exp(C) as a function of C, use blash dashed line 
 figure(3)
 plot(C, exp(C), 'k--')
 xlabel('C - summation of random variable')
 ylabel('exp(C)')
 title('Q10 plot - random variables exp(C) vs C')
 
 
 
 
 
 
