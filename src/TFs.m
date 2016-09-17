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
            %% 1. Безынерционное
            k_amp = 10;
            obj.amplifier = tf(k_amp, 1);

            %% 2. Апериодическое 1-ого порядка
            k_ap1 = 10;
            T_ap1 = 0.01;
            obj.aperiodic1 = tf(k_ap1, [T_ap1 1]);

            %% 3. Апериодическое 2-ого порядка
            k_ap2 = 10;
            T1_ap2 = 0.01;
            T2_ap2 = 0.02;
            obj.aperiodic2 = tf(k_ap2, [(T2_ap2)^2 T1_ap2 1]);

            %% 4. Колебательное
            k_osc = 10;
            T_osc = 0.02;
            ksi_osc = 0.25;
            obj.oscillatory = tf(k_osc, [(T_osc)^2 (2 * ksi_osc * T_osc) 1]);

            %% 5. Консервативное
            k_con = 10;
            T_con = 0.1;
            obj.conservative = tf(k_con, [(T_con)^2 0 1]);

            %% 6. Идеальное интегрирующее
            k_pint = 10;
            obj.perfect_integrating = tf(k_pint, [1 0]);

            %% 7. Интегрирующее с замедлением
            k_sint = 10;
            T_sint = 0.1;
            obj.slowdown_integrating = tf(k_sint, [T_sint 1 0]);

            %% 8. Изодромное
            k_drom = 10;
            k1_drom = 200;
            T_drom = k1_drom / k_drom;
            obj.isodromic = tf([T_drom k_drom], [1 0]);

            %% 9. Идеальное дифференцирующее
            k_pdif = 10;
            obj.perfect_differentiating = tf([k_pdif 0], 1);

            %% 10. Дифференцирующее с замедлением
            k_sdif = 10;
            T_sdif = 0.01;
            obj.slowdown_differentiating = tf([k_sdif 0], [T_sdif 1]);
        end
    end
end