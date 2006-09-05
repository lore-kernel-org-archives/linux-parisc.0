From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Tue, 5 Sep 2006 19:41:19 -0400 (EDT)
Message-ID: <200609052341.k85NfK5r008132@hiauly1.hia.nrc.ca>
References: <20060905224902.GA11064@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060905224902.GA11064@colo.lackof.org> from "Grant Grundler" at
	Sep 5, 2006 04:49:02 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, Sep 05, 2006 at 10:53:34AM -0500, James Bottomley wrote:
> > On Mon, 2006-09-04 at 23:12 -0600, Grant Grundler wrote:
> > > > I'm still concerned that we may take a TLB exception in this code
> > > > and substantially increase the calculation time.
> > > 
> > > Hrm...what would cause a TLB exception in timer_interrupt?
> > > Accessing a global var?
> > 
> > A TLB miss could be caused by either code or data ... we only have a few
> > hundred entries, so the chances of the timer_interrupt code or data
> > being not in the TLB cache are high.
> 
> If we only have one TLB entry for kernel text (code), we should
> never have a miss because of code accesses. I thought that was
> the case but don't know for sure. ISTR some discussion about
> use of BTLB (PA1.1) and Large Pages (PA 2.0) hardwired for kernel.

Ok, I think we can rule out this as a significant cause for delay
in calculating the time for the next tick.

I brought it up because I think the only way the current code
fails are:

1) We take too long calculating the time for the next tick and
   then have to wait one complete 32-bit counter cycle for the
   next interrupt.  For the D160, we have about 27000 ticks per
   counter cycle.  The loop is four instructions.  We have 80000
   instruction cycles in a half tick.  Thus, we should be able
   to do about 20000 loop iterations in a half tick assuming
   assuming the cpu doesn't mispredict the branch.  Thus, we can't
   quite catch up a complete cycle but the current code can handle
   quite a large interrupt latency.

2) We have a huge interrupt latency and hit the half cycle limit
   present when using signed arithmetic.  The interrupt latency
   may not be real if the timer values are getting clobbered or
   not properly initialized.  Grant, you may have already fixed
   the problem with your recent patches.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
