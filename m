Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2ED98482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 22:56:39 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (unknown [145.254.198.221])
	by mx04.nexgo.de (Postfix) with ESMTP id F13F82F359
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 06:56:31 +0200 (CEST)
Message-ID: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de>
Date: Fri, 31 Aug 2001 06:56:15 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Kernel failures
List-ID: <linux-parisc.vger.kernel.org>

  Hi there!

When I played a little bit  with the kernel, I found some failures.
My machine is a 715/100 with a second  Graphics-Card (Coral SGC). If the 
second graphics card is disable (I just pulled off the ribbon cable), 
the machine boots fine even with stifb enabled. Now I tried to boot with 
the second card enabled, so I disable stifb (which supports only one 
graphics card atm) and enabled STI-Console only.  Booting this kernel, 
it detects my two graphic cards, but crashed when callling the functionn 
sti_init_graph for the second card. I used the kernel 2.4.7-pa1.
The last Bootmessages are:
SNIP----------
        sticonsole_init: searching for STI ROMs
        STI word mode ROM at f0025000, hpa=f8000000
        STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
        STI device: HPA208LC1024
        STI word mode ROM at f0025000, hpa=f4000000
        STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
SNAP---------

Trying the same thing with kernel 2.4.9-pa5 leeds to a crash right after 
detecting the first card.
SNIP----------
        sticonsole_init: searching for STI ROMs
        STI word mode ROM at f0025000, hpa=f4000000
        STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
SNAP---------

The other failures I found are:  
1. Every time my machine dumps the stack, and I check GR02 and IAOQ, 
they tell me that the function which trashed the kernel are 
parisc_terminate and parisc_showstack (or s.th like that). This isn't 
normal, isn't it?
2. Enabling IO_HPPA_REMAP in io.h causes a error in ioremap.c while 
compiling the kernel:
SNIP----------
            ioremap.c: In function `remap_area_pages':
            ioremap.c:79: warning: passing arg 1 of `pmd_alloc' from 
incompatible pointer type
            ioremap.c:79: warning: passing arg 2 of `pmd_alloc' makes 
pointer from integer without a cast
            ioremap.c:79: too few arguments to function `pmd_alloc'
SNAP----------

3. Enabling SMB-Fs in the kernel gives an error message:
SNIP-----------
        gcc -D__KERNEL__ -I/usr/src/linux/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
-fno-strict-aliasing -fno-common
               -D__linux__ -pipe -fno-strength-reduce -mno-space-regs 
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 
-mschedule=7100LC
               -DSMBFS_PARANOIA  -c -o ioctl.o ioctl.c
        ioctl.c: In function `smb_ioctl':
        ioctl.c:31: `__kernel_old_uid_t' undeclared (first use in this 
function)
        ioctl.c:31: (Each undeclared identifier is reported only once
        ioctl.c:31: for each function it appears in.)
        make[3]: *** [ioctl.o] Fehler 1
        make[3]: Leaving directory `/usr/src/linux/fs/smbfs'
        make[2]: *** [first_rule] Fehler 2
        make[2]: Leaving directory `/usr/src/linux/fs/smbfs'
        make[1]: *** [_subdir_smbfs] Fehler 2
        make[1]: Leaving directory `/usr/src/linux/fs'
        make: *** [_dir_fs] Fehler 2
SNAP-----------
4. My HIL-Keyboard isn't detected anymore by the new 2.4.9-kernel. Using 
Kernel 2.4.7-pa1, after the initalisation of HIL, I get a bootmessage like
 "HIL: keyboard found".  Booting the new Kernel gives me only the two 
lines of HIL initalisation, but nothing about my Keyboard. Which is a 
PS/2-Keyboard on a HIL-Adaptorbox. Both Kernel were configured via "make 
oldconfig".

That's all folks!! ;-)

I would really like to solve these problems and support a patch for 
them. But as I'm not a kernel hacker guy, the only assistence I can give 
is to test new code and to report wether it works or not.
Can somebody with more knowledge about kernelhacking have a look at 
these failures?
Thanks,
        Rüdiger
