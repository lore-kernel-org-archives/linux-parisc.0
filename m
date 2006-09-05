From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Tue, 05 Sep 2006 17:59:46 -0500
Message-ID: <1157497186.3463.88.camel@mulgrave.il.steeleye.com>
References: <1157410039.3513.26.camel@mulgrave.il.steeleye.com>
	<200609042352.k84NqpuE028835@hiauly1.hia.nrc.ca>
	<20060905051247.GB12278@colo.lackof.org>
	<1157471614.3463.36.camel@mulgrave.il.steeleye.com>
	<20060905224902.GA11064@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060905224902.GA11064@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2006-09-05 at 16:49 -0600, Grant Grundler wrote:
> If we only have one TLB entry for kernel text (code), we should
> never have a miss because of code accesses. I thought that was
> the case but don't know for sure. ISTR some discussion about
> use of BTLB (PA1.1) and Large Pages (PA 2.0) hardwired for kernel.
> 
> Kernel data would probably benefit too.

Erm ... no, we never actually implemented this.  We still use 4k TLB
entries for the entire kernel and its data.

> Add trap latency (e.g. sync/RFI) and it's still pretty small (not more
> than "hundreds" of cycles.  I'm worried about orders of magnitutude
> bigger latencies.

Right ... it's a source of potential delay, but not a significant one.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
