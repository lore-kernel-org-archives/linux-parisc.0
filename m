Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34F744844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 19:42:18 -0600 (MDT)
Date: Wed, 17 Sep 2003 21:40:09 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
Subject: Re: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
Message-ID: <20030918014008.GD11459@systemhalted>
References: <20030917161800.GB30176@systemhalted> <200309171643.h8HGhJlw013649@hiauly1.hia.nrc.ca> <20030917225406.GG30176@systemhalted> <20030918003807.GP21596@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030918003807.GP21596@parcelfarce.linux.theplanet.co.uk>
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

> > 
> > Separate compilers yes. Separate linker and assembler no.
> > I thought I could use '--enable-targets=hppa64-linux' in binutils.
> 
> I think that only works for some parts of binutils -- specifically not ld.
> 

So it seems. Fiddle sticks. Two builds it is then :)

c.
