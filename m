From: kyle@mcmartin.ca (Kyle McMartin)
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sat, 28 Aug 2004 13:07:52 -0400
Message-ID: <20040828170752.GS2414@mcmartin.ca>
References: <20040827163701.GA2414@mcmartin.ca>
	<1093625820.2010.26.camel@mulgrave>
	<20040827170342.GD25975@baldric.uwo.ca>
	<4130B995.4060201@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4130B995.4060201@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 28, 2004 at 04:57:57PM +0000, Joel Soete wrote:
> #define SPIN_LOCK_IRQSAVE(l,f) ({            \
>        spinlock_t *s = ATOMIC_HASH(l);                 \
>        local_irq_save(f);                              \
>        spin_lock(s);                                   \
> })
> 
This form allows you to use SPIN_LOCK_IRQSAVE as an rvalue, as in

#define foo(a) ({ \
	int _b = 10;
	_b += a;
	_b;
})

baz = foo(10);
baz == 20;

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
