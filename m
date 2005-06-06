From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 6 Jun 2005 11:55:54 -0600
Message-ID: <20050606175554.GD24437@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606151232.GA24437@colo.lackof.org>
	<20050606163141.GA15703@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050606163141.GA15703@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 06, 2005 at 06:31:41PM +0200, Ingo Molnar wrote:
> > They are arch specific types (asm/spinlock_types.h) and I'm only using 
> > raw_spinlock_t in arch specific code.
> 
> please dont use the raw spinlocks. They dont carry some features such as 
> debugging. (or any other future feature of the generic spinlock_t type)
> 

TBH, I'd rather not use them. Please look at the -02 patch I just sent
and advise on how you think the cyclic dependency can be killed.
raw spinlocks is obviously just one way.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
