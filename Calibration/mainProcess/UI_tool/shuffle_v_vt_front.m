shuffled_vt_x_front = (-1) * ones(size(x_bar_new_norm_front, 1), 1);
shuffled_vt_y_front = (-1) * ones(size(y_bar_new_norm_front, 1), 1);
F3_front = evalin('base', 'F3_front');
obj_front = evalin('base', 'obj_front');
local = obj_front.f.vt{size(F3_front, 2), 1};
for i = 1 : size(F3_front, 2)
    for j = 1 : 3
       f_val = F3_front(j, i);
       vt_val = local(j, i);
       if (shuffled_vt_x_front(vt_val, 1) == (-1)) 
            shuffled_vt_x_front (vt_val, 1) = x_bar_new_norm_front (f_val); 
            shuffled_vt_y_front (vt_val, 1) = y_bar_new_norm_front (f_val);
       end
    end
end