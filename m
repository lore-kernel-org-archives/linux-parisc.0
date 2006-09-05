From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [PATCH] make parisc interrupts nest properly
Date: Mon, 4 Sep 2006 22:55:27 -0400
Message-ID: <119aab440609041955k6a6b9466h91726bd1a9e2d621@mail.gmail.com>
References: <1157391143.3513.23.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157391143.3513.23.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 9/4/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
> Linux is designed so that one interrupt can be interrupted by another
> (but not by itself).  The idea behind this is to help reduce latency.
> Parisc interrupts have never allowed nesting.  We physically disable all
> interrupts in the eiem register before entering interrupt handlers, so
> even if the handler enables interrupts, nothing ever fires.
>
> I won't apply this until we've got the timers sorted out, because it
> will only complicate things (also note that the timer interrupts are
> IRQF_DISABLED, so we're guaranteed not to take any interrupts in them
> until local_irq_enable() is called).

This patch looks great. What boxes have you tested this with? 32-bit? 64-bit?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
