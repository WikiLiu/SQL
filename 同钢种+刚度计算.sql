SELECT pdi.STRIPNO LAST_STRIP_NO,SUB.FORCE+SUB.FORCE_WS  LAST_FORCE_SUM,CALFORCE.ROLL_FORCE  LAST_ROLL_FORCE_CAL,act.FM_THICK LAST_FM_THICK_ACT,pdi.FMOUTTHICK LAST_FMOUTTHICK 			
FROM AP.AP_STRIP_PDI   AS pdi, AP.SCC_CALC_ROLLFORCE AS CALFORCE, AP.SCC_ACT_FMSEGACT_SUB AS SUB , AP.SCC_ACT_FMSEG AS ACT			
WHERE pdi.STRIPNO = (select FMSTRIP.STRIP_NO 				from AP.SCC_FMSTRIP AS FMSTRIP 		
where   FMSTRIP.TOC<(select TOC from AP.SCC_FMSTRIP where AP.SCC_FMSTRIP.STRIP_NO =  220027600300) 			
AND  FMSTRIP.TOC>(select TOC - 3 MONTHS	 from AP.SCC_FMSTRIP where AP.SCC_FMSTRIP.STRIP_NO =  220027600300) 			
ORDER BY TOC DESC fetch first 1 rows ONLY)			
AND calforce.STRIP_NO = pdi.STRIPNO AND calforce.STAND_NO  = 7
AND SUB.STRIP_NO = pdi.STRIPNO AND SUB.SEG_NO = 3	AND SUB.STAND_NO = 7 
AND ACT.STRIP_NO =  pdi.STRIPNO AND ACT.SEG_NO =3

SELECT SUB.STRIP_NO ,SUB.STAND_NO ,SUB.FORCE + SUB.FORCE_WS ,SUB.EXIT_THICK ,GAP.ROLLGAP_SET ,GAP.ROLLGAP_TRUE,SUB.SCREW_DOWN,GAP.CORR_ZEROPOINT_USE ,GAP.CORR_ZEROPOINT  
FROM AP.SCC_ACT_FMSEGACT_SUB SUB,AP.SCC_POST_ROLLGAP GAP
WHERE SUB.SEG_NO = 2 AND SUB.STRIP_NO = GAP.STRIP_NO AND GAP.SEG_NO = SUB.SEG_NO AND GAP.STAND_NO  = SUB.STAND_NO 
ORDER BY SUB.STRIP_NO ,SUB.STAND_NO 


SELECT * FROM AP.GAUGE_SAMPLE AS GAUGE  WHERE GAUGE.STRIPNO  = '220170101500';

SELECT * FROM AP_MILLSAMPLE WHERE STRIPNO = '220170101500';

