Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id E94B94829
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 14:46:19 -0700 (MST)
Date: Wed, 13 Nov 2002 14:46:13 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LONG pause on boot
Message-ID: <20021113214613.GA32441@beavis.ybsoft.com>
References: <Pine.LNX.4.44.0211131022210.26859-100000@wolf.alaskatech> <20021113193018.P30392@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021113193018.P30392@parcelfarce.linux.theplanet.co.uk>
From: rbrad@uswest.net (Ryan Bradetich)
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

On Wed, Nov 13, 2002 at 07:30:18PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 13, 2002 at 10:26:43AM -0900, Tom wrote:
> > Does anyone have an idea as to why such a long delay would occur there?
> > PDC has console to serial_1, which had a terminal on it. There was no
> > errors or complaints anywhere in the boot process, and none visible during
> > the kernel compile. I can provide System.map, config file, etc. if
> > desired...
> 
> Yes, it's during device walk.  The support for E class that rbrad wrote
> means that every machine with a CCIO suffers.  I suspect this'll get
> fixed fairly soon.

Willy, I have an idea on how to fix this, but it is ugly ... but I will probably
consider committing it soon unless you have a cleaner idea (hint, hint :))

The problem is with E-Class ... the devices are at the end of the bus range.  We
need to walk the entire bus until we find the range the drivers exist in.  On
systems where the devices are at the end (or no devices in that range) the entire
bus needs to be walked.... this is the delay you are seeing.

I have a proposal to speed up systems where the devices are at the end of the
bus ... we can simply walk the first bus range, then the last bus range, if
nothing found yet ... walk the middle.

I do not have a solution for a bus with no devices present yet ...

Thanks,

- Ryan





> 
> -- 
> Revolutions do not require corporate support.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
