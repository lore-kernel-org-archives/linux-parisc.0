Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA55D482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 08:36:29 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Zw1g-0006Tq-00; Sun, 10 Feb 2002 15:36:24 +0000
Date: Sun, 10 Feb 2002 15:36:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Enrik Berkhan <Enrik.Berkhan@planb.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors
Message-ID: <20020210153624.H1173@parcelfarce.linux.theplanet.co.uk>
References: <20020207130852.C3306@electra.intern.planb.de> <20020207163107.5E08A482A@dsl2.external.hp.com> <20020208121405.C5128@electra.intern.planb.de> <Enrik.Berkhan@planb.de> <20020210065020.DCE6A482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020210065020.DCE6A482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Feb 09, 2002 at 11:50:20PM -0700
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

On Sat, Feb 09, 2002 at 11:50:20PM -0700, Grant Grundler wrote:
> Enrik Berkhan wrote:
> > BTW, drivers/gsc/serial.c does no request_mem_region(). Is this in-
> > tentional?
> 
> probably. Check if an entry for serial exists in /prc/iomem.
> At one point, the device discover code was changed to automatically
> do the request_mem_region() devics firmware told us about.

Where `one point' == `last night' :-)

I'm not quite sure about the way I've done it -- I might set it up to
always claim rather than only claim on device detection, and take the
name from the hardware database rather than the driver.

I suspect I've broken module unload with the current code, and I need
a release_mem_region on deregistration... investigating now.

-- 
Revolutions do not require corporate support.
