Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta06.chello.at (viemta06.chello.at [195.34.133.56])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13EB3482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Apr 2001 15:02:49 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3AD0D1F0.2B079EAC@dot.at>
Date: Sun, 08 Apr 2001 23:02:40 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>,
	Christoph Plattner <christoph.plattner@alcatel.at>,
	Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Many experiments on 720, but `init' fails !!
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at> <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk> <3AD09AFB.EBDFF975@dot.at>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

The same happens, if I use the `init' statically linked !



Christoph Plattner wrote:
> 
> A week ago, I reported the problem booting PA-Linux 0.5 with the new
> kernel and new selfmade cross tool chain.
> 
> The last week I used to experience with cross toolchain setup.
> The aim was to find away having "one" glibc-2 for cross development
> and for the target (to mount, NFS-ROOT). I also used tricks like
>         --prefix=/usr and
>         make install install_root=/usr/parisc/target....
> but the result and discussion with other showed following:
> 
>         There must be TWO glibc trees, one for the cross toolchain,
>         the other for the target. The second one is built with the
>         method defining prefix to /usr and install it in a target tree.
> 
> SO I build sash, a also build a bash (shared and static !), I build
> fileutils, text-utils, shell-utils, etc, etc.....
> The system boots with bash and I can mount, run programs, etc....
> 
> The I build "my own" startup stuff. A /sbin/init.d/xxx , etc/rc.d/xxx
> and so on. I also build a sysvinit-2.78 (and 2.77 before), but the
> `init'
> has it's problems. The error message is:
> 
> VFS: Mounted root (nfs filesystem) readonly.
> break 0,0: pid=9 command='init'
> init[9]: Breakpoint 0
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111
> r0-3     00000000 102de010 00000000 00000000
> r4-7     00000000 00000000 00000000 00000000
> r8-11    00000000 00000000 00000000 00000000
> r12-15   00000000 00000000 00000040 1012544c
> r16-19   13f085c0 13f08000 c804c804 00000001
> r20-23   102efcc0 102efcc0 10022800 102efcc0
> r24-27   0000002e 00001000 00000000 1024c010
> r28-31   00000000 00000000 13f089c0 101312a0
> sr0-3    00000000 00000000 00000000 00000001
> sr4-7    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 00000000 00000004
>  IIR: 00000000    ISR: 00000000  IOR: 00000000
> ORIG_R28: 00000000
> 
> How can I follow up the thing ?
> Is the GDB of the CVS usable  (for example starting gdbserver init
> instead of init and `target remote' via the second serial interface ?)
> 
> By the way: I did a "super hack" in the kernel. In the serial interrupt
> routine, I catch the charcater `^\', filter it for `/dev/ttyS0' and
> do a machine_restart(). This is perfect for development !!
> 
> With friendly regards
>         Christoph P.
> 
> --
> -------------------------------------------------------------------------
> private:        christoph.plattner@dot.at
> company:        christoph.plattner@alcatel.at
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
