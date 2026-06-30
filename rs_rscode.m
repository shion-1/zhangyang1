//% RS编码函数 输入GF(3位信息矩阵)，输出GF(7位码字)
function code_gf = rs_rscode(msg_gf)
m = 3; n = 7; k = 3; t = (n-k)/2;
alpha = gf(2,m);
% 构造生成多项式 g(x) = (x-α^1)(x-α^2)...(x-α^4)
g = gf([1],m);
for i = 1:2*t
    g = conv(g, gf([1 alpha^i],m));
end
[row,~] = size(msg_gf);
code_gf = gf(zeros(row,n),m);
for r = 1:row
    info = msg_gf(r,:);
    info_shift = conv(info, gf([1 zeros(1,n-k)],m));
    [~,rem] = deconv(info_shift, g);
    rem = rem(end-(n-k)+1:end);
    code_gf(r,:) = [info rem];
end
end