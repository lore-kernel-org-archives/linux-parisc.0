From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] long double on hppa64-*-linux*
Date: Sat, 4 Feb 2006 22:42:31 -0500 (EST)
Message-ID: <200602050342.k153gVrL024031@hiauly1.hia.nrc.ca>
References: <20060205004507.GB2225@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060205004507.GB2225@colo.lackof.org> from "Grant Grundler" at
	Feb 4, 2006 05:45:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I'm ok with it. The only downside I can think of is hypothetical:
> supporting HPUX binaries with "long double" on parisc-linux hmight get
> interesting should any misaligned trap handlers or syscalls need to deal
> with long double.

The HPUX support uses various _U routines from libc.  I'm not sure
if any kernel support is involved.  Possibly, some support is needed
to handle exceptions.  This is all vague since as far as I know the
_U routines are not publicly documented.  I don't believe there is kernel
support for the quad instructions in the PA 2.0 arch.  There's no
math library support for long doubles in HPUX.  As it seems HP won't
release the _U code, only static HPUX binaries using long double would
have any chance of running on parisc-linux.  So, I'm not sure being
able to run HPUX binaries with "long double" would ever prove particularly
useful.

As things currently stand on hppa64-*-linux*, any arithmetic involving
long doubles results in a call to a libgcc stub that calls abort.

It looks as glibc 2.4 potentially provides 128-bit long double support
as an option.  See patch to make -mlong-double-128 the default:
http://gcc.gnu.org/ml/gcc-patches/2006-01/msg01958.html
The other option is the hardware support -mlong-double-64.

I'm fairly sure that the -mlong-double-128 format (except for a few
architectures) is similar to the rs6000 darwin long double format
(i.e., it's not compatible with the PA 2.0 format, IEEE quad).  It
might not be that much work to copy the rs6000 implementation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
