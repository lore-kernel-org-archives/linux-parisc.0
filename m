Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA26564
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 18:26:46 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 25 Jul 2000 00:28:36 -0000
To: Cary Coutant <cary@cup.hp.com>
Cc: <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
References: <200007250000.RAA03038@adlmail.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 24 Jul 2000 20:23:24 -0400
Message-ID: <87zon7qcqr.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant <cary@cup.hp.com> writes:

> The model used for PA-RISC is a a consequence of the segmented 
> architecture, where the text and data segments are not adjacent.

For what it's worth our ELF32 runtime conventions do not use
segmentation at all.  That is, in user space, %sr0 and %sr4 through
%sr7 are all set to the same space identifier.

This is in keeping with accepted practice on other 32-bit Linux
platforms where segmentation is used only to provide separate 4G
address spaces for the kernel and userland.

> As a result, a procedure cannot materialize its own gp, since there
> is no fixed pc-relative offset between the text and data. This means
> that the caller must materialize the gp prior to the call, or as
> part of the call.

I can see some advantages in this even with a non-segmented runtime
architecture - theoretically, having the GP be managed by the caller
rather than the callee should make intramodule calls in
position-independent code more efficient.  (I think so at least)

One thing I have not figured out is how the GP is "bootstrapped" in
the startup code for the dynamic linker itself - how does ELF64 on
HP/UX deal with this problem?

> By the way, this model is also being used for IA-64. You may be able to 
> leverage some of the work being done for ld.so on that platform.

Thanks for the tip... as it turns out, the author of the dynamic
linker support for GNU libc on IA-64 sits two cubes away from me, so
that should be quite helpful indeed :-)

> Lazy binding requires a bit of cleverness. We do it by dynamically 
> creating lazy-binding stubs that load a module id and a PLT index into 
> registers, then branch to a common bind-on-reference routine.

For the moment I am not going to worry about lazy binding at all,
though it is certainly a requirement in the future.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
