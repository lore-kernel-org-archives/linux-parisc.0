Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A8E4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 11:33:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kqx6-0007kc-00; Wed, 04 Apr 2001 18:20:16 +0100
Date: Wed, 4 Apr 2001 18:20:16 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: rbradetich@uswest.net, Ryan Bradetich <rbrad@beavis.ybsoft.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation
Message-ID: <20010404182016.D11435@parcelfarce.linux.theplanet.co.uk>
References: <20010403180344.A6792@beavis.ybsoft.com> <0104041057250C.19560@eeyore.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <0104041057250C.19560@eeyore.fc.hp.com>; from bjorn_helgaas@hp.com on Wed, Apr 04, 2001 at 09:57:25AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 04, 2001 at 09:57:25AM -0700, Bjorn Helgaas wrote:
> - What are the guidelines for #ifdef __LP64__ vs CONFIG_PA20?  You 
> replaced __LP64__ with CONFIG_PA20 in some places but not others and I'm 
> not clear on the difference.

Not all PA-2.0 processors are run in 64-bit mode.  For example, a C3000
can be run in either 32 or 64 bit mode.  At compile-time you can choose
to optimise for a particular processor (and risk it not working on
other machines).

> - In firmware.c, the "yes 'int', not 'long' -- IODC I/O is always 32-bit 
> stuff" comment moved from pdc.h seems obsolete, or at least, I can't 
> figure out what the 'int' refers to.  I'd remove the "This means Cxxx 
> boxes can't run wide kernels right now." comment, since CONFIG_PDC_NARROW 
> addresses that issue.

yup, some of the comments are definitely stale.

see linus' comments about disliking comments because of this issue :-)

-- 
Revolutions do not require corporate support.
