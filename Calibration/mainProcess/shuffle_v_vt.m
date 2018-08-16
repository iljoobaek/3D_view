shuffled_vt_x = (-1) * ones(size(x_bar_new_norm, 1), 1);
shuffled_vt_y = (-1) * ones(size(y_bar_new_norm, 1), 1);

local = obj.f.vt{size(F3, 2), 1};
for i = 1 : size(F3, 2)
    for j = 1 : 3
       f_val = F3(j, i);
       vt_val = local(j, i);
       if (shuffled_vt_x(vt_val, 1) == (-1)) 
            shuffled_vt_x (vt_val, 1) = x_bar_new_norm (f_val); 
            shuffled_vt_y (vt_val, 1) = y_bar_new_norm (f_val);
       end
    end
end

% shuffled_vt_x = x_bar_new_norm;
% shuffled_vt_y = y_bar_new_norm;