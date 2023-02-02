SELECT 
POSTFORCE.TOM TOC,
POSTFORCE.STRIP_NO ,
PDI.STGRADE ,
POSTFORCE.STAND_NO ,
PDI.SFC,
PDI.QUALITYNO ,
FMSTRIP.THICK_CLASS ,
FMSTRIP.WIDTH_CLASS ,
POSTFORCE.SEG_NO ,
CALFORCE.ENTRY_THICK ,
CALFORCE.EXIT_THICK ,
POSTFORCE.ENTRY_THICK ,
POSTFORCE.EXIT_THICK ,
CALFORCE.DFORCEDDTHICK,
CALFORCE.REL_REDU ,
POSTFORCE.STRIP_WIDTH,
POSTFORCE.REL_REDU ,
CALFORCE.ENTRY_TEMP ,
CALFORCE.EXIT_TEMP ,
POSTFORCE.ENTRY_TEMP ,
POSTFORCE.EXIT_TEMP ,
POSTFORCE.CIRC_SPEED  ,
CALFORCE.EXIT_TENSION,
SUB.BACK_TEN,
SUB.EXIT_THICK,
ACT.FM_THICK ,
CALFORCE.ROLL_FORCE Cal_F,
POSTFORCE.ROLL_FORCE post_F,
(SUB.FORCE+SUB.FORCE_WS)  act_F,
(CALFORCE.ROLL_FORCE - (SUB.FORCE+SUB.FORCE_WS)) pre_Err,
(POSTFORCE.ROLL_FORCE - (SUB.FORCE+SUB.FORCE_WS)) post_Err,
CALFORCE.CORR_FORCE_STAND,
POSTFORCE.CORR_FORCE_STAND,
CALFORCE.KM,
POSTFORCE.KM,
CALFORCE.CHEM_COEFF,--------------------
POSTFORCE.CHEM_COEFF,
CALFORCE.KM_TEN,
POSTFORCE.KM_TEN,
CALFORCE.STRAIN,
POSTFORCE.STRAIN,----------------
CALFORCE.STRAIN_RATE,
POSTFORCE.STRAIN_RATE,
POSTFORCE.ROLL_DIAM,
CALFORCE.BK,
CALFORCE.CORR_FLOW,
POSTFORCE.FORWARD_SLIP,
CALFORCE.TEMP_COEFF,
POSTFORCE.TEMP_COEFF,
CALFORCE.QF,
POSTFORCE.QF,
SUB.BEND_FORCE,
PDI.CARBON,
pdi.MANGANESE,
PDI.SILICON,
PDI.NIOBIUM,
PDI.CHROMIUM,
PDI.VANADIUM,
PDI.MOLYBDENUM,
PDI.NIOBIUM,
PDI.TITANIUM,
PDI.COPPER
FROM AP.AP_STRIP_PDI  AS PDI 
JOIN AP.SCC_FMSTRIP AS FMSTRIP  ON  FMSTRIP.STRIP_NO =PDI.STRIPNO 
JOIN AP.SCC_ACT_FMSEG AS ACT ON act.SEG_NO = 1 AND ACT.STRIP_NO = PDI.STRIPNO AND (ACT.STRIP_NO = '220170000300' OR ACT.STRIP_NO = '220153200500')
JOIN AP.SCC_CALC_ROLLFORCE AS CALFORCE ON CALFORCE.STRIP_NO =PDI.STRIPNO 
JOIN AP.SCC_POST_ROLLGAP AS postroll ON postroll.STRIP_NO = pdi.STRIPNO AND postroll.STAND_NO = calforce.STAND_NO AND postroll.SEG_NO = act.SEG_NO
JOIN AP.SCC_POST_ROLLFORCE AS POSTFORCE ON  postforce.STRIP_NO = pdi.STRIPNO  AND postforce.SEG_NO = act.SEG_NO AND postforce.STAND_NO =calforce.STAND_NO 
JOIN AP.SCC_ACT_FMSEGACT_SUB AS SUB ON SUB.STRIP_NO = pdi.STRIPNO AND SUB.SEG_NO =act.SEG_NO AND SUB.STAND_NO = calforce.STAND_NO 
JOIN AP.SCC_POST_TEMP AS POSTTEMP ON POSTTEMP.STRIP_NO =PDI.STRIPNO AND POSTTEMP.STAND_NO =CALFORCE.STAND_NO  AND POSTTEMP.SEG_NO =ACT.SEG_NO 
JOIN AP.SCC_CALC_TEMP AS CALTEMP ON CALTEMP.STRIP_NO =PDI.STRIPNO AND CALTEMP.STAND_NO =CALFORCE.STAND_NO
ORDER BY PDI.TOC ,  PDI.STRIPNO , CALFORCE.STAND_NO


