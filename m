Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15C09488C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 16:43:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16j7Xa-0006Os-00; Thu, 07 Mar 2002 23:43:18 +0000
Date: Thu, 7 Mar 2002 23:43:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Herb Radford <herbr@magma.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J3515 10/100 NIC
Message-ID: <20020307234318.B22831@parcelfarce.linux.theplanet.co.uk>
References: <Message <herbr@magma.ca> <5.1.0.14.0.20020307110937.026af020@mail.magma.ca> <5.1.0.14.0.20020307110937.026af020@mail.magma.ca> <5.1.0.14.0.20020307125054.026b3d40@mail.magma.ca> <herbr@magma.ca> <20020307210305.C14254871@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020307210305.C14254871@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 07, 2002 at 02:03:05PM -0700
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

On Thu, Mar 07, 2002 at 02:03:05PM -0700, Grant Grundler wrote:
> > Dino version 3.x (card mode) found at 0xf1008000
> > Dino: Failed to allocate memory region
> 
> No - but it showed the problem.
> ccio/dino don't seem to be ready to work on
> K or D-class.

If you looked at the version he was running, it was some 2.4.16 release --
we didn't have any support for this card at that time.  Current 2.4.18 is
most of the way towards supporting that.  There's some D/K/R specific bits
to fill in -- see expand_ioc_area() in arch/parisc/kernel/ccio-dma.c.
It's fairly obvious (to me) what kind of thing needs to be done, but
without a machine of this nature of my own to test on, it's difficult
for me to get excited about it :-)

> ...
> > Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> > PCI: Unable to reserve I/O region #1:80@f364d800 for device 00:01.0
> > Trying to free nonexistent resource <f364d800-f364d87f>
> > Trying to free nonexistent resource <43695000-4369507f>
> ...
> 
> Looks like we discover the PCI device anyway and the
> resources get left in a garbage state.

Um, yeah... this is my fault.  I can see the bug, let me try to fix it
(hopefully without breaking anything further...)

-- 
Revolutions do not require corporate support.
