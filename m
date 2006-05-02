From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 00:24:42 -0600
Message-ID: <20060502062442.GC14414@colo.lackof.org>
References: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
	<200604301801.23210.mszick@morethan.org>
	<200604301828.26318.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@morethan.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604301828.26318.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 30, 2006 at 06:28:26PM -0500, Michael S. Zick wrote:
> On Sun April 30 2006 18:01, Michael S. Zick wrote:
> > 
> > Scratches head...
> > 
> > I wonder where Joel has his processors installed in relation to the
> > two busses?  Both on same buss or one per buss?  Would his lockups
> > go away if he picked the other relationship?
> > 
> > I will ask him.  (or perhaps I just did)
> >
> 
> Browsing old parisc spinlock code, I find a comment that the N4K
> can only have one outstanding PxTLB transaction at a time.

The original document says:
	The Merced bus is designed to only support a single broadcast
	PxTLB transaction in progress at a time, and this must be guaranteed
	by software. Software must semaphore to guarantee that only one
	processor is trying to issue a broadcast PxTLB at a time.

	Local PxTLBs, however, have no restrictions, since they are executed
	entirely on the issuing processor.

> Is it not the PxTLB transactions that implement the inter-processor
> coherency?

I don't think so.

> 
> Which is of course required for inter-processor spinlocks to work.
> 
> And, of course, this being Linux, the queue is protected by a spinlock!

PA-RISC _only_ has a spinlock.

> Did someone just shoot themselves in the foot?

Do you honestly think the HP HW engineers were _that_ stupid?

They occasionally make mistakes....but designing an SMP machine
that doesn't have at least one working atomic op would be a bit
over the top. ;)

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
