%----------------------Question 1------------------------------
beacons = [0 0.5 0; 3.5 0 1; 0 1.5 0; 4.5 0 0; 0 2.5 3.5; 1.5 2.5 0; 3.0 0 2.0; 4.0 4.0 4.0].*1000;
distance = zeros(16,8);
estimated_coordinates = zeros(16,8);
x_dir = 0;
y_dir = 0;
z_dir = 0;
time = 1;
for i=0:20:300
    if (i <=100)
        x_dir = 40*i;
        target = [x_dir 0 0];
    elseif(i>100 && i<=200)
        y_dir = 20*(i-100);
        target = [x_dir y_dir 0];
    elseif(i>200 && i<=300)
        z_dir = 5*(i-200);
        target = [x_dir y_dir z_dir];
    end
        for j = 1:8
            target_sum = (target-beacons(j, :)).^2;
            distance(time,j) = sqrt(sum(target_sum));
        end
    time = time+1;
end
% distance;
%----------------------Question 2------------------------------
distance_2 = distance;
a=0.2;
b=0;
rng(400060749);
y =(a*randn(16,1)+b);
for i = 1:16
    distance_2(i,:) = distance_2(i,:)+y(i);
end
distance_2;
%----------------------Question 3------------------------------

JTJ = zeros(3,3);
JTF = zeros(3,1);
answer = zeros(16, 3);
R = answer(1, :);

% time block iteration
for rowIndex = 1:15
    f_i = zeros(1, 8);
    R = answer(rowIndex, :);
    %each beacon's iteration
    for i = 1:8
        distancetoR = sqrt((R(1)-beacons(i,1)).^2 + (R(2)-beacons(i,2)).^2 + (R(3)-beacons(i,3)).^2);
        f_i= distancetoR-distance_2(rowIndex,i);
        % denominator = minimized sum of squares (per beacon)+table2(per
        % time).^2
        denominator = (f_i+distance_2(rowIndex,i)).^2;

        %(x-xi)
        R_Ri_X = (answer(rowIndex, 1)-beacons(i,1));
        %(y-yi)
        R_Ri_Y = (answer(rowIndex, 2)-beacons(i,2));
        %(z-zi)
        R_Ri_Z = (answer(rowIndex, 3)-beacons(i,3));
        

        JTJ(1,1) = JTJ(1,1) + ((R_Ri_X).^2./denominator);
        JTJ(1,2) = JTJ(1,2) + ((R_Ri_X.*R_Ri_Y)./denominator);
        JTJ(1,3) = JTJ(1,3) + ((R_Ri_X.*R_Ri_Z)./denominator);
        
        JTJ(2,1) = JTJ(2,1) + ((R_Ri_Y.*R_Ri_X)./denominator);
        JTJ(2,2) = JTJ(2,2) + ((R_Ri_Y).^2./denominator);
        JTJ(2,3) = JTJ(2,3) + ((R_Ri_Y.*R_Ri_Z))./denominator;
        
        JTJ(3,1) = JTJ(3,1) + ((R_Ri_Z.*R_Ri_X)./denominator);
        JTJ(3,2) = JTJ(3,2) + ((R_Ri_Z.*R_Ri_Y)./denominator);
        JTJ(3,3) = JTJ(3,3) + ((R_Ri_Z).^2./denominator);
       
        
        JTF(1,1) = JTF(1,1) + ((R_Ri_X.*f_i)./sqrt(denominator));
        JTF(2,1) = JTF(2,1) + ((R_Ri_Y.*f_i)./sqrt(denominator));
        JTF(3,1) = JTF(3,1) + ((R_Ri_Z.*f_i)./sqrt(denominator));

    end
    %transpose R point to a column vector (for subtraction)-->new R
    %position
    answer_prime = transpose(answer(rowIndex, :)) - inv(JTJ)*JTF;
    %transpose new R position into a row vector and store into answer
    %table
    answer(rowIndex+1, :) = transpose(answer_prime);

    %reset for next time block
    JTF = zeros(3,1);
    JTJ = zeros(3,3);
end
f_i;
answer(16, :);
%----------------------Question 4------------------------------

%create 3 x 3 subplots

%first row of subplots: t=0 --> t=100
t = [0:20:100]

%project x
x = transpose(answer(1:6, 1))
subplot(4,3,1)
plot(t,x)
%project y
y =  transpose(answer(1:6, 2))
subplot (3,3,2)
plot(t, y)
%project z
z =  transpose(answer(1:6, 3))
subplot(3,3,3)
plot(t, z)

%second row of subplots: t=100 --> t=200
t = [100:20:200]

%project x
x =  transpose(answer(6:11, 1))
subplot(3,3,4)
plot(t, x)
%project y
y= transpose(answer(6:11, 2))
subplot (3,3,5)
plot(t, y)
%project z
z =  transpose(answer(6:11, 3))
subplot(3,3,6)
plot(t, z)

%3rd row of subplots: t=200 --> t=300
t = [200:20:300]

%project x
x =  transpose(answer(11:16, 1))
subplot(3,3,7)
plot(t, x)
%project y
y =  transpose(answer(11:16, 2))
subplot (3,3,8)
plot(t, y)
%project z
z =  transpose(answer(11:16, 3))
subplot(3,3,9)
plot(t, z)

%plotting actual
figure()
%t=0 --> t=100
t = [0 20 40 60 80 100]
actual_x = [0 800 1600 2400 3200 4000]
actual_y = [0 0 0 0 0 0]
actual_z = [0 0 0 0 0 0]

subplot(3, 3, 1)
plot(t, actual_x)
subplot(3,3,2)
plot(t, actual_y)
subplot(3,3,3)
plot(t, actual_z)

%t=100 -->200
actual_x = [4000 4000 4000 4000 4000 4000]
actual_y = [0 400 800 1200 1600 2000]
actual_z = [0 0 0 0 0 0]
subplot(3, 3, 4)
plot(t, actual_x)
subplot(3,3,5)
plot(t, actual_y)
subplot(3,3,6)
plot(t, actual_z)

actual_x = [4000 4000 4000 4000 4000 4000]
actual_y = [2000 2000 2000 2000 2000 2000]
actual_z = [0 100 200 300 400 500]
subplot(3, 3, 7)
plot(t, actual_x)
subplot(3,3,8)
plot(t, actual_y)
subplot(3,3,9)
plot(t, actual_z)


