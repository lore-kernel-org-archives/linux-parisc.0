Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA23015
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:41:03 -0700
Sender: frowand@cup.hp.com
Message-ID: <38309A65.9CB3DFC4@hp.com>
Date: Mon, 15 Nov 1999 15:42:29 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
Cc: frowand@cup.hp.com, Ryan Bradetich <rbradetich@uswest.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911151948070.10661-100000@vodka.thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> On Mon, 15 Nov 1999, Frank Rowand wrote:
> > You don't get to choose.  The PDC is either 32 bit or 64 bit.  It's not
> > a question of what mode the OS is running in, but what the PDC was
> > compiled for.
> 
> Hm.  I'm pretty sure that a 32 bit version of HPUX has run on that box as
> well, so wouldn't that mean that it'd have to be a 32 bit PDC?
> 
> - Alex

Nope.  The OS has to figure out what type of PDC it is calling, and properly
marshall the arguments for the call.

-Frank
