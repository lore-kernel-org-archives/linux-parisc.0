Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01099482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 18:01:53 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kxDC-0007tY-00; Thu, 05 Apr 2001 01:01:18 +0100
Date: Thu, 5 Apr 2001 01:01:18 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, rbradetich@uswest.net,
	Ryan Bradetich <rbrad@beavis.ybsoft.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation
Message-ID: <20010405010118.O11435@parcelfarce.linux.theplanet.co.uk>
References: <20010403180344.A6792@beavis.ybsoft.com> <0104041057250C.19560@eeyore.fc.hp.com> <20010404182016.D11435@parcelfarce.linux.theplanet.co.uk> <0104041450480D.19560@eeyore.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <0104041450480D.19560@eeyore.fc.hp.com>; from bjorn_helgaas@hp.com on Wed, Apr 04, 2001 at 04:04:22PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 04, 2001 at 04:04:22PM -0700, Bjorn Helgaas wrote:
> CONFIG_PA20 =>
> 	PA2.0 architecture, in either narrow or wide mode.
> 	Defined iff CONFIG_PA8X00 selected, not directly user-configurable.

Correct.  I test this rather than CONFIG_PA8X00 because it's conceivable
we might want to split PA8000/8200 support from 8500/8600.  Or something.

> CONFIG_PARISC64 =>
> 	Only possible when CONFIG_PA20 selected
> 	Build 64-bit kernel by using $(CROSS_COMPILE) = hppa64-linux.
> 	cpp predefines __LP64__.

Right.

> So is there a reason for testing __LP64__ rather than CONFIG_PARISC64 in 
> the code?  There are a zillion tests for the former and none for the 
> latter, even though the latter seems more direct and obvious.

Well.. it requires that you remember to include <linux/config.h>.

> It seems to me that __LP64__ is overloaded for several things.  
> Fundamentally, it is a property of the kernel, i.e., it is compiled to run 
> in wide mode.  But we also use it to decide whether to use PDC PAT, which 
> seems like a slightly different question.  If you run a narrow kernel on a 
> C3000, the firmware still supports PDC PAT (although I suppose we would 
> have to do some work to call it in wide mode).

Not quite true, C3k has 64-bit PDC, but it is not PAT.

-- 
Revolutions do not require corporate support.
