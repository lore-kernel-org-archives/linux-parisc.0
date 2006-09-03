From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 03 Sep 2006 15:29:37 -0500
Message-ID: <1157315377.3486.18.camel@mulgrave.il.steeleye.com>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
	<20060831214650.GC16032@colo.lackof.org>
	<119aab440609030754t5e0f869bq10b5c10770f14105@mail.gmail.com>
	<20060903195553.GC20217@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903195553.GC20217@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-09-03 at 13:55 -0600, Grant Grundler wrote:
> I'm not sure about that. James might be wrong in this case.
> See do_cpu_irq_mask().
> It clears EIEM and thus disables all external interrupts
> including the interval timer. The comment is wrong in that
> we disable all EIEM bits, not just TIMER and IPI.

Yes ... I thought I fixed that the last time I pulled this code apart,
but apparently not.

I'll concentrate on fixing this, since I suspect it is the root cause of
the horrible interrupt latencies causing the ticks to back up.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
