Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF755482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 17:05:17 -0600 (MDT)
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation
Date: Wed, 4 Apr 2001 16:04:22 -0700
Content-Type: text/plain;
  charset="us-ascii"
Cc: rbradetich@uswest.net, Ryan Bradetich <rbrad@beavis.ybsoft.com>,
	parisc-linux@lists.parisc-linux.org
References: <20010403180344.A6792@beavis.ybsoft.com> <0104041057250C.19560@eeyore.fc.hp.com> <20010404182016.D11435@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010404182016.D11435@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <0104041450480D.19560@eeyore.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 04 April 2001 11:20, Matthew Wilcox wrote:
> On Wed, Apr 04, 2001 at 09:57:25AM -0700, Bjorn Helgaas wrote:
> > - What are the guidelines for #ifdef __LP64__ vs CONFIG_PA20?  You
> > replaced __LP64__ with CONFIG_PA20 in some places but not others and
> > I'm not clear on the difference.
>
> Not all PA-2.0 processors are run in 64-bit mode.  For example, a C3000
> can be run in either 32 or 64 bit mode.  At compile-time you can choose
> to optimise for a particular processor (and risk it not working on
> other machines).

Ok, so let me see if I have this right:

CONFIG_PA20 =>
	PA2.0 architecture, in either narrow or wide mode.
	Defined iff CONFIG_PA8X00 selected, not directly user-configurable.

CONFIG_PARISC64 =>
	Only possible when CONFIG_PA20 selected
	Build 64-bit kernel by using $(CROSS_COMPILE) = hppa64-linux.
	cpp predefines __LP64__.

So is there a reason for testing __LP64__ rather than CONFIG_PARISC64 in 
the code?  There are a zillion tests for the former and none for the 
latter, even though the latter seems more direct and obvious.

It seems to me that __LP64__ is overloaded for several things.  
Fundamentally, it is a property of the kernel, i.e., it is compiled to run 
in wide mode.  But we also use it to decide whether to use PDC PAT, which 
seems like a slightly different question.  If you run a narrow kernel on a 
C3000, the firmware still supports PDC PAT (although I suppose we would 
have to do some work to call it in wide mode).
