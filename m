Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA22161
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:21:23 -0700
Date: Mon, 15 Nov 1999 19:31:46 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: frowand@cup.hp.com
cc: Ryan Bradetich <rbradetich@uswest.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
In-Reply-To: <38309117.3707D5FB@hp.com>
Message-ID: <Pine.LNX.4.10.9911151931060.10590-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Mon, 15 Nov 1999, Frank Rowand wrote:
> This might not solve your problem, but it's worth checking out.  The
> procedure calling convention for PA 2.0 PDC is different than for 1.0.
> See http://thepuffingroup.com/parisc/documentation.html, pdc.pdf,
> p 2-8 defines the return status as a 64-bit, not 32 bit.  You might

However, we are running this in narrow mode, so we should be able to use
32 bit PDC.

> I don't know if your system has wide or narrow PDC - you have to call
> PDC_MODEL(Return Capabilities), and check bit 63 of caps (the field
> called OS64).

That's worth checking out.

- Alex
