#include<windows.h>
//-----------------CopyRight© Mos 2021------------------------\\
\\-------------------- AEbi & Mosa----------------------------//
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
			system("nasm boot_32pm.asm -o boot_32pm.bin");
			_sleep(500);
			system("qemu-system-i386 boot_32pm.bin");
			_sleep(500);
		}
		else
		{
			cout<<"for start, press 's' key. \nnote: you need nasm and qemu installed on your system! \n";
			cin>>ch;
		}
	}
	
}
