#include "iobasic.h"


int ofset=0;
int attr=0x07;

int write_msg(std::string x)
{
	for(int i=0; i<x.size();i++)
		{
			char* writeon=ofset+videomem_address;
			*writeon = x[i];
			writeon++;
			*writeon = attr;
			ofset+=2;
		}
	return 0;
}
