load('D&E-mode_indv=SNR_Tang_ZP_Optiaml_GCE-BEM_MMSE_IBDFE_TV_1st_banded_Q=1_D_FF=0_D_FB_full_16QAM_fd=0.02_N=256_I=3_M=5_Nblock=10000.mat')
dv6=dv;
load('D&E-mode_indv=SNR_Tang_ZP_Optiaml_GCE-BEM_MMSE_IBDFE_TV_1st_banded_Q=1_D_FF=0_D_FB=1_16QAM_fd=0.02_N=256_I=3_M=5_Nblock=10000.mat')
dv5=dv;
load('D&E-mode_indv=SNR_Tang_ZP_Optiaml_GCE-BEM_MMSE_IBDFE_TV_1st_banded_Q=1_D_FF=0_D_FB=0_16QAM_fd=0.02_N=256_I=3_M=5_Nblock=10000.mat')
dv4=dv;
load('D&E-mode_indv=SNR_No-windowing_ZP_Optiaml_GCE-BEM_MMSE_MMSE_FD_LE_full_16QAM_fd=0.02_N=256_I=3_M=5_Nblock=10000.mat')
dv2=dv;
load('D&E-mode_indv=SNR_No-windowing_ZP_Optiaml_GCE-BEM_MMSE_IBDFE_TI_16QAM_fd=0.02_N=256_I=3_M=5_Nblock=10000.mat')

figure(2)
semilogy(indv.range,dv.BER_est(3,:),'-x');
xlabel('SNR (dB)');
ylabel('average BER');
grid on;
hold on;
semilogy(indv.range,dv2.BER_est(1,:),'-h');
semilogy(indv.range,dv4.BER_est(1,:),'-*');
semilogy(indv.range,dv4.BER_est(3,:),'-o');
semilogy(indv.range,dv5.BER_est(3,:),'-s');
semilogy(indv.range,dv6.BER_est(3,:),'-d');
%semilogy(indv.range,dv6.BER_est(end,:),'-*');
title('16QAM BER using Estimated CSI (Normalized Doppler Frequency = 0.02), IBDFE-TV D_F_F=0')
legend('IBDFE-TI(Tomasin), 3th iteration, no windowing [3]',...
    'Full-MMSE-LE, no windowing','Banded-MMSE-LE Q=1 [5]', ...
    'IBDFE-TV D_F_B=0, 1st iteration use Banded-MMSE-LE Q=1 [5], 3th iteration',...,
    'IBDFE-TV D_F_B=1, 1st iteration use Banded-MMSE-LE Q=1 [5], 3th iteration' ...
    ,'IBDFE-TV D_F_B is full, 1st iteration use Banded-MMSE-LE Q=1 [5], 3th iteration')
xlim([0 indv.range(end)]);
ylim([10^-3 1]);
xticks(indv.range)