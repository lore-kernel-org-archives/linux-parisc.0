Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92A8E4829
	for <parisc-linux@parisc-linux.org>; Sun,  3 Nov 2002 08:42:12 -0700 (MST)
Date: Sun, 3 Nov 2002 10:42:17 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Placement of hil drivers
Message-ID: <20021103154217.GK21694@systemhalted>
References: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk>
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

> 
> So it seems to me that all of drivers/hil (in the 2.5 tree) depends
> on stuff in drivers/input.  Is there any reason it shouldn't be in
> drivers/input/hil rather than drivers/hil?  Or is there an even better
> place to put it?
> 
> I notice that we don't even have the option to select the HIL configure
> options in 2.5 at the moment, which means nobody's testing on 715/Scorpio
> and similar boxes.  This is a shame... my goal for 2.6 is to get to a 20k
> diff vs Linus' tree.  Which reminds me, it's time for a 2.5 status report.
> Coming right up..
> 

Willy,

I could give 2.5 a whirl on the following boxes: 715/50 and 715/33.
I'll get back to you with results.

Cheers,
Carlos.
