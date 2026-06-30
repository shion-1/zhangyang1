% 生成GF(2^3)下全部3位信息符号集合a_msg
function output = a_msg()
val = 0:7;
[a1,a2,a3] = ndgrid(val,val,val);
output = [a1(:),a2(:),a3(:)];
end