Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr14.vic-remote.bigpond.net.au (mr14.vic-remote.bigpond.net.au [24.192.1.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 726EC4A19
	for <parisc-linux@parisc-linux.org>; Sat,  3 Feb 2001 08:25:40 -0700 (MST)
Received: from customware.com.au (CPE-144-132-17-132.vic.bigpond.net.au [144.132.17.132])
	by mr14.vic-remote.bigpond.net.au (Pro-8.9.3/8.9.3) with ESMTP id CAA19897
	for <parisc-linux@parisc-linux.org>; Sun, 4 Feb 2001 02:25:38 +1100 (EDT)
From: penfold@customware.com.au
Received: (from penfold@localhost)
	by customware.com.au (8.9.3/8.8.7) id CAA25557
	for parisc-linux@parisc-linux.org; Sun, 4 Feb 2001 02:25:37 +1100
Message-Id: <200102031525.CAA25557@customware.com.au>
Subject: Re: [parisc-linux] Source of this version of rbootd-2.0-2
To: parisc-linux@parisc-linux.org
Date: Sun, 4 Feb 2001 02:25:37 +1100 (EST)
In-Reply-To: <20010203011748.F26452@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 03, 2001 01:17:48 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Sat, Feb 03, 2001 at 01:51:17AM +0100, Christoph Plattner wrote:
> > Hi PA-RISCers !
> > 
> > Is there a source code of "your" binary version of the rbootd.
> > Alle source of debian has the problem, that the file pcap.h is not
> > found.
> 
> you need to `apt-get install libpcap-dev', then you will have a pcap.h
> and can rebuild rbootd.

And, in my case at least also patch defs.h :
replace 
#include <pcap.h>
with 
#include <pcap/pcap.h>

FWIW, I have libpcap-0.4-16.

Hope this helps,

Damian
penfold@customware.com.au
