Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA17322
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 00:42:48 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 May 2000 06:43:03 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA27221;
	Tue, 30 May 2000 16:42:29 +1000
Date: Tue, 30 May 2000 16:42:29 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: bame@puffin.external.hp.com
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Foiled by the linker again
In-Reply-To: <Pine.LNX.4.21.0005301242190.15777-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0005301631550.15777-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 30 May 2000, Alan Modra wrote:

> On Mon, 29 May 2000 bame@puffin.external.hp.com wrote:
> 
> > /home/bame/xc/bin/../lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/../../../../hppa1.1-linux/lib/libc.a(execve.o): In function `__execve':
> > /users/bame/palinux/glibc/posix/../sysdeps/unix/sysv/linux/execve.c:39: undefined reference to `$global$'
> > collect2: ld returned 1 exit status
> 
> This is a bogus error message.  The real error is that a call to
> __pthread_kill_other_threads_np is too far to be reached by a branch so
> needs to go through a stub, but the relevant stub
> _____long_branch_stub___pthread_kill_other_threads_np isn't found for some
> reason.
> 
> Chasing it up...

It turned out that elf32_hppa_bfd_final_link_relocate wasn't handling
undefined weak symbols correctly.  I've fixed this, the bogus error
message, and a handfull of other minor things, and commited the fixes to
pehp CVS.

Now I get
$ ld/ld-new -o tar /usr/parisc/lib/crt1.o /usr/parisc/lib/crti.o
/usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/crtbegin.o
-L/usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112 -L/usr/parisc/lib/
rrtar.o -lgcc -lc -lgcc
/usr/parisc/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/crtend.o
/usr/parisc/lib/crtn.o
/usr/parisc/lib//libc.a(nsswitch.o)(.data+0x64): undefined reference to
`_nss_files_getaliasent_r'

which looks like a problem with my glibc build.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
