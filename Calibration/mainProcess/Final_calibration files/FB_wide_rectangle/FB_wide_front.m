x_mesh_back_u = [-2.631, -2.631, -0.06417, 2.631, 2.631];
y_mesh_back_u = [2.606, 4.343, 4.343, 4.343, 2.606];
z_mesh_back_u = [0.9659, 0.9659, 0.9659, 0.9659, 0.9659];

x_mesh_back_r = [2.52, 1.936, 1.352, 0.72];
y_mesh_back_r = [2.496, 2.254, 2.012, 1.75];
z_mesh_back_r = [0, 0, 0, 0];

x_mesh_back_b = [0.5444, 0.3688, 0.1932, -0.01756, -0.1932, -0.3688, -0.5444, -0.72];
y_mesh_back_b = [1.75, 1.75, 1.75, 1.75, 1.75, 1.75, 1.75, 1.75];
z_mesh_back_b = [0, 0, 0, 0, 0, 0, 0, 0];

x_mesh_back_l = [-1.352, -1.936, -2.52];
y_mesh_back_l = [2.012, 2.254, 2.496];
z_mesh_back_l = [0, 0, 0];

x_mesh_back_half1 = horzcat(x_mesh_back_u, x_mesh_back_r);
y_mesh_back_half1 = horzcat(y_mesh_back_u, y_mesh_back_r);
z_mesh_back_half1 = horzcat(z_mesh_back_u, z_mesh_back_r);

x_mesh_back_half2 = horzcat(x_mesh_back_b, x_mesh_back_l);
y_mesh_back_half2 = horzcat(y_mesh_back_b, y_mesh_back_l);
z_mesh_back_half2 = horzcat(z_mesh_back_b, z_mesh_back_l);

x_mid = [-2.52, -1.905, -1.291, -0.6761, -0.06146, 0.6761, 1.291, 1.905, 2.52, -0.04723, -0.03299];
y_mid = [4.16, 4.16, 4.16, 4.16, 4.16, 4.16, 4.16, 4.16, 4.16, 3.378, 2.597];
z_mid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

x_mesh_back = horzcat(x_mesh_back_half1, x_mesh_back_half2);
x_mesh_back = horzcat(x_mesh_back, x_mid);
y_mesh_back = horzcat(y_mesh_back_half1, y_mesh_back_half2);
y_mesh_back = horzcat(y_mesh_back, y_mid);
z_mesh_back = horzcat(z_mesh_back_half1, z_mesh_back_half2);
z_mesh_back = horzcat(z_mesh_back, z_mid);

x = x_clicked(1:31)';
y = y_clicked(1:31)';

points_clicked = 31;

% Thin plate spline algorithm
zero_matrix = [0; 0; 0; 0];
xp_back = vertcat (x', zero_matrix);
yp_back = vertcat (y', zero_matrix);

all_ones = ones(points_clicked, 1);
x_column = zeros(points_clicked, 1);
y_column = zeros(points_clicked, 1);
z_column = zeros(points_clicked, 1);
for i = 1:points_clicked
    x_column (i, 1) = x_mesh_back(i);
    y_column (i, 1) = y_mesh_back(i);
    z_column (i, 1) = z_mesh_back(i);
end
part1_1_in = horzcat(all_ones, x_column);
part1_1 = horzcat(part1_1_in, y_column);
part1_1 = horzcat(part1_1, z_column);
part2_2 = part1_1';

part2_1 = zeros(4, 4);
part1_2 = size(points_clicked, points_clicked);

for i = 1:points_clicked
    for j = 1:points_clicked
        part1_2 (i, j) =  (x_mesh_back(i) - x_mesh_back(j)) ^ 2 + (y_mesh_back(i) - y_mesh_back(j)) ^ 2 + (z_mesh_back(i) - z_mesh_back(j)) ^ 2; 
        part1_2 (i, j) = part1_2 (i, j) * log(part1_2 (i, j));
        if (i == j)
            part1_2 (i, j) = 0;
        end
    end
end
    
T_upper = horzcat(part1_1, part1_2);
T_lower = horzcat(part2_1, part2_2);
T = vertcat(T_upper, T_lower);
      
c_x_back = T \ xp_back;
c_y_back = T \ yp_back;

% for each pixel of an image

image_zero = size(4, 1);
image_lower = size(points_clicked, 1);

n = find (v(2, :) ~= 0);
x_new = v(1, n);
y_new = v(2, n);
z_new = v(3, n);

v_new = vertcat(x_new, y_new);
v_new = vertcat(v_new, z_new);

x_bar_back = zeros(5338, 1);
y_bar_back = zeros(5338, 1);

count = 0;
for i = 1:5338
    count = count + 1;
    image_zero (1, 1) = 1;
    if ((ismember(v(1, i), x_mesh_back(:)) == 1) && (ismember(v(2, i), y_mesh_back(:)) == 1) && (ismember(v(3, i), z_mesh_back(:)) == 1))
        ind_x = find(x_mesh_back == v(1, i));
        ind_y = find(y_mesh_back == v(2, i));
        ind_z = find(z_mesh_back == v(3, i));
        int = intersect(ind_x, ind_y);
        int = intersect(int, ind_z);
        if (size(int) > 0)
            x_bar_back (i) = x(int(1));
            y_bar_back (i) = y(int(1));
            continue;
        end
    end
    image_zero (2, 1) = v(1, i);
    image_zero (3, 1) = v(2, i);
    image_zero (4, 1) = v(3, i);
    for l = 1:points_clicked
        image_lower (l) = (x_mesh_back(l) - v(1, i)) ^ 2 + (y_mesh_back(l) - v(2, i)) ^ 2 + (z_mesh_back(l) - v(3, i)) ^ 2;
        image_lower (l) = image_lower (l) * log(image_lower (l));
    end
    test1 = vertcat(image_zero, image_lower');
    x_bar_back (i) = real(round(c_x_back' * test1));
    y_bar_back (i) = real(round(c_y_back' * test1));
    if (isnan(x_bar_back(i)))
        x_bar_back(i) = min(x_bar_back);
        y_bar_back(i) = max(y_bar_back);
    end
end
x_bar_new_norm = abs(x_bar_back)./1920;
y_bar_new_norm = abs(1 - (y_bar_back)./1208);

% x_bar_new_norm = abs(1 - (x_bar_back)./1920);
% y_bar_new_norm = abs((y_bar_back)./1208);
