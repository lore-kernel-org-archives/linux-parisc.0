Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgate5.cinetic.de (mailgate5.cinetic.de [217.72.192.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D8F7482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 00:14:07 -0700 (MST)
Received: from web.de (fmomail02.dlan.cinetic.de [172.20.1.46])
	by mailgate5.cinetic.de (8.11.6/8.11.2/SuSE Linux 8.11.0-0.4) with SMTP id h2Q7E5224074
	for parisc-linux@lists.parisc-linux.org; Wed, 26 Mar 2003 08:14:06 +0100
Date: Wed, 26 Mar 2003 08:14:06 +0100
Message-Id: <200303260714.h2Q7E5224074@mailgate5.cinetic.de>
MIME-Version: 1.0
From: "Berthold Gunreben" <b.gunreben@web.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.3.2 patches updated, still no working sysdep-cancel
Content-Type: text/plain; charset="iso-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Carlos, 
 
Carlos O'Donell <carlos@baldric.uwo.ca> schrieb am 26.03.03 00:41:24:  
> Patches updated:  
> http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz  
>   
> Still no luck on getting sysdep-cancel to work. I'll need another pair  
> of eyes to look at the assembly in sysdep-cancel.h  
  
I was successful to compile the first version of your patches (after fixing the map  
part). Here is the output of  
# /lib/libc.so.6 
GNU C Library stable release version 2.3.2, by Roland McGrath et al. 
Copyright (C) 2003 Free Software Foundation, Inc. 
This is free software; see the source for copying conditions. 
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A 
PARTICULAR PURPOSE. 
Compiled by GNU CC version 3.3 20030226 (prerelease) (SuSE Linux). 
Compiled on a Linux 2.4.19 system on 2003-03-25. 
Available extensions: 
        GNU libio by Per Bothner 
        crypt add-on version 2.1 by Michael Glad and others 
        linuxthreads-0.10 by Xavier Leroy 
        BIND-8.2.3-T5B 
        libthread_db work sponsored by Alpha Processor Inc 
        NIS(YP)/NIS+ NSS modules 0.19 by Thorsten Kukuk 
Report bugs using the `glibcbug' script to <bugs@gnu.org>. 
 
I was not successful to compile your current version: 
 
gcc ../sysdeps/unix/sysv/linux/sigprocmask.c -c -std=gnu99 -O2 -Wall -Winline -W 
strict-prototypes -Wwrite-strings -fstrict-aliasing -g -mpa-risc-1-1      -I../i 
nclude -I. -I/usr/src/packages/BUILD/glibc-2.3.2/cc/signal -I.. -I../libio  -I/u 
sr/src/packages/BUILD/glibc-2.3.2/cc -I../sysdeps/hppa/elf -I../linuxthreads/sys 
deps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxth 
reads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv - 
I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/s 
ysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/c 
ommon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../ 
sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize- 
32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ 
ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysde 
ps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /usr/lib/gcc-lib/hppa-su 
se-linux/3.3/include -isystem /usr/src/packages/BUILD/kernel-headers -D_LIBC_REE 
NTRANT -include ../include/libc-symbols.h       -o /usr/src/packages/BUILD/glibc 
-2.3.2/cc/signal/sigprocmask.o 
(echo '#include <sysdep.h>'; \ 
 echo 'PSEUDO (__kill, kill, 2)'; \ 
 echo ' ret'; \ 
 echo 'PSEUDO_END(__kill)'; \ 
 echo 'libc_hidden_def (__kill)'; \ 
 echo 'weak_alias (__kill, kill)'; \ 
 echo 'libc_hidden_weak (kill)'; \ 
) | gcc -c  -I../include -I. -I/usr/src/packages/BUILD/glibc-2.3.2/cc/signal -I. 
. -I../libio  -I/usr/src/packages/BUILD/glibc-2.3.2/cc -I../sysdeps/hppa/elf -I. 
./linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/ 
linux -I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/s 
ysdeps/unix/sysv -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa - 
I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu - 
I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysde 
ps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I.. 
/sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I. 
./sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ 
ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /usr/l 
ib/gcc-lib/hppa-suse-linux/3.3/include -isystem /usr/src/packages/BUILD/kernel-h 
eaders -D_LIBC_REENTRANT -include ../include/libc-symbols.h       -DASSEMBLER    
-x assembler-with-cpp -o /usr/src/packages/BUILD/glibc-2.3.2/cc/signal/kill.o - 
<stdin>: Assembler messages: 
<stdin>:2: Fatal error: Unknown opcode: `do_call_noerrno(kill, 2)' 
make[2]: *** [/usr/src/packages/BUILD/glibc-2.3.2/cc/signal/kill.o] Error 1 
make[2]: Leaving directory `/usr/src/packages/BUILD/glibc-2.3.2/signal' 
make[1]: *** [signal/subdir_lib] Error 2 
 
I still have to look into my patches, if they correct compared to your original 
patches. If you want me to run the test suite on the old version, I can recompile that 
version. 
 
Berthold 
______________________________________________________________________________
Ihre Freunde sind in Italien? Schicken Sie ihnen trotzdem eine SMS
mit WEB.DE FreeMail http://freemail.web.de/features/?mc=021172
