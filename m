Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA8000 modutils problems 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Fri, 21 Jun 2002 21:52:20 BST." <Pine.LNX.4.44.0206212130310.4556-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0206212130310.4556-100000@sal.ucc.ie> 
Date: Fri, 21 Jun 2002 20:05:57 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020622020557.AFB544876@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> Later I tried compiling pa39 (32bit), but depmod reported
> "unhandled relocation of type 74" for each function in each module.

This is a known bug in the modutils package.

Richard Hirst had created an older (hacked 2.4.13) version of
modutils that can deal with relocation type 74. See
	ftp://ftp.parisc-linux.org/unofficial-debs/

and grab modutils-2.4.13-3.1rgh*


> Compiling 64bit with the (quite old) unofficial debs worked however,
> but there are some "unresolved symbols" in a few (=4) modules,
> each time the symbol is "__xchg64".

grundler <506>fgrep -n __xchg64 arch/parisc/kernel/parisc_ksyms.c
77:EXPORT_SYMBOL(__xchg64);

Something else is wrong. you are building from CVS right?
Try "make distclean" and rebuild the 64-bit vmlinux/ from scratch.


> I'm quite sure that in former times
> all modules worked. Since these modules are not important to me
> (smbfs and some ipv6 netfilter modules) there is no hurry ;)

I'm pretty sure smbfs was recently built/tested.
It's been a while since I've heard anything about ipv6 on parisc.

> So far I'm running a 64bit kernel (because it's the only way it works),
> but I want to stick to a 32bit kernel, because they may be more stable.

I would agree. But you need to use PA11 arch for now.
In general, I think the 64-bit kernel isn't too bad though.

grant
