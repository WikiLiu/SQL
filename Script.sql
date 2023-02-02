SELECT pdi.STRIPNO STRIP_NO
FROM AP.AP_STRIP_PDI  AS PDI 
JOIN AP.SCC_ACT_FMSEG AS ACT ON act.SEG_NO =3 AND ACT.STRIP_NO  = PDI.STRIPNO AND pDI.TOC<=to_date('2022-11-01','yyyy-mm-dd') AND pDI.TOC>=to_date('2021-08-01','yyyy-mm-dd')
JOIN AP.SCC_POST_ROLLGAP AS ROLLGAP ON ROLLGAP.STRIP_NO =PDI.STRIPNO AND ROLLGAP.SEG_NO =3 AND ROLLGAP.STAND_NO  = 7
AND ABS(act.FM_THICK-pdi.FMOUTTHICK)>0.05 ORDER BY PDI.TOC 

--
--SELECT 	AP.SCC_POST_ROLLGAP.STRIP_NO ,AP.SCC_POST_ROLLGAP.CORR_ZEROPOINT_USE,TOC 
--FROM AP.SCC_POST_ROLLGAP 	where  	 AP.SCC_POST_ROLLGAP.TOC > (select TOC - 30 Minutes	 from AP.SCC_FMSTRIP where AP.SCC_FMSTRIP.STRIP_NO = 220086600300)
--AND  AP.SCC_POST_ROLLGAP.TOC < (select TOC	 from AP.SCC_FMSTRIP where AP.SCC_FMSTRIP.STRIP_NO = 220086600300) 		AND AP.SCC_POST_ROLLGAP.STRIP_NO != 220086600300
--AND AP.SCC_POST_ROLLGAP.SEG_NO = 3 AND AP.SCC_POST_ROLLGAP.STAND_NO = 7 
--ORDER BY TOC DESC fetch first 1 rows ONLY





--SELECT STEEL_GRADE ,COUNT(STEEL_GRADE) AS CO FROM SCC_FMSTRIP  GROUP BY STEEL_GRADE ORDER BY CO DESC 


SELECT  AP.GAUGE_SAMPLE.DATASEQ  FROM AP.GAUGE_SAMPLE, AP.AP_STRIP_PDI WHERE ITEM LIKE 'thicknessF7Exit%' AND  AP.GAUGE_SAMPLE.STRIPNO = AP.AP_STRIP_PDI.STRIPNO AND AP.GAUGE_SAMPLE.STRIPNO = 220003601600




SELECT * FROM AP.AP_MILLSAMPLE WHERE STRIPNO = '220146904400';
