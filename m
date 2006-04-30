From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 18:01:23 -0500
Message-ID: <200604301801.23210.mszick@morethan.org>
References: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun April 30 2006 16:25, John David Anglin wrote:
> 
> Note the line doesn't have to be dirty.  Unless extreme care is
> used, the line could have been be brought into cache by a load for
> data elsewhere on the line.  So for correct operation of 'ldcw,co',
> there really must be no inter-processor timing problems in kicking
> out cachelines.  Otherwise, we could end up with two dirty cachelines
> and a broken spinlock.
> 

Somewhere it is written: "No data should be stored on the same cache
line as the lock unless all access is protected by that lock."

I recall the quote, do not recall which document.

That is what you just said above.  It makes sense even if not using
the coherent version of the semaphore instruction.

It makes even more sense if we are directly trying to control the
cache behavior using the coherent version.

One lock per cache line and knowledge of how long the cache line
is on a machine seems to be safe rule for now.

I.E: Fix it first, make it elegant later.

> It may be this is only reliable on fully coherent systems.  While
> the N-class is classified as a UMA machine, it has two system buses
> separated by a memory controller.  Each system bus can handle four
> processors with L1 and L2 cache.  Thus, it would seem safer to adopt
> the prewrite and use ldcw without the cache control completer.
> 

Scratches head...

I wonder where Joel has his processors installed in relation to the
two busses?  Both on same buss or one per buss?  Would his lockups
go away if he picked the other relationship?

I will ask him.  (or perhaps I just did)

Mike
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
