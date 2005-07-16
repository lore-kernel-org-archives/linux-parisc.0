From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 18:55:50 -0400 (EDT)
Message-ID: <200507162255.j6GMtoDS011648@hiauly1.hia.nrc.ca>
References: <20050716211835.GK5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050716211835.GK5314@systemhalted.org> from "Carlos O'Donell"
	at Jul 16, 2005 05:18:35 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I guess clobbering all the fp registers plus r0 will stop this.
> 
> That seems like overkill, I just don't want gcc schedule between the asm
> statements. The fstd chain, and fldd chain are always asm statements.
> 
> Is there no other way? Clobbering will add huge register pressure and
> force gcc to spill all the fpregs and restore after the call.

Hmmm, this seems tricky:

  For example, on many targets there is a system
  register which can be set to control the rounding mode of
  floating point operations.  You might try
  setting it with a volatile @code{asm}, like this PowerPC example:

  @smallexample
	asm volatile("mtfsf 255,%0" : : "f" (fpenv));
	sum = x + y;
  @end smallexample

  @noindent
  This will not work reliably, as the compiler may move the addition back
  before the volatile @code{asm}.  To make it work you need to add an
  artificial dependency to the @code{asm} referencing a variable in the code
  you don't want moved, for example:

  @smallexample
	asm volatile ("mtfsf 255,%1" : "=X"(sum): "f"(fpenv));
	sum = x + y;
  @end smallexample

  ...

  For reasons similar to those described above, it is not possible to give
  an assembler instruction access to the condition code left by previous
  instructions.

If you clobber memory in the asm, then I think it will be a barrier
for memory accesses.  I think a function call is ok:

  a = b + c;
  z = xyzzy ();

I don't think gcc can reorder the two operations unless it can prove
the function is pure and doesn't write all memory.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
