Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 545AA4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 15:40:15 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18K4fB-0005Wo-00; Thu, 05 Dec 2002 22:40:09 +0000
Date: Thu, 5 Dec 2002 22:40:09 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: parisc-linux@lists.parisc-linux.org, James.Bottomley@steeleye.com
Subject: Re: [parisc-linux] Question about parisc machines with little or no consistent memory
Message-ID: <20021205224009.A10368@parcelfarce.linux.theplanet.co.uk>
References: <200212052153.NAA05169@adam.yggdrasil.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212052153.NAA05169@adam.yggdrasil.com>; from adam@yggdrasil.com on Thu, Dec 05, 2002 at 01:53:28PM -0800
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

On Thu, Dec 05, 2002 at 01:53:28PM -0800, Adam J. Richter wrote:
> 	I have a question about the parisc machines that have little
> or not consistent memory available.  I'm interested in both the
> parisc machines that Linux currently supports and those that it
> has not been ported to.

Machines we support:

Astro/Elroy based: lots of consistent memory available (IOTLB)
CCIO based: lots of consistent memory available (IOTLB)
PCXL/L2 processors: 128? MB available, uncachable.
PCXS/T processors: no consistent memory available.

Machines we don't support:

V class: Can't really comment how much is available, the docs confused me ;-)
T class: No consistent memory available, though there is an IOMMU.

> 	My question is: what kind of inconsistent memory do they have?
> I am most interested in knowing if you can at least allocate memory
> may be read cached but is write through.  If you can select
> write-through and you write a 4-byte word aligned on a 4-byte
> boundary, will you only write those four bytes without writing back
> any potentially stale cached data?  How about if you write a char or a
> short?  If these machines support memory that need read barriers but
> does not have the hazard of potentially writing back incorrect cached
> data, that may simplify adding support for these machines to more
> drivers.

Basically, no.  The memory subsystems on these things can't cope with the
CPU doing a non-cacheline-{sized,aligned} write, so we can't even do
uncachable memory (except on PCX-L and -L2 where the memory controller can
cope with smaller writes).

Caches on PA are always writeback, never writethrough.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
