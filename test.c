#include <rtx51tny.h>
#include "WtWait.h"

unsigned long count0 = 0, count1 = 0;
void job0(void) _task_ 0
{
	os_create_task(1);
	while (1)
	{
		wt_wait(K_TMO | K_SIG, 1, 255);
		count0++;
	}
}

void job1(void) _task_ 1
{
	while (1)
	{
		wt_wait(K_TMO | K_SIG, 3, 255);
		count1++;
	}
}