From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 6 Jun 2005 18:31:41 +0200
Message-ID: <20050606163141.GA15703@elte.hu>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606151232.GA24437@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050606151232.GA24437@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


* Grant Grundler <grundler@parisc-linux.org> wrote:

> >  I feel a bit uneasy about using the raw 
> > spinlocks directly - they were not intended to be used like that, for 
> > the time being. Right now they are internal types.
> 
> They are arch specific types (asm/spinlock_types.h) and I'm only using 
> raw_spinlock_t in arch specific code.

please dont use the raw spinlocks. They dont carry some features such as 
debugging. (or any other future feature of the generic spinlock_t type)

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
