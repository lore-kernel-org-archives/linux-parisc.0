Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA22581
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:33:28 -0700
Sender: frowand@cup.hp.com
Message-ID: <3830989F.BA33EDC0@hp.com>
Date: Mon, 15 Nov 1999 15:34:55 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
CC: frowand@cup.hp.com, Ryan Bradetich <rbradetich@uswest.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911151931060.10590-100000@vodka.thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> On Mon, 15 Nov 1999, Frank Rowand wrote:
> > This might not solve your problem, but it's worth checking out.  The
> > procedure calling convention for PA 2.0 PDC is different than for 1.0.
> > See http://thepuffingroup.com/parisc/documentation.html, pdc.pdf,
> > p 2-8 defines the return status as a 64-bit, not 32 bit.  You might
> 
> However, we are running this in narrow mode, so we should be able to use
> 32 bit PDC.


You don't get to choose.  The PDC is either 32 bit or 64 bit.  It's not
a question of what mode the OS is running in, but what the PDC was
compiled for.


> > I don't know if your system has wide or narrow PDC - you have to call
> > PDC_MODEL(Return Capabilities), and check bit 63 of caps (the field
> > called OS64).
> 
> That's worth checking out.
> 
> - Alex

-Frank
