#include <rtx51tny.h>
extern unsigned char wt_wait(unsigned char tick,unsigned int count);
unsigned long count0=0,count1=0;
void job0(void) _task_ 0
{	
	os_create_task(1);	
	while(1)
	{
		wt_wait(255,1);
		count0++;
	}
}

void job1(void) _task_ 1
{
	while(1)
	{
		wt_wait(255,2);
		count1++;
	}
}