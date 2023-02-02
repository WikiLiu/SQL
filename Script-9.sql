--SELECT STRIP_NO, RM_TEMP_HMI, RM_THICK_HMI, RM_WIDTH_HMI, FET_HMI, FM_TEMP_HMI, FM_THICK_HMI, FM_PROFILE_HMI, FM_FLAT_HMI, THICKCORR_HMI, THREAD_SPEED_HMI, ACC1_HMI, ACC2_HMI, DECC_HMI, MAX_SPEED_HMI, RUNOUT_SPEED_HMI, CROWN_OFFSET, FDT_OFFSET, CT_OFFSET, STAND_ACTIVE_F1, STAND_ACTIVE_F2, STAND_ACTIVE_F3, STAND_ACTIVE_F4, STAND_ACTIVE_F5, STAND_ACTIVE_F6, STAND_ACTIVE_F7, LOAD_CORR_F1, LOAD_CORR_F2, LOAD_CORR_F3, LOAD_CORR_F4, LOAD_CORR_F5, LOAD_CORR_F6, LOAD_CORR_F7, MMT_MODE, MMT_STAND, MMT_RATE, DESC_MODE, DESC_HIGH, DESC_FSB1, DESC_FSB2, DESC_F1F2, DESC_F2F3, CB_MODE, CB_ON, EMPLOYEEID, FLAG, TOC, TOM, MOP
--FROM AP.SCC_HMI_STRATEGY
--WHERE STRIP_NO='220003400200' AND (FLAG=2 OR FLAG = 1);

--select  (CB_ON)   from AP.SCC_FMSTRIP  ,  AP.SCC_HMI_STRATEGY where AP.SCC_FMSTRIP.STRIP_NO = 220026400800	 		AND AP.SCC_HMI_STRATEGY.STRIP_NO = AP.SCC_FMSTRIP.STRIP_NO ORDER BY AP.SCC_HMI_STRATEGY.FLAG DESC fetch first 1 rows ONLY 




select t3.STRIP_NO,t1.steelgrade as "grade",  t3.STAND_NO as "stand", t7.SEG_NO, t2.SFC,  t1.QUALITYNO as "QNO", 
       t2.THICK_CLASS as"H_No",  t2.WIDTH_CLASS as "W_No",  
       t3.entry_thick as Pre_H0, t3.exit_thick as Pre_H1,   t4.entry_thick as Post_H0, t4.EXIT_THICK as Post_H1, --t3.dforceddthick,
       t3.rel_redu as PreRedu,   t3.strip_width,            t4.rel_redu    as PostRedu,  
       t3.entry_temp as Pre_T0,  t3.exit_temp  as Pre_T1,   t4.entry_temp  as Post_T0, t4.EXIT_TEMP as Post_T1,
       t3.circ_speed	,          t3.exit_tension        ,   t7.back_ten    , 
       --thick data
       t7.exit_thick,  t8.fm_thick,t1.rollthicknom as target_H, t3.ROLL_FORCE-t7.FORCE as "Force_Err", 
       t3.ROLL_FORCE as "Cal_F", t4.ROLL_FORCE as "post_F", t7.FORCE as "act_F",  
       t3.bend_force , t4.gague_thick, t4.gaguethick_snap,
      
       --(t4.ROLL_FORCE-t7.FORCE)/t4.ROLL_FORCE as "Rel_Err",
                 
       t3.corr_force_matl as  "inher_Old" ,    t4.corr_force_matl as "inher_New",  t3.forward_slip,
       t5.corr_thick,    t5.corr_zeropoint_use,  t5.corr_zeropoint,

       t7.toc
                
 from AP_STRIP_PDI t1, SCC_CALC_PASS  t2, SCC_CALC_ROLLFORCE  t3, SCC_POST_ROLLFORCE  t4, 
 SCC_POST_ROLLGAP t5, SCC_POST_TEMP t6, SCC_ACT_FMSEGACT_SUB t7, SCC_ACT_FMSEG t8
 
 WHERE  t3.STRIP_NO =  t1.STRIPNO   and  t3.STRIP_NO  =  t2.STRIP_NO  and  t3.STRIP_NO =  t4.STRIP_NO 
 and    t3.STAND_NO =  t4.STAND_NO  and  t4.SEG_NO    =  t7.SEG_NO    and  t8.STRIP_NO =  t3.STRIP_NO 
 and    t8.SEG_NO   =  t7.SEG_NO    and  t4.STRIP_NO  =  t5.STRIP_NO  and  t4.SEG_NO   =  t5.SEG_NO 
 and    t4.STAND_NO = t5.STAND_NO   and  t4.STRIP_NO  =  t6.STRIP_NO  and  t4.SEG_NO   =  t6.SEG_NO 
 and    t4.STAND_NO = t6.STAND_NO   and  t3.STRIP_NO  =  t7.STRIP_NO  and  t3.STAND_NO =  t7.STAND_NO
 and    t3.STRIP_NO = t8.strip_no
 and    t7.SEG_NO=1
 
 --and t3.STRIP_NO = '70528700900' 
 --and (t3.STRIP_NO like '701577%' or t3.STRIP_NO like '701617%')
 --and to_char(t7.toc,'yyyymmdd') between '20120518' and '20120518'
 and to_char(t7.toc,'yyyymmddhh24mi') between '202106200000' and '202106302359'
 --and t1.steelgrade='DN150E1'

 order by t7.toc desc , t3.STAND_NO asc
 