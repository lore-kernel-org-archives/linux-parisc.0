Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57E4F4855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 21:10:07 -0700 (MST)
Date: Sun, 15 Feb 2004 04:10:00 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Elliott Potter <epotter@eep.burdell.org>
Subject: Re: [parisc-linux] C3000 video options
In-Reply-To: <Pine.GSO.4.44.0402142239370.12861-100000@keymaster>
Message-ID: <Pine.LNX.4.58.0402150359520.22987@sal.ucc.ie>
References: <Pine.GSO.4.44.0402142239370.12861-100000@keymaster>
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

> > You'll be lucky to get any (ix86) PCI graphics card working on Linux/PA-RISC.
> > The best bet would be to get a Visualize-EG, or some graphics card that
> > doesn't require initialization via (ix86-)BIOS (eg. Matrox Millenium).
>
> I had secretly hoped that an Open Firmware card would work, because
> there are several reasonable cards out there that fit in newer Apples
> and Suns.  But I haven't found anything indicating that they would.

HP-UX/PA-RISC doesn't use Open Firmware.

> Now the Matrox Millenium -- I've got one of those; the original MGA
> Millenium.  Is that the one you mean?  Do other (newer) Matrox cards
> also do this (such as the G450)?  I don't know how you tell that the
> card doesn't require initialization via x86 BIOS.

Read the user manual:
http://www.matrox.com/mga/support/user_manuals/mill/milleng.pdf

Nobody tried to get a Matrox Millenium working on Linux/PA-RISC IIRC.
But the chances are good (works on PPC, SPARC etc.)

You should/have to use the matroxfb kernel driver.
Try to set the dip switches to "VGA disable", and maybe pass the
"noinit" and/or "nobios" options to the linux boot prompt.

The G450 is supported by the matroxfb driver, but I don't know whether
it can be initialized by the kernel driver, or whether this is just
limited to the old Matrox Millenium (2064W chipset).

> Now I'm excited!  I'm going to stick the Matrox card in there and see
> what happens.

Good luck!
I'm really interested in getting a PCI graphics card to work myself.

Greetings,
 Max
