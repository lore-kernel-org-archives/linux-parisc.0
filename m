Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA08110
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 17:18:10 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 00:21:48 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Hx4b-0001u2-00; Mon, 15 Jan 2001 00:00:33 +0000
Date: Mon, 15 Jan 2001 00:00:33 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] semaphores
Message-ID: <20010115000033.O32402@parcelfarce.linux.theplanet.co.uk>
References: <20010114020101.J7463@parcelfarce.linux.theplanet.co.uk> <200101142359.PAA09486@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101142359.PAA09486@milano.cup.hp.com>; from grundler@cup.hp.com on Sun, Jan 14, 2001 at 03:59:00PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jan 14, 2001 at 03:59:00PM -0800, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > thanks for trying this, grant.  i'll continue trying to debug this when
> > i'm back from oz and have a machine to hand again.  trying to debug this
> > by proxy just isn't going to work.
> 
> Yeah...but it might not be your bug. I uploaded a new PDC (40.50) on my
> A500 and rebuilt using TOB (w/o your semaphore patch) and built from
> scratch. System hangs after "swapon" hits a break isns. If interested,
> I can send you more details. jsm/rhirst/amodra already have details.

I think it is my bug because that's where it used to hang on my 712.

-- 
Revolutions do not require corporate support.
