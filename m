Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22945
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 09:10:54 -0600
To: Alan Modra <alan@linuxcare.com.au>
Cc: bame@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Foiled by the linker again 
In-reply-to: Your message of "Tue, 30 May 2000 16:42:29 +1000."
             <Pine.LNX.4.21.0005301631550.15777-100000@front.linuxcare.com.au>
Date: Tue, 30 May 2000 09:11:19 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12wnfr-0007iW-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= On Tue, 30 May 2000, Alan Modra wrote:
= 
= > On Mon, 29 May 2000 bame@puffin.external.hp.com wrote:
= > 
= > > /home/bame/xc/bin/../lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/../../../.
./hppa1.1-linux/lib/libc.a(execve.o): In function `__execve':
= > > /users/bame/palinux/glibc/posix/../sysdeps/unix/sysv/linux/execve.c:39: u
ndefined reference to `$global$'
= > > collect2: ld returned 1 exit status
= > 
= > This is a bogus error message.  The real error is that a call to
= > __pthread_kill_other_threads_np is too far to be reached by a branch so
= > needs to go through a stub, but the relevant stub
= > _____long_branch_stub___pthread_kill_other_threads_np isn't found for some
= > reason.
= > 
= > Chasing it up...
= 
= It turned out that elf32_hppa_bfd_final_link_relocate wasn't handling
= undefined weak symbols correctly.  I've fixed this, the bogus error
= message, and a handfull of other minor things, and commited the fixes to
= pehp CVS.
= 
= Now I get
= $ ld/ld-new -o tar /usr/parisc/lib/crt1.o /usr/parisc/lib/crti.o
= /usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/crtbegin.o
= -L/usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112 -L/usr/parisc/lib/
= rrtar.o -lgcc -lc -lgcc
= /usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/crtend.o
= /usr/parisc/lib/crtn.o
= /usr/parisc/lib//libc.a(nsswitch.o)(.data+0x64): undefined reference to
= `_nss_files_getaliasent_r'
= 
= which looks like a problem with my glibc build.

Yup.  Grab the file glibc/PARISC-EXTRA-FILES which contains a list of
the missing .o files which you can add by hand with 'hppa1.1-linux-ar'.

	-P
