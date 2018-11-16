x_mesh_back_u = (-1) * [-1.667, 0, 1.667];
y_mesh_back_u = (-1) * [2.681, 3.5, 2.681];
z_mesh_back_u = [1.2, 1.2, 1.2];

x_mesh_back_r = (-1) * [1.429, 1.116, 0.9376, 0.6103];
y_mesh_back_r = (-1) * [2.298, 1.795, 1.508, 0.9962];
z_mesh_back_r = [0, 0, 0, 0];

x_mesh_back_b = (-1) * [0.4278, 0.2697, 0.1306, 0, -0.1306, -0.2697, -0.4278, -0.6103];
y_mesh_back_b = (-1) * [1, 1, 1, 0, 1, 1, 1, 0.9962];
z_mesh_back_b = [0, 0, 0, 0, 0, 0, 0, 0];

x_mesh_back_l = (-1) * [-0.9376, -1.116, -1.429];
y_mesh_back_l = (-1) * [1.508, 1.795, 2.298];
z_mesh_back_l = [0, 0, 0];

x_mesh_back_half1 = horzcat(x_mesh_back_u, x_mesh_back_r);
y_mesh_back_half1 = horzcat(y_mesh_back_u, y_mesh_back_r);
z_mesh_back_half1 = horzcat(z_mesh_back_u, z_mesh_back_r);

x_mesh_back_half2 = horzcat(x_mesh_back_b, x_mesh_back_l);
y_mesh_back_half2 = horzcat(y_mesh_back_b, y_mesh_back_l);
z_mesh_back_half2 = horzcat(z_mesh_back_b, z_mesh_back_l);

x_mid = (-1) * [-1.111, -0.7602, -0.386, 0, 0.386, 0.7602, 1.111];
y_mid = (-1) * [2.598, 2.819, 2.954, 3, 2.954, 2.819, 2.598];
z_mid = [0, 0, 0, 0, 0, 0, 0];

x_mesh_back = horzcat(x_mesh_back_half1, x_mesh_back_half2);
x_mesh_back = horzcat(x_mesh_back, x_mid);
y_mesh_back = horzcat(y_mesh_back_half1, y_mesh_back_half2);
y_mesh_back = horzcat(y_mesh_back, y_mid);
z_mesh_back = horzcat(z_mesh_back_half1, z_mesh_back_half2);
z_mesh_back = horzcat(z_mesh_back, z_mid);

x_clicked_rear = evalin('base', 'x_clicked_rear');
y_clicked_rear = evalin('base', 'y_clicked_rear');
x = x_clicked_rear(1:25)';
y = y_clicked_rear(1:25)';

points_clicked = 25;

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

v_rear = evalin('base', 'v_rear');
n = find (v_rear(2, :) ~= 0);
x_new = v_rear(1, n);
y_new = v_rear(2, n);
z_new = v_rear(3, n);

v_new = vertcat(x_new, y_new);
v_new = vertcat(v_new, z_new);

x_bar_back = zeros(3077, 1);
y_bar_back = zeros(3077, 1);

count = 0;
for i = 1:3077
    count = count + 1;
    image_zero (1, 1) = 1;
    if ((ismember(v_rear(1, i), x_mesh_back(:)) == 1) && (ismember(v_rear(2, i), y_mesh_back(:)) == 1) && (ismember(v_rear(3, i), z_mesh_back(:)) == 1))
        ind_x = find(x_mesh_back == v_rear(1, i));
        ind_y = find(y_mesh_back == v_rear(2, i));
        ind_z = find(z_mesh_back == v_rear(3, i));
        int = intersect(ind_x, ind_y);
        int = intersect(int, ind_z);
        if (size(int) > 0)
            x_bar_back (i) = x(int(1));
            y_bar_back (i) = y(int(1));
            continue;
        end
    end
    image_zero (2, 1) = v_rear(1, i);
    image_zero (3, 1) = v_rear(2, i);
    image_zero (4, 1) = v_rear(3, i);
    for l = 1:points_clicked
        image_lower (l) = (x_mesh_back(l) - v_rear(1, i)) ^ 2 + (y_mesh_back(l) - v_rear(2, i)) ^ 2 + (z_mesh_back(l) - v_rear(3, i)) ^ 2;
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
x_bar_new_norm_rear = abs(x_bar_back)./1280;
y_bar_new_norm_rear = abs(1 - (y_bar_back)./720);
