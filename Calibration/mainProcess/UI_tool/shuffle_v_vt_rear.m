shuffled_vt_x_rear = (-1) * ones(size(x_bar_new_norm_rear, 1), 1);
shuffled_vt_y_rear = (-1) * ones(size(y_bar_new_norm_rear, 1), 1);
F3_rear = evalin('base', 'F3_rear');
obj_rear = evalin('base', 'obj_rear');
local = obj_rear.f.vt{size(F3_rear, 2), 1};
for i = 1 : size(F3_rear, 2)
    for j = 1 : 3
       f_val = F3_rear(j, i);
       vt_val = local(j, i);
       if (shuffled_vt_x_rear(vt_val, 1) == (-1))
            shuffled_vt_x_rear (vt_val, 1) = x_bar_new_norm_rear (f_val);
            shuffled_vt_y_rear (vt_val, 1) = y_bar_new_norm_rear (f_val);
       end
    end
end