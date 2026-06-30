% RS译码：接收码字+全集码字映射表，输出原始3位信息
function dec_msg = rs_rrscode(rx_code,all_code_msg,all_msg)
[m_row,~] = size(all_code_msg);
min_dis = inf;
idx = 1;
% 最小汉明距离查表译码
for i = 1:m_row
    % 变量名改为all_code_msg，和主程序传入参数一致
    dis = gf_dis(rx_code, all_code_msg(i,:));
    if dis < min_dis
        min_dis = dis;
        idx = i;
    end
end
dec_msg = all_msg(idx,:);
end