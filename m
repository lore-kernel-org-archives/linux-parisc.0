From: Helge Deller <deller@gmx.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 20 May 2012 23:09:09 +0200
Message-ID: <4FB95D75.1020705@gmx.de>
References: <4FA9975C.5060708@bergerie>     <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>     <4FAADE2A.9080803@bergerie>   <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>   <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>   <4FB182F8.2040403@gmx.de>   <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>     <1337069366.3005.10.camel@dabdike.lan>    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>    <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>    <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>   <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>   <4FB6BA76.6010101@gmx.de>  <1337508060.2682.13.came
 l@dabdike.int.hansenpartnership.com>  <4FB941EF.4060304@gmx.de> <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/20/2012 10:15 PM, James Bottomley wrote:
> On Sun, 2012-05-20 at 21:11 +0200, Helge Deller wrote:
>> On 05/20/2012 12:01 PM, James Bottomley wrote:
>>> On Fri, 2012-05-18 at 23:09 +0200, Helge Deller wrote:
>>>> James, here is the full kernel log. Does this help?
>>> Yes and no: it shows clearly we got all the way through the initrd, so
>>> we've gone through the alias region thousands of times doing flushes.
>>>
>>>> Kernel Fault: Code=26 regs=8fc30940 (Addr=0f2ff000)
>>>>
>>> It's an access rights trap, presumably on the alias tlb, since the
>>> address is definitely in the alias region.  The obvious candidate is the
>>> protection id deposit in do_alias
>>>
>>> 	depw,z		\prot,8,7,\prot
>>>
>>> but that all checks out fine (you can compare it with
>>> make_insert_tlb_11). So the page should have read, write and dirty set.
>>>
>>> The interesting thing is that the only way to get an access rights trap
>>> in the kernel is if the protection type is zero and I just can't see how
>>> do_alias would zero out \prot in a way that functions on your C3000
>>> (PA2.0) but not on the PA1.1 systems.
>>>
>>> Are you sure this is booting the same kernel?
>> Yes, since I use tftboot to deliver same vmlinux kernel to all my machines
>> for bootup.
> The penny finally dropped on Dave's last comment.  The _20 path needs to
> use wide instructions even though it's executing narrow code because we
> have to use the PA2.0 tlb insertion instruction, so it's not
> CONFIG_64BIT that's the differentiator, but which interruption path
> we're on.
>
> Does this fix it?
Yes, this fixed the crash. No segfaults at all on all my machines  :-)

C3000:~# uname -a
Linux c3000 3.4.0-rc7-32bit+ #11 Sun May 20 22:30:48 CEST 2012 parisc 
GNU/Linux

715/64:~# uname -a
Linux pa64 3.4.0-rc7-32bit+ #11 Sun May 20 22:30:48 CEST 2012 parisc 
GNU/Linux

B160L:~# uname -a
Linux b160 3.4.0-rc7-32bit+ #11 Sun May 20 22:30:48 CEST 2012 parisc 
GNU/Linux

REALLY COOL!

This is with
- Linus git head (which includes James "parisc-fixes" branch)
- with Daves vmlinux.lds.S patch
- and James PA 20 TLB-fix patch above.



Just to make sure, I just wanted to build the same kernel now for 64bit...
Sadly hppa64-ld crashes for me...

[deller@p100 linus-linux-2.6-64bit]$ gdb 
/opt/cross-hppa-4.6/bin/hppa64-linux-ld
GNU gdb (GDB) Fedora (7.3.1-48.fc15)
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /opt/cross-hppa-4.6/bin/hppa64-linux-ld...done.
(gdb) run --build-id -o .tmp_vmlinux2 -T arch/parisc/kernel/vmlinux.lds 
arch/parisc/kernel/head.o init/built-in.o --start-group usr/built-in.o 
arch/parisc/mm/built-in.o arch/parisc/kernel/built-in.o 
arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o 
kernel/built-in.o mm/built-in.o fs/built-in.o ipc/built-in.o 
security/built-in.o crypto/built-in.o block/built-in.o lib/lib.a 
arch/parisc/lib/lib.a `hppa64-linux-gcc -print-libgcc-file-name` 
lib/built-in.o arch/parisc/lib/built-in.o `hppa64-linux-gcc 
-print-libgcc-file-name` drivers/built-in.o sound/built-in.o 
firmware/built-in.o net/built-in.o --end-group .tmp_kallsyms1.o
Starting program: /opt/cross-hppa-4.6/bin/hppa64-linux-ld --build-id -o 
.tmp_vmlinux2 -T arch/parisc/kernel/vmlinux.lds 
arch/parisc/kernel/head.o init/built-in.o --start-group usr/built-in.o 
arch/parisc/mm/built-in.o arch/parisc/kernel/built-in.o 
arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o 
kernel/built-in.o mm/built-in.o fs/built-in.o ipc/built-in.o 
security/built-in.o crypto/built-in.o block/built-in.o lib/lib.a 
arch/parisc/lib/lib.a `hppa64-linux-gcc -print-libgcc-file-name` 
lib/built-in.o arch/parisc/lib/built-in.o `hppa64-linux-gcc 
-print-libgcc-file-name` drivers/built-in.o sound/built-in.o 
firmware/built-in.o net/built-in.o --end-group .tmp_kallsyms1.o
/opt/cross-hppa-4.6/bin/hppa64-linux-ld:
Program received signal SIGSEGV, Segmentation fault.
0x00000034d7a4a26e in vfprintf () from /lib64/libc.so.6
Missing separate debuginfos, use: debuginfo-install 
glibc-2.14.1-6.x86_64 zlib-1.2.5-6.fc15.x86_64
(gdb) bt
#0  0x00000034d7a4a26e in vfprintf () from /lib64/libc.so.6
#1  0x00000034d7a4b4f4 in buffered_vfprintf () from /lib64/libc.so.6
#2  0x00000034d7a4691e in vfprintf () from /lib64/libc.so.6
#3  0x0000000000425a2d in _bfd_default_error_handler (fmt=0x4c6ff3 
"+0xlx): cannot reach %s") at /mnt/sda4/home/cvs/binutils/bfd/bfd.c:727
#4  0x0000000000441de0 in elf_hppa_final_link_relocate (eh=0x773890, 
sym_sec=<optimized out>, info=0x6e8d00, value=<optimized out>, 
contents=0x2a624e0 "\b\003\002A\017\302\022\301\b\036\002Cs\301\002(+v 
", input_section=0x7627c8,
     output_bfd=0x705900, input_bfd=0x73e270, rel=0x7779e0) at 
/mnt/sda4/home/cvs/binutils/bfd/elf64-hppa.c:3276
#5  elf64_hppa_relocate_section (output_bfd=0x705900, info=0x6e8d00, 
input_bfd=0x73e270, input_section=0x7627c8, contents=0x2a624e0 
"\b\003\002A\017\302\022\301\b\036\002Cs\301\002(+v ", relocs=<optimized 
out>, local_syms=0x2d1b230,
     local_sections=0x2dec550) at 
/mnt/sda4/home/cvs/binutils/bfd/elf64-hppa.c:3930
#6  0x000000000046250f in elf_link_input_bfd (flinfo=0x7fffffffd910, 
input_bfd=0x73e270) at /mnt/sda4/home/cvs/binutils/bfd/elflink.c:9582
#7  0x0000000000463ff7 in bfd_elf_final_link (abfd=0x705900, 
info=0x6e8d00) at /mnt/sda4/home/cvs/binutils/bfd/elflink.c:10734
#8  0x000000000043f032 in elf64_hppa_final_link (abfd=0x705900, 
info=0x6e8d00) at /mnt/sda4/home/cvs/binutils/bfd/elf64-hppa.c:3028
#9  0x0000000000417e26 in ldwrite () at 
/mnt/sda4/home/cvs/binutils/ld/ldwrite.c:582
#10 0x0000000000402f9c in main (argc=33, argv=0x7fffffffdce8) at 
/mnt/sda4/home/cvs/binutils/ld/ldmain.c:420

this is with binutils CVS head (just pulled and compiled again), gcc 
from gcc-4.6 branch

Helge
