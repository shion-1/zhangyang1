% RS(7,3)码完整仿真主程序 GF(2^3)
clear;clc;
%% 1. 加载全部可能信息集合
all_msg = a_msg;                     %所有3位原始信号全集
all_msg_gf = gf(all_msg,3);          %映射到GF(2^3)有限域
all_code_msg = rs_rscode(all_msg_gf);%预计算所有信息对应的正确RS码字

%% 2. 生成5组随机测试信息
msg = rand(5,3);
msg = floor(msg*8);                  %取值0~7，GF(2^3)符号
MSG = gf(msg,3);
code = rs_rscode(MSG);               %5组信息编码，得到7位RS码字

%% 3. 构造信道噪声（最多2位错误，匹配纠错能力t=2）
a = zeros(5,5);
b = floor(rand(5,2)*8);
noise = [a,b];
NOISE = gf(noise,3);
in_msg = code + NOISE;               %码字叠加噪声

%% 4. RS逐行译码
new_msg = zeros(5,3);
for ii = 1:5
    new_msg(ii,:) = rs_rrscode(in_msg(ii,:),all_code_msg,all_msg);
end
disp('译码输出原始信息：');
disp(new_msg);

%% 5. 统计译码正确率
num_same = same(msg,new_msg);        %调用same函数统计正确符号
total_sym = 5*3;
err_rate = (total_sym - num_same)/total_sym;
correct_rate = num_same / total_sym;
fprintf('正确符号总数：%d\n译码正确率：%.4f\n误码率：%.4f\n',num_same,correct_rate,err_rate);