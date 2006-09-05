From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Tue, 5 Sep 2006 16:49:02 -0600
Message-ID: <20060905224902.GA11064@colo.lackof.org>
References: <1157410039.3513.26.camel@mulgrave.il.steeleye.com>
	<200609042352.k84NqpuE028835@hiauly1.hia.nrc.ca>
	<20060905051247.GB12278@colo.lackof.org>
	<1157471614.3463.36.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157471614.3463.36.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Sep 05, 2006 at 10:53:34AM -0500, James Bottomley wrote:
> On Mon, 2006-09-04 at 23:12 -0600, Grant Grundler wrote:
> > > I'm still concerned that we may take a TLB exception in this code
> > > and substantially increase the calculation time.
> > 
> > Hrm...what would cause a TLB exception in timer_interrupt?
> > Accessing a global var?
> 
> A TLB miss could be caused by either code or data ... we only have a few
> hundred entries, so the chances of the timer_interrupt code or data
> being not in the TLB cache are high.

If we only have one TLB entry for kernel text (code), we should
never have a miss because of code accesses. I thought that was
the case but don't know for sure. ISTR some discussion about
use of BTLB (PA1.1) and Large Pages (PA 2.0) hardwired for kernel.

Kernel data would probably benefit too.

> However, the TLB miss handling code is pretty speedy ... we can
> certainly fill a TLB entry in around 20 instructions on the fast path.

Add trap latency (e.g. sync/RFI) and it's still pretty small (not more
than "hundreds" of cycles.  I'm worried about orders of magnitutude
bigger latencies.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
