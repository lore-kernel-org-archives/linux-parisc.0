Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.speakeasy.net (webmail3.speakeasy.net [216.254.0.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD5654851
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 18:48:41 -0700 (MST)
Message-ID: <20030222014840.12429.qmail@webmail.speakeasy.net>
Content-Type: text/plain
MIME-Version: 1.0
Date: Fri, 21 Feb 2003 17:48:40 -0800
From: caslivkoff@speakeasy.net
To: Dan Baker <dan_baker@eli.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X problems...
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

On 19 Feb 2003, Grant Grundler wrote:

> On Wed, Feb 19, 2003 at 05:42:29PM -0800, Dan
> Baker wrote:
> > BUT, I did download source code for HP's
> > Intel linux visualize driver. I can't get it
> > to compile, the assembler tells me there's
> > an invalid opcode (??) in the .o file. I'm
> > not really a programmer, so I'm hoping
> > somebody out there can take a look at what
> > they're doing and fix it.

Getting this code to compile is not going to get you anywhere.

> Well, it's not that easy even for someone who
> can read C.
>
> First, some bad news: o x86 version of the
> card has extra VGA cruft+BIOS. PA-Risc version
> uses STI firmware for initialization. o IIRC,
> the X11 server (or maybe just gfx card
> driver?) is a custom, closed source code.
> Hopefully I'm wrong and someone will correct
> me. o I'll guess that many (most of the?)
> interesting bits are in the XF86 hpgfx driver
> module. I'm assuming one exists.

The X server support for the FX4/FX6 on IA32 was accomplished by a port of Xhp (the HP-UX X server) to Linux.   Besides Xhp, the HP-UX OpenGL implementation was ported for 3D. Only the "+" or "pro" versions of these boards were supported. (I have an earlier FX4 which I've never been able to get working under Linux.) Both Xhp and the HP OGL are closed source.

A kernel module was needed to interract with the FX4/FX6 similar to the DRI support in XFree86. If you had upgraded your kernel on one of these IA-32 "Visualize" boxes from the stock Red Hat release, you would have needed to re-compile this module. This is the extent of the source code that was provided.

As Grant mentioned, these FX4/FX6 boards were NOT the same as the PA versions. They had a VGA BIOS added (via a daughter card) and took-up both an AGP and PCI slot.

> Good news: 3d acceleration for x86 cards uses
> the same RISC engines as the parisc cards.

PA-8000's I believe. 1 on the FX2, 2 on the FX4, 3 on the FX6.

> Several years ago I asked someone in the HP
> gfx group if they could port the HPUX driver
> to parisc-linux but our port wasn't ready then
> (I think it is now). The gfx driver interacts
> *alot* with the rest of the kernel *and* the
> X11 server. The above is what I remember from
> conversations with people.

While I believe it is possible, resources in the graphics lab are scarse. I suspect that a majority of the code could never be made public, so even if the lab found time to do it once, it would be tough to keep it maintained, etc.
