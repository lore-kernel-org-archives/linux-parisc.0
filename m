Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA09350
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 14:31:22 -0700
Sender: frowand@cup.hp.com
Message-ID: <3831CD88.C0DC6261@hp.com>
Date: Tue, 16 Nov 1999 13:32:56 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: frowand@cup.hp.com, Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911151948070.10661-100000@vodka.thepuffingroup.com> <38309A65.9CB3DFC4@hp.com> <383163F5.3B21ECAB@uswest.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> 
> Frank Rowand wrote:
> 
> > Alex deVries wrote:
> > >
> > > On Mon, 15 Nov 1999, Frank Rowand wrote:
> > > > You don't get to choose.  The PDC is either 32 bit or 64 bit.  It's not
> > > > a question of what mode the OS is running in, but what the PDC was
> > > > compiled for.
> > >
> > > Hm.  I'm pretty sure that a 32 bit version of HPUX has run on that box as
> > > well, so wouldn't that mean that it'd have to be a 32 bit PDC?
> > >
> > > - Alex
> >
> > Nope.  The OS has to figure out what type of PDC it is calling, and properly
> > marshall the arguments for the call.
> >
> > -Frank
> 
> Time for me to show off my ignorance again. :)  As I understand it, the PDC is
> firmware, which all the CPU (in a multiple CPU box) share.  I know that when
> I installed 11.X on this C200 that I was given the choice to install it in 32
> bit or
> 64 bit mode.  Does this mean the install disk updates the PDC firmware to boot
> into either 32-bit or 64-bit mode?


The PDC is either 32-bit or 64-bit.  The OS has to deal with whatever version
of the firmware is on the box.

HP-UX is smart enough to switch into wide or narrow mode, as needed, before
calling PDC.  It also passes the arguments differently for 64 bit PDC than
for 32 bit PDC.

Page zero is also different for PA2.0 systems.  HP-UX has to deal with those
differences even when it's a 32 bit OS.


> Also looking at the PSW definition for the W bit on page 2-7 and
> page 2-8 of PA-RISC 2.0 Architecture by Gerry Kane:
> 
> W: Wide 64-bit address formation enabled.  When 1, full 64-bit-offset
> addressing
> is enabled.  When 0, addresses are truncated to 32-bit offsets, for
> compatibility
> with existing PA-RISC 1.0 and 1.1 applications.
> 
> >From PIM dumps, I know all the registers are 64 bit, and the PSW is also 64 bit
> on
> this C200..  So it looks like I should be able to switch between 32-bit and
> 64-bit by
> changing the W bit in the PSW?
> 
> Thanks,
> Ryan Bradetich
> 
> P.S.  I will try to query the PDC_MODEL as you suggested as in a previous email
> 
> in this thread and post the result when I get home tonight.


-Frank