SELECT POSTFORCE.TOM TOC,POSTFORCE.STRIP_NO ,PDI.STGRADE ,POSTFORCE.STAND_NO ,PDI.SFC,PDI.QUALITYNO ,FMSTRIP.THICK_CLASS ,FMSTRIP.WIDTH_CLASS ,POSTFORCE.SEG_NO ,CALFORCE.ENTRY_THICK ,CALFORCE.EXIT_THICK ,POSTFORCE.ENTRY_THICK ,POSTFORCE.EXIT_THICK ,CALFORCE.DFORCEDDTHICK,CALFORCE.REL_REDU ,POSTFORCE.STRIP_WIDTH,POSTFORCE.REL_REDU ,CALFORCE.ENTRY_TEMP ,CALFORCE.EXIT_TEMP ,POSTFORCE.ENTRY_TEMP ,POSTFORCE.EXIT_TEMP ,POSTFORCE.CIRC_SPEED  ,CALFORCE.EXIT_TENSION,SUB.BACK_TEN,SUB.EXIT_THICK,ACT.FM_THICK ,CALFORCE.ROLL_FORCE Cal_F,POSTFORCE.ROLL_FORCE post_F,(SUB.FORCE+SUB.FORCE_WS)  act_F,(CALFORCE.ROLL_FORCE - (SUB.FORCE+SUB.FORCE_WS)) pre_Err,(POSTFORCE.ROLL_FORCE - (SUB.FORCE+SUB.FORCE_WS)) post_Err,CALFORCE.CORR_FORCE_STAND,POSTFORCE.CORR_FORCE_STAND,CALFORCE.KM,POSTFORCE.KM,CALFORCE.CHEM_COEFF,POSTFORCE.CHEM_COEFF,CALFORCE.KM_TEN,POSTFORCE.KM_TEN,CALFORCE.STRAIN,POSTFORCE.STRAIN,CALFORCE.STRAIN_RATE,POSTFORCE.STRAIN_RATE,POSTFORCE.ROLL_DIAM,CALFORCE.BK,CALFORCE.CORR_FLOW,POSTFORCE.FORWARD_SLIP,CALFORCE.TEMP_COEFF,POSTFORCE.TEMP_COEFF,CALFORCE.QF,POSTFORCE.QF,SUB.BEND_FORCE,PDI.CARBON,pdi.MANGANESE,PDI.SILICON,PDI.NIOBIUM,PDI.CHROMIUM,PDI.VANADIUM,PDI.MOLYBDENUM,PDI.NIOBIUM,PDI.TITANIUM,PDI.COPPER FROM AP.AP_STRIP_PDI  AS PDI JOIN  AP.SCC_FMSTRIP AS FMSTRIP  ON  FMSTRIP.STRIP_NO =PDI.STRIPNO  JOIN AP.SCC_ACT_FMSEG AS ACT ON act.SEG_NO = 1  AND ACT.STRIP_NO = PDI.STRIPNO AND (ACT.STRIP_NO = '4.294967e+09' OR ACT.STRIP_NO = '4.294967e+09') JOIN  AP.SCC_CALC_ROLLFORCE AS CALFORCE ON CALFORCE.STRIP_NO =PDI.STRIPNO JOIN AP.SCC_POST_ROLLGAP AS postroll ON postroll.STRIP_NO = pdi.STRIPNO AND postroll.STAND_NO = calforce.STAND_NO AND postroll.SEG_NO = act.SEG_NO JOIN AP.SCC_POST_ROLLFORCE AS POSTFORCE ON  postforce.STRIP_NO = pdi.STRIPNO  AND postforce.SEG_NO = act.SEG_NO AND postforce.STAND_NO =calforce.STAND_NO JOIN AP.SCC_ACT_FMSEGACT_SUB AS SUB ON SUB.STRIP_NO = pdi.STRIPNO AND SUB.SEG_NO =act.SEG_NO AND SUB.STAND_NO = calforce.STAND_NO JOIN AP.SCC_POST_TEMP AS POSTTEMP ON POSTTEMP.STRIP_NO =PDI.STRIPNO AND POSTTEMP.STAND_NO =CALFORCE.STAND_NO  AND POSTTEMP.SEG_NO =ACT.SEG_NO JOIN AP.SCC_CALC_TEMP AS CALTEMP ON CALTEMP.STRIP_NO =PDI.STRIPNO AND CALTEMP.STAND_NO =CALFORCE.STAND_NO ORDER BY PDI.TOC ,  PDI.STRIPNO , CALFORCE.STAND_NO
                                