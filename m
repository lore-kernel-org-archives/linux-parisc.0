Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4A8D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 09:19:20 -0600 (MDT)
Date: Tue, 23 Apr 2002 11:19:03 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <joel.soete@freebel.net>,
	Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <20020423111903.A8545@systemhalted>
References: <3CC2B937.8020509@freebel.net> <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Sun, Apr 21, 2002 at 04:25:38PM +0100
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

> > "Stack pointer and cr30 do not correspond!
> > Dumping virtual address stack instead
> > 
> > Dumping Stack from ... to ...:
> > 
> > Humm as it appends as well with telnet as ssh I suspect a inetd problem?
> 
> I'd bet on gcc-3.2 miscompiling something in the network part of the kernel,
> personally.
>

Tested today.

Happens in the 3.1 main branch aswell (don't remember it previously happening).
Maybe I shouldn't be recommending the use of 3.1 as a cross compiler? ;)

I'll kdb on a serial tommorow morning and see what is causing it to die.

Oddly enough, I run diskless systems and they run off NFS perfectly fine...
so everything can't be that broke.

c. 
