Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA31432
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 07:01:32 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <383163F5.3B21ECAB@uswest.net>
Date: Tue, 16 Nov 1999 07:02:29 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: frowand@cup.hp.com
CC: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911151948070.10661-100000@vodka.thepuffingroup.com> <38309A65.9CB3DFC4@hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Frank Rowand wrote:

> Alex deVries wrote:
> >
> > On Mon, 15 Nov 1999, Frank Rowand wrote:
> > > You don't get to choose.  The PDC is either 32 bit or 64 bit.  It's not
> > > a question of what mode the OS is running in, but what the PDC was
> > > compiled for.
> >
> > Hm.  I'm pretty sure that a 32 bit version of HPUX has run on that box as
> > well, so wouldn't that mean that it'd have to be a 32 bit PDC?
> >
> > - Alex
>
> Nope.  The OS has to figure out what type of PDC it is calling, and properly
> marshall the arguments for the call.
>
> -Frank

Time for me to show off my ignorance again. :)  As I understand it, the PDC is
firmware, which all the CPU (in a multiple CPU box) share.  I know that when
I installed 11.X on this C200 that I was given the choice to install it in 32
bit or
64 bit mode.  Does this mean the install disk updates the PDC firmware to boot
into either 32-bit or 64-bit mode?

Also looking at the PSW definition for the W bit on page 2-7 and
page 2-8 of PA-RISC 2.0 Architecture by Gerry Kane:

W: Wide 64-bit address formation enabled.  When 1, full 64-bit-offset
addressing
is enabled.  When 0, addresses are truncated to 32-bit offsets, for
compatibility
with existing PA-RISC 1.0 and 1.1 applications.
