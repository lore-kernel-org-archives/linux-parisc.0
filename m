Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id 9017B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Mar 2001 15:06:57 -0700 (MST)
Date: Thu, 29 Mar 2001 15:05:26 -0700
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation
Message-ID: <20010329150526.A5458@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <20010329011830.A18639@beavis.ybsoft.com> <E14igX4-0004a3-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14igX4-0004a3-00@noam.fc.hp.com>; from bame@fc.hp.com on Thu, Mar 29, 2001 at 10:48:26AM -0700
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 29, 2001 at 10:48:26AM -0700, Paul Bame wrote:
> 
> I wonder if it makes sense to pass the lock to mem_pdc_call and let
> it do the lock/unlock rather than doing that in every caller to
> mem_pdc_call.
> 
> 	-P

This could be a possible option.  I chose not to do something similar
to do this for two reasons:

	1. The PDC call can determine the lock level (ie. spin_lock_irq()
           or spin_lock_irqsave()) depending upon if the PDC call can
           be made in interrupt context.

	2. Since pdc_result and pdc_result2 are globals, I used the
	   spin_lock to protect these variables.  That is why the
	   convert_to_wide() calls, etc are contained within the 
	   spin lock.

Maybe I was being paranoid about the locking, and your approach makes
more sense.  I was more interested in protecting data then holding
the lock for the minimum time so my approach might be draconian.  I
do not understand all the locking issues, but I'd be willing to
modify the code to put the lock in the mem_pdc_call if others agree.

Thanks,

- Ryan
