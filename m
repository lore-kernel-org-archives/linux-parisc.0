From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sat, 22 Jul 2006 22:10:04 +0000
Message-ID: <44C2A23C.8000509@tiscali.be>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>	
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>	
	<20060705164734.GB30640@athena.road.mcmartin.ca>	
	<44AD54F0.90508@tiscali.be>	
	<20060706183409.GB5692@athena.road.mcmartin.ca>	
	<44C1338C.7010607@tiscali.be>
	<119aab440607221029h1acda159mf4c4e5baca2f0c1e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607221029h1acda159mf4c4e5baca2f0c1e@mail.gmail.com>
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
>>         Q4: imho the most important: with 2 gcc where is the couple of 
>> ssm/rsm that jejb introduced in his patch:
> 
> 
> The *most* important piece of imformation is the pre-compiled source.
    if (flags & 0x00000001) {
     __asm__ __volatile__("ssm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
     __asm__ __volatile__("":::"memory");
     __asm__ __volatile__("rsm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
    } else
     __asm__ __volatile__("":::"memory");

> You *must* determine that both paths of the if/else are different,
> because if they are the same, then GCC is right to remove one of the
> paths, and unconditionally call cpu_relax.
> 
and flags is a parameter of __raw_spin_lock_flags():
static inline __attribute__((always_inline)) void __raw_spin_lock_flags(raw_spinlock_t *x,
       unsigned long flags)

So i didn't see how gcc could know at compile time that (flags & 0x00000001) was always false?

> Where is the pre-compiled source to prove that the paths aren't identical?
> 
Well I don't think that pre-compile stuff would help more because doesn't inlining stuff like as #define would?

That said I think to have found what you want to learn me: isn't it exactely this inlining into:
static __inline__ __attribute__((always_inline)) void __raw_read_unlock(raw_rwlock_t *rw)
{
  __raw_spin_lock_flags(&rw->lock, 0);

--- snip ---

where obvioulsy (0 & whatelse) == 0 (i.e. false)

Is it well what you expected we found?

> Remember to work towards a solution!
> 
So this:
  IAOQ[0]: _read_lock+0x18/0x30
  IAOQ[1]: _read_lock+0x8/0x30
  RP(r2): send_group_sig_info+0x3c/0x88

was 2.6.14-rc related and not anymore to 2.6.17 and greater?

But I haven't anymore IAOQ report when this system hang now (even TOC doesn't report any usefull info).
So where to start other investigattion?

Thanks,
	Joel

PS: would it make sence to test this nucked hunk
I mean afaik this "__raw_spin_lock_flags(&rw->lock, 0);" comes from this definition:
#define __raw_spin_lock(lock) __raw_spin_lock_flags(lock, 0)

Tbh I am a bit confused by this patch: write some stuff and say don't use it?

> Cheers,
> Carlos.
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
