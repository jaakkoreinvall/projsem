%parameters
lambda = 0.1;
r = 0.03;
sigma = 0.1;
s0 = 1;
dt = 1;
T = 50;

s = zeros(T,1);
s(1) = s0;
y = zeros(T,1);

%generate simple price process

for i=2:dt:T
   z = randn(); 
   s(i) = s(i-1)*exp((r-0.5*sigma^2)*dt + sigma*sqrt(dt)*z);
end

%generate jumps
for i=1:dt:T
   p = poissrnd(lambda);
   
   for j=1:1:p
       y(i) = y(i) + randn();
   end
end

% sum up the processes and plot
plot(1:dt:T,s+y)