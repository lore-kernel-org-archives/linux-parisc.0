Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA25437
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 11:49:34 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 13 Jan 2001 18:53:05 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14HVB8-0002Ef-00; Sat, 13 Jan 2001 18:13:26 +0000
Date: Sat, 13 Jan 2001 18:13:26 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oopser
Message-ID: <20010113181326.C7463@parcelfarce.linux.theplanet.co.uk>
References: <20010113073408.B16185@parcelfarce.linux.theplanet.co.uk> <200101131708.JAA08678@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101131708.JAA08678@milano.cup.hp.com>; from grundler@cup.hp.com on Sat, Jan 13, 2001 at 09:08:38AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jan 13, 2001 at 09:08:38AM -0800, Grant Grundler wrote:
> > I'm interested in having a useful debugging tool written by someone who
> > knows the processor really well.  What I basically want to be able to
> > do is call oopser(10 * HZ) and have the machine reliably crash in 10
> > seconds time (and do a register dump).  that would at least tell me
> > where the kernel's got to.

Sorry, I wasn't precise enough.  I want the rest of the kernel to continue
until the 10 seconds is up.

-- 
Revolutions do not require corporate support.
