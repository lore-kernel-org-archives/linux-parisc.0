From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sat, 28 Aug 2004 16:57:57 +0000
Message-ID: <4130B995.4060201@tiscali.be>
References: <20040827163701.GA2414@mcmartin.ca>	<1093625820.2010.26.camel@mulgrave>
	<20040827170342.GD25975@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 Kyle McMartin <kyle@mcmartin.ca>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040827170342.GD25975@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
>  On Fri, 2004-08-27 at 12:37, Kyle McMartin wrote:
[...]

>>
>>if (<some statement>)
>>	spin_lock_init(x);
> 
> 
> I always recommend macros should be encased with "({ ... })" which give
> you a new scope for variable declarations aswell.
> 

Do I well undesrtand: replace e.g.
#define SPIN_LOCK_IRQSAVE(l,f) do {            \
        spinlock_t *s = ATOMIC_HASH(l);                 \
        local_irq_save(f);                              \
        spin_lock(s);                                   \
} while(0)

by
#define SPIN_LOCK_IRQSAVE(l,f) ({            \
        spinlock_t *s = ATOMIC_HASH(l);                 \
        local_irq_save(f);                              \
        spin_lock(s);                                   \
})

I admit that I never find the right way to choose between those 2 forms?

TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
