
% creating the discrete signal equivalent of s = t;
n = 0:7;
s = n;

aks = fs_coefficient(n, s); %getting the discrete time FS coefficients
rx = abs(aks);     % magnitude of FSC
imx = angle(aks); % phase of FSC

%generating FSC magnitude of signal s subplots
figure()
subplot(2,1, 1)
stem(rx, "filled", "k")
title("FSC Magnitude of signal s")
xlabel("k"), ylabel("| ak_s |")
grid on

%generating FSC phase of signal s subplots
subplot(2,1,2)
stem(imx, "filled", "r")
title("FSC Phase Angle of signal s")
xlabel("k"), ylabel("<ak_s")
grid on

% Discrete Time FS Coefficients algorithm
function aks = fs_coefficient(ns, s)
    N = numel(ns);
    aks = zeros(1,8);
    ii = 1;
    for k=0:N-1
        ak = 0;
        jj = 1;
        for n=ns
            ak = ak + (1/N) * s(jj) * exp(-1j*k*((2*pi)/N)*n);
            jj = jj + 1;
        end
        aks(ii) = ak;
        ii = ii + 1;
    end
end
