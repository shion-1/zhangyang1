% 计算两个GF码字之间不同符号个数（汉明距离）
function d = gf_dis(u,v)
    % 提取有限域数值矩阵，再做异或
    u_data = u.x;
    v_data = v.x;
    xor_res = xor(u_data, v_data);
    d = sum(xor_res);
end