% 5pt example app

% ground truth essential marix
Egt = [ 21.36410238362200  -6.45974435705903 -12.57571428668080
        -7.57644257286238 -20.76739671331773  28.55199769513539
         23.52168039400320 -21.32072430358359   1.00000000000000];

% corresponding points   
m1 = [  -0.06450996083506   0.12991134106070  -0.01417169260989   0.02077599827229   0.15970376410206
        0.13271495297568   0.25636930852309  -0.00201819071777   0.14974189941659   0.17782283760921
        1.00000000000000   1.00000000000000   1.00000000000000   1.00000000000000   1.00000000000000];

m2 = [  0.01991821260977   0.29792009989498   0.14221131487001   0.09012597508721   0.15373963107017
        0.13855920297370   0.21684093037950   0.03902000959363   0.11407993279726   0.02622710108650
        1.00000000000000   1.00000000000000   1.00000000000000   1.00000000000000   1.00000000000000];
    
[E] = peig5pt(m1, m2);

fprintf(' %d solutions found\n', (size(E,1)/3));

for i=1:(size(E,1)/3)

    Ei = E((i*3-2):(i*3), :);
    Ei = Ei ./ Ei(3,3);
    
    s = svd(Ei);
   
    fprintf('sln%d:: Eerr :%.2e, det(E) = %.2e, singular vals. = (%.4f, %.4f, %.4f)\n', i, sum(sum(Ei - Egt)), det(Ei), s(1), s(2), s(3));
end

