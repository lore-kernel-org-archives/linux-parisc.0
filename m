Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100 Base-T Ethernet card drivers / 3COM 
In-Reply-To: Message from Harri Haataja <harri.haataja@cs.helsinki.fi>
   of "Fri, 27 Sep 2002 11:42:27 +0300." <20020927114226.A1112@azrael.smilehouse.com>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCE0@wing-ep.tip.csiro.au> <20020926031956.A5179@parcelfarce.linux.theplanet.co.uk> <3D935BCC.4060002@gmx.de> <20020926201238.G28188@parcelfarce.linux.theplanet.co.uk>  <20020927114226.A1112@azrael.smilehouse.com> 
Date: Sat, 28 Sep 2002 23:51:05 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020929055105.496884829@dsl2.external.hp.com>
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

Harri Haataja wrote:
> Wouldn't it be worth it putting together a small list (or even an active
> web page) of working devices of any kind on HP-PA hardware?
> Or maybe just limited to (E)ISA and pci cards or such?

ESIEE folks maintain a page for systems:
	http://pateam.esiee.fr/list.html

Please model after that example and send it to them.
They might add it to that page. I don't know if they want to maintain
something like that and I think they have enough to do already.
A problem with maintaining this is even if a PCI card works on B180
doesn't mean it will work on C3000 or A500.

In general, I expect hppa-linux to support the same cards as sparc64/
mips64/powerpc/alpha ports.  I would include "ia64" but itanic IO and
HP ZX1 IO are like comparing x86 IO and parisc IO subsystems (HW).

grant
