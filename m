From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 15:41:41 -0400
Message-ID: <20050716194141.GI5314@systemhalted.org>
References: <200507161737.j6GHboDo009866@hiauly1.hia.nrc.ca>
	<200507161754.j6GHsmB3010087@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507161754.j6GHsmB3010087@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 16, 2005 at 01:54:48PM -0400, John David Anglin wrote:
> > However, you have to be careful in using fstd to get the fp status
> > register as it clears T after the insn.
> 
> And, indeed the following is wrong for the above reason:
> 
> #include <fenv.h>
> 
> int
> fetestexcept (int excepts)
> {
>   unsigned int sw[2];
> 
>   /* Get the current status word. */
>   __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
> 
>   return (sw[0] >> 27) & excepts & FE_ALL_EXCEPT;
> }
> 
> You need to add a 'fldd' to the asm to restore the T bit.  Another
> option might be to use fstw to access the status register in this
> situation.

I'm going to test the use of fstw.

fegetexcept, fegetround also need this fix (maybe more).

There is another potential bug, I should make sure the fr0 restore is
always at the end too incase it rearms a trap.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
