;#include <rtx51tny.h>

;unsigned char wt_wait(unsigned char tick, unsigned int count)
;{
;	unsigned char ret = TMO_EVENT;
;	while(count-- && ret == TMO_EVENT)
;	{
;		ret = os_wait2(K_SIG | K_TMO, tick);
;	}
;	return ret;
;}


NAME	WTWAIT
?PR?_wt_wait?WTWAIT       SEGMENT CODE 
	EXTRN	CODE (_os_wait2)
	PUBLIC	_wt_wait 
; unsigned char wait(unsigned char tick,unsigned int count)
	RSEG  ?PR?_wt_wait?WTWAIT
_wt_wait:
	USING	0
	;MOV  	tick?040,R7;=R0
	;MOV  	count?041,R4;=R1
	;MOV  	count?041+01H,R5;=R2
	MOV	R0,AR7
	MOV	R1,AR4
	MOV	R2,AR5
; {
			
; 	unsigned char ret = TMO_EVENT;
	MOV  	R7,#08H
?C0001:
; 	while(count-- && ret == TMO_EVENT)
	MOV  	A,R2
	DEC  	R2
	MOV  	R4,AR1
	JNZ  	?C0004
	DEC  	R1
?C0004:
	ORL  	A,R4
	JZ   	?C0002
	MOV  	A,R7
	XRL  	A,#08H
	JNZ  	?C0002
; 	{			
; 		ret = os_wait2(K_SIG | K_TMO, tick);
	PUSH	AR0;
	PUSH	AR1
	PUSH	AR2
	MOV  	R5,AR0
	MOV  	R7,#03H
	LCALL	_os_wait2
	POP		AR2
	POP		AR1
	POP		AR0
; 	}			
	SJMP 	?C0001
?C0002:
; 	return ret;			
; }			
	RET  	
; END OF _wt_wait
	END
