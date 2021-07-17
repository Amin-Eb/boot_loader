#include<windows.h>
#include<iostream>
#include<string.h>
using namespace std;
int main()
{
	while(true)
	{
		cout<<"for start, press 's' key. \nnote: you need nasm and qemu installed on your system! \n";
		char ch[1];
		cin>>ch;
		if(strcmp(ch,"s")==0)
		{
			system("nasm boot.asm -o boot_runner.bin");
			system("qemu-system-i386 boot_runner.bin");
			_sleep(1000);
		}
		else
		{
			cout<<"for start, press 's' key. \nnote: you need nasm and qemu installed on your system! \n";
			cin>>ch;
		}
	}
	
}
