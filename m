Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB395482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 13:00:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18DVaf-0004jj-00; Sun, 17 Nov 2002 20:00:21 +0000
Date: Sun, 17 Nov 2002 20:00:21 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs.
Message-ID: <20021117200021.E7530@parcelfarce.linux.theplanet.co.uk>
References: <1037559910.26816.9.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1037559910.26816.9.camel@beavis>; from rbradetich@uswest.net on Sun, Nov 17, 2002 at 12:05:09PM -0700
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

On Sun, Nov 17, 2002 at 12:05:09PM -0700, Ryan Bradetich wrote:
> The following patch fixes this problem by adding a HP hardare
> quirks table, and fixing up the device early on in the discovery
> process so everything else just works.

We have some other occurrences of this kind of problem:

Graphics cards are frequently wrong.
HSC-PCI cards show up with the wrong sversion in 715/Mirage machines.
One of the Dinos in the J2240 has the wrong sversion.

We ignore the problem for gfx cards since we don't use the IDs anyway.
The Dino problems are solved by additional IDs in the Dino driver.

It is legitimate for a driver to refuse to claim a device that it's
advertised for.  So my personl preference is to advertise for all BC
ports, and then refuse to claim the ones which are actually lower ports.
That confines the knowledge to one driver.

This scheme doesn't fix the device name printout, but that seems less
important.

-- 
Revolutions do not require corporate support.
