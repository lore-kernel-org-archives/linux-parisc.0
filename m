From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 12:16:04 -0400
Message-ID: <20050716161603.GE5314@systemhalted.org>
References: <200507160255.j6G2tRBf006639@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507160255.j6G2tRBf006639@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 15, 2005 at 10:55:26PM -0400, John David Anglin wrote:
> > PR time.  Please add danglin@gcc.gnu.org to the CC list.
> 
> Changed my mind.  It's not a GCC bug.  The second asm has to show that
> it uses the memory set by the first:

Ah, thank you for the clarification. I'll try to examine the rest of
them and cleanup the assembly.
 
> #include <fenv.h>
> 
> int
> feclearexcept (int excepts)
> {
>   struct { unsigned int sw[2]; } s;
> 
>   /* Get the current status word. */
>   __asm__ volatile ("fstd %%fr0,0(%1)" : "=m" (s) : "r" (&s));
> 
>   /* Clear all the relevant bits. */
>   s.sw[0] &= ~((excepts & FE_ALL_EXCEPT) << 27);
>   __asm__ volatile ("fldd 0(%0),%%fr0" : : "r" (&s), "m" (s));
> 
>   /* Success.  */
>   return 0;
> }
> 
> I used a struct so that GCC would know exactly what memory was affected.
> 
> There is one other issue that I'm not sure about.  I presume that you
> used fldd to access the floating-point status register to avoid the
> situation where a floating-point identify instruction has been previously
> been executed and the status register is in format three.  It's not
> clear from the arch whether the fldd returns the result of the identify
> or not.

Who previously executed the COPR,0,0?

I use the fldd to set the new cleared state of the status register.

If the thread had previously executed 'fstd' followed by a 'copr,0,0'
and had not immediately thereafter executed another 'fstd' then the
operation is *undefined* as per PA 1.1 6-63.

Context switching should save and restore the states properly for this
to work.

I think the arch is very clear about the issue, but perhaps I'm
misreading something. Do you have a case where the above wouldn't work?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
