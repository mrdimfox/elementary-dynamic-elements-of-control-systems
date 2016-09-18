classdef DinElems
    properties
       amplifier = Elem();
       aperiodic1 = Elem();
       aperiodic2 = Elem();
       oscillatory = Elem();
       conservative = Elem();
       perfect_integrating = Elem();
       slowdown_integrating = Elem();
       isodromic = Elem();
       perfect_differentiating = Elem();
       slowdown_differentiating = Elem();
    end
    methods
        function obj = DinElems()
            addpath('./Helpers');
            addToPath('../utils/BuildGraph', '../src/Tfs models');
            
            %% 1. Безынерционное
            k_amp = 10;
            obj.amplifier.transFunc = tf(k_amp, 1);
            obj.amplifier.modelName = 'amplifier';

            %% 2. Апериодическое 1-ого порядка
            k_ap1 = 10;
            T_ap1 = 0.01;
            obj.aperiodic1.transFunc = tf(k_ap1, [T_ap1 1]);
            obj.aperiodic1.modelName = 'aperiodic1';

            %% 3. Апериодическое 2-ого порядка
            k_ap2 = 10;
            T1_ap2 = 0.01;
            T2_ap2 = 0.02;
            obj.aperiodic2.transFunc = tf(k_ap2, [(T2_ap2)^2 T1_ap2 1]);
            obj.aperiodic2.modelName = 'aperiodic2';

            %% 4. Колебательное
            k_osc = 10;
            T_osc = 0.02;
            ksi_osc = 0.25;
            obj.oscillatory.transFunc = tf(k_osc, [(T_osc)^2 (2 * ksi_osc * T_osc) 1]);
            obj.oscillatory.modelName = 'oscillatory';

            %% 5. Консервативное
            k_con = 10;
            T_con = 0.1;
            obj.conservative.transFunc = tf(k_con, [(T_con)^2 0 1]);
            obj.conservative.modelName = 'conservative';

            %% 6. Идеальное интегрирующее
            k_pint = 10;
            obj.perfect_integrating.transFunc = tf(k_pint, [1 0]);
            obj.perfect_integrating.modelName = 'perfect_integrating';

            %% 7. Интегрирующее с замедлением
            k_sint = 10;
            T_sint = 0.1;
            obj.slowdown_integrating.transFunc = tf(k_sint, [T_sint 1 0]);
            obj.slowdown_integrating.modelName = 'slowdown_integrating';

            %% 8. Изодромное
            k_drom = 10;
            k1_drom = 200;
            T_drom = k1_drom / k_drom;
            obj.isodromic.transFunc = tf([T_drom k_drom], [1 0]);
            obj.isodromic.modelName = 'isodromic';

            %% 9. Идеальное дифференцирующее
            k_pdif = 10;
            obj.perfect_differentiating.transFunc = tf([k_pdif 0], 1);
            obj.perfect_differentiating.modelName = 'perfect_differentiating';

            %% 10. Дифференцирующее с замедлением
            k_sdif = 10;
            T_sdif = 0.1;
            obj.slowdown_differentiating.transFunc = tf([k_sdif 0], [T_sdif 1]);
            obj.slowdown_differentiating.modelName = 'slowdown_differentiating';
        end
    end
end