Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id EE675482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 20:15:12 -0600 (MDT)
Date: Wed, 4 Apr 2001 20:14:54 -0600
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation
Message-ID: <20010404201454.A943@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <20010403180344.A6792@beavis.ybsoft.com> <0104041057250C.19560@eeyore.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <0104041057250C.19560@eeyore.fc.hp.com>; from bjorn_helgaas@hp.com on Wed, Apr 04, 2001 at 09:57:25AM -0700
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 04, 2001 at 09:57:25AM -0700, Bjorn Helgaas wrote:
> Looks good to me.  A couple minor questions/comments, more for my 
> edification than anything else:
> 
> - pdc.h contains a commented-out struct pdc_iodc.  The comment suggests 
> possible issues with using it with 64-bit firmware, but I think the fear 
> is unfounded.  There are several places that use pdc_iodc_read(), but they 
> all seem to define their own equivalent of struct pdc_iodc.  I'm not sure 
> why they don't use struct pdc_iodc.  Also, include/asm-parisc/hardware.h 
> contains #defines for the IODC_TYPE field (HPHW_NPROC, etc); should these 
> be defined alongside struct pdc_iodc?
