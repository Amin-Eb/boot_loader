#include "iobasic.h"


int ofset=0;
char attr=(char)0x07;

int write_msg(char* x, int length)
{
	short data;
	for(int i=0; i<length; i++){
		*(char*)&data = x[i];
		*((char*)&data+1) = attr;
		videomem_address[(ofset < videomem_size/2 ? ofset : ofset=0)] = data;
	}
	return 0;
}
