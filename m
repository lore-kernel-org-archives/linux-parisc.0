From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 19:05:27 +0100
Message-ID: <02c86f80-c5c8-c652-21b4-2a32d51c15fe@gmx.de>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
 <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
 <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
 <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
 <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03>
 <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71>
 <alpine.LRH.2.20.1611282036240.11649@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611282036240.11649@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 28.11.2016 19:37, Meelis Roos wrote:
>>>>>> Command line for kernel: 'root=/dev/sda3 console=ttyS0 
>>>>>> palo_kernel=2/vmlinux'
>>>>>> Selected kernel: /vmlinux from partition 2
>>>>>
>>>>> I'm missing here the information of the various sections
>>>>> in the vmlinux file which the boot loader usually prints
>>>>> here.
>>>>
>>>> Well, I did not leave anything out AFAIK?
>>>
>>> It seems palo can't read the vmlinux file (aka get's confused with the contents
>>> and doesn't print the ELF section list).
>>>
>>> Did you maybe used a recent binutils package?
> 
> Old binutils, but here is my vmlinux that does not boot (slightly larger 
> than vmlinux-4.8.0):
> 
> http://kodu.ut.ee/~mroos/vmlinux-4.9.0-rc6-00240-gd8e435f

This kernel boots nicely for me on my c3000 machine:

Main Menu: Enter command > bo pri
Interact with IPL (Y, N, Q)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               2      33   f0 Palo
2              34     157   83 ext2
5             159   134887   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 17631904(0) bytes @ 0x140000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=LABEL=ROOT rootfstype=ext4 initrd=2/initrd.img HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102
...
Current command line:
2/vmlinux-4.9.0-rc6-00240-gd8e435f root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102
 0: 2/vmlinux-4.9.0-rc6-00240-gd8e435f
 1: root=LABEL=ROOT
 2: rootfstype=ext4
 3: HOME=/
 4: panic_timeout=60
 5: panic=-1
 6: console=ttyS0
 7: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
'x'    reset and reboot machine
? b

Command line for kernel: 'root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-4.9.0-rc6-'
Selected kernel: /vmlinux-4.9.0-rc6-00240-gd8e435f from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 134688 mediaptr 0x1000
Segment 1 load 00121000 size 22272 mediaptr 0x22000
Segment 2 load 00200000 size 4456864 mediaptr 0x28000
Segment 3 load 00641000 size 1387492 mediaptr 0x469000
Segment 4 load 00800000 size 1084600 mediaptr 0x5bc000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 4.9.0-rc6-00240-gd8e435f (mroos@a500) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #104 Sun Nov 27 16:30:20 EET 2016
unwind_init: start = 0x4075a444, end = 0x40793be4, entries = 14714
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
...

Helge

