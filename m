From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Fri, 15 Jul 2005 22:55:26 -0400 (EDT)
Message-ID: <200507160255.j6G2tRBf006639@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Jul 15, 2005 09:54:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I think gcc is to blame, or the constraints in the assembly?
> > 
> > --- GCC 4.0 ---
> > 
> > 0x40349890 <feclearexcept+0>:   ldo 40(sp),sp
> > 0x40349894 <feclearexcept+4>:   ldo -38(sp),ret0
> > 0x40349898 <feclearexcept+8>:   stw r19,-20(,sp)
> > 0x4034989c <feclearexcept+12>:  fstd fr0,0(,ret0)
> > 0x403498a0 <feclearexcept+16>:  fldd 0(,ret0),fr0
> > 0x403498a4 <feclearexcept+20>:  ldi 0,ret0
> > 0x403498a8 <feclearexcept+24>:  bv r0(rp)
> > 0x403498ac <feclearexcept+28>:  ldo -40(sp),sp
> 
> PR time.  Please add danglin@gcc.gnu.org to the CC list.

Changed my mind.  It's not a GCC bug.  The second asm has to show that
it uses the memory set by the first:

#include <fenv.h>

int
feclearexcept (int excepts)
{
  struct { unsigned int sw[2]; } s;

  /* Get the current status word. */
  __asm__ volatile ("fstd %%fr0,0(%1)" : "=m" (s) : "r" (&s));

  /* Clear all the relevant bits. */
  s.sw[0] &= ~((excepts & FE_ALL_EXCEPT) << 27);
  __asm__ volatile ("fldd 0(%0),%%fr0" : : "r" (&s), "m" (s));

  /* Success.  */
  return 0;
}

I used a struct so that GCC would know exactly what memory was affected.

There is one other issue that I'm not sure about.  I presume that you
used fldd to access the floating-point status register to avoid the
situation where a floating-point identify instruction has been previously
been executed and the status register is in format three.  It's not
clear from the arch whether the fldd returns the result of the identify
or not.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
