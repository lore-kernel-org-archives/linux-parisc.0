Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA0854855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 20:36:40 -0700 (MST)
Date: Sun, 15 Feb 2004 03:36:32 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Elliott Potter <epotter@eep.burdell.org>
Subject: Re: [parisc-linux] C3000 video options
In-Reply-To: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
Message-ID: <Pine.LNX.4.58.0402150326330.22822@sal.ucc.ie>
References: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 14 Feb 2004, Elliott Potter wrote:

> Hello all,

[...]

> 1) At some point, hp released the fx5 and fx10 graphics adapters, which
> replaced the fx4 and fx6 cards, and said that they would be supported
> under Linux.  But they accomplished that by releasing a binary form of
> its proprietary X server, which is no longer supported.  The Customer

It's ix86-Linux only.

> 2) Someone posted on the list that you could get a PCI Nvidia Voodoo2
> card and maybe it would work, but when he tried it he got nothing except
> corrupted nvram.  That doesn't sound very promising, but I thought I'd
> ask.

Someone tried Voodoo2, but no success report so far.

Somebody had success with a ATI Rage XL graphics card and a 2.4.22 kernel
(and a special no-bios patch). He had some colour issues 'though.
Unfortunatelty the patch doesn't work on the 2.4.24 kernel anymore;
I contacted the developer of this patch, and he said he's busy with some
other things, and porting it to 2.4.24 (or even 2.6) will be low priority.

> 3) There are other PCI graphics cards (even 64-bit PCI) out there that
> work on other *nix systems (AS/*****, SUN, etc.); is everyone's (or just
> HP's) firmware so different that one has to get a graphics card just for
> the HP?

You'll be lucky to get any (ix86) PCI graphics card working on Linux/PA-RISC.
The best bet would be to get a Visualize-EG, or some graphics card that
doesn't require initialization via (ix86-)BIOS (eg. Matrox Millenium).

Greetings,
  Max
