From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 04 Sep 2006 10:49:38 -0500
Message-ID: <1157384978.3513.8.camel@mulgrave.il.steeleye.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
	<1157212326.4041.26.camel@mulgrave.il.steeleye.com>
	<20060903193806.GB20217@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903193806.GB20217@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-09-03 at 13:38 -0600, Grant Grundler wrote:
> Doesn't this violate one of the basic tenants of linux interrupts?
> 
> I know the interrupt handler (same instance) can't be invoked on
> two different CPUs and it seems re-entrance would be a similar
> case.

re-entrant is the wrong word ... however all linux interrupt handlers
should be interruptible (unless they specifically disable interrupts).
Ours apparently still aren't, so I'll see about fixing them.

The timer interrupt is the exception, actually, because it's set
IRQF_DISABLED which means no interrupts in timer_interrupt() until
they're specifically enabled, which doesn't happen until well into the
softirq processing.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
