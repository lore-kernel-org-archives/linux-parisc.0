From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: strtold
Date: Sat, 7 Jan 2006 18:42:30 -0500
Message-ID: <20060107234230.GQ17559@baldric.uwo.ca>
References: <20060107210757.GM17559@baldric.uwo.ca>
	<200601072241.k07MfqiW020827@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601072241.k07MfqiW020827@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 07, 2006 at 05:41:52PM -0500, John David Anglin wrote:
> > strtold will never work, gcc and libc have different sizes for long
> > double. This is probably a side-effect of this.
> 
> I'm not sure what has changed but this is the source of a number
> of gfortran and libstdc++ regressions when using the current version
> of libc in unstable.

strold has always done funny things in the glibc testsuite, consider
yourself lucky.
 
> > If we really want long double to work we need to do something like set
> > it to be the same as double.
> 
> Long double has always been the same as double in GCC.  It allowed
> by the C and C++ standards.  It fast and the hardware and corner
> cases are well understood.

So long doubles have always been DFmode in GCC, okay, I thought it was
something else.

glibc thinks long double is 128-bit. If you want strtold to work then I
need to make the changes in glibc.

> I've given up hope that HP will release their IEEE long double emulation
> code for PA-RISC.  Although I don't have any hard evidence of bugs in it,
> there is the suggestion from the ada testsuite run under hpux that there
> may be bugs in the rounding and exception support.

I agree, I don't think it will ever be released. If it is released then
we'll jigger it out some other way :)

> > 128-bit long double is just going to be a pain, and I don't know how
> > well the 80-bit long double from IBM supports IEEE modes.
> 
> The only viable alternatives at this point are:
> 
>   1) long double == double (64 bit long double), or
>   2) IBM 128-bit double double implementation used by powerpc.

Or write our own library! ;-)

> After more than a year of using the double-double format, the powerpc
> folks are still working the bugs out from the corner cases.  While I
> guess it more or less works, I wouldn't want to rely on it for
> critical calculations.  RTH recented indicated that this would be a
> poor choice for another port in the same situation.  The same viewpoint
> was expressed to me by an Ada maintainer at the last GCC summit.  Ada
> probably has the best numerics support in GCC.

I say we go for (1).

> There is no support for the 80-bit format (either in hardware or
> software) on PA-RISC as far as I know.  So, this alternative isn't viable.

Okay.

> C99 requires long double support.  Thus, I believe we should go with
> option 1 and libc should be changed.  We aren't the only target with
> this problem, so there must be some libc support for 64-bit long double.

I believe it will only require removing the implies line for ldbl-128
from glibc.

I am building you a new debian glibc based on 2.3.5-8 for you to test,
would this be good?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
