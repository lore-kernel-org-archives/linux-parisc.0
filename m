Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA12533
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 21:32:11 -0700
From: dkennedy@thepuffingroup.com
Date: Mon, 15 Nov 1999 00:41:28 -0500 (EST)
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] real mode stuff.
In-Reply-To: <Pine.LNX.4.10.9911142338080.7516-100000@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.9911150031280.2071-100000@grasshopper.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 14 Nov 1999, Alex deVries wrote:

> - Philipp and I agree that we should just create arch/parisc/kernel/real
> for all the real mode stuff
> - creating arch/parisc/real/pdc.c
> - moving some stuff in arch/parisc/kernel/realmode_setup.c to
> arch/parisc/real/setup.c or similiar.
> 
> Let me know if there's objections.  I'll wait until Paul has a chance to
> read this before committing.

How much real mode code is there?  The i386 processor starts up in
a real mode as well.  Linux enters protected mode in head.S very
quickly.  If real mode on the PA-RISC is only used during
initialization, then I don't think that it warrants a separate
directory.  If real mode is used during normal operation, then I say
sure.

Of course, that's my opinion, which means little.

-- 
David Kennedy
The Puffin Group
