#include "iobasic.h"


int ofset=0;

int write_msg(std::string x)
{
	for(int i=0; i<x.size();i++)
		{
			char* writeon=ofset+videomem_address;
			*writeon = x[i];
			ofset++;
		}
	return 0;
}
