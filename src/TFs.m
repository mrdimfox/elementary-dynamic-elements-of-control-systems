classdef TFs
    properties
       amplifier
       aperiodic1
       aperiodic2
       oscillatory
       conservative
       perfect_integrating
       slowdown_integrating
       isodromic
       perfect_differentiating
       slowdown_differentiating
    end
    methods
        function obj = TFs()
            %% 1. ��������������
            k_amp = 1;
            obj.amplifier = tf(k_amp, 1);

            %% 2. �������������� 1-��� �������
            k_ap1 = 1;
            T_ap1 = 1;
            obj.aperiodic1 = tf(k_ap1, [T_ap1 1]);

            %% 3. �������������� 2-��� �������
            k_ap2 = 1;
            T1_ap2 = 1;
            T2_ap2 = 1;
            obj.aperiodic2 = tf(k_ap2, [(T2_ap2)^2 T1_ap2 1]);

            %% 4. �������������
            k_osc = 1;
            T_osc = 1;
            ksi_osc = 1;
            obj.oscillatory = tf(k_osc, [(T_osc)^2 (2 * ksi_osc * T_osc) 1]);

            %% 5. ��������������
            k_con = 1;
            T_con = 1;
            obj.conservative = tf(k_con, [(T_con)^2 0 1]);

            %% 6. ��������� �������������
            k_pint = 1;
            obj.perfect_integrating = tf(k_pint, [1 0]);

            %% 7. ������������� � �����������
            k_sint = 1;
            T_sint = 1;
            obj.slowdown_integrating = tf(k_sint, [T_sint 1 0]);

            %% 8. ����������
            k_drom = 1;
            k1_drom = 1;
            T_drom = k1_drom / k_drom;
            obj.isodromic = tf([T_drom k_drom], [1 0]);

            %% 9. ��������� ����������������
            k_pdif = 1;
            obj.perfect_differentiating = tf([k_pdif 0], 1);

            %% 10. ���������������� � �����������
            k_sdif = 1;
            T_sdif = 1;
            obj.slowdown_differentiating = tf([k_sdif 0], [T_sdif 1]);
        end
    end
end