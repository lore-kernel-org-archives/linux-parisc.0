From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Help: i386-linux -> hppa-hpux cross-compiler
Date: Sun, 25 Jul 2004 16:53:10 -0400 (EDT)
Message-ID: <200407252053.i6PKrBTX007736@hiauly1.hia.nrc.ca>
References: <20040725200211.GA12070@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: laveer@tuphaan.engr.wichita.edu,
 parisc-linux@lists.parisc-linux.org
To: willy@debian.org (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040725200211.GA12070@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Jul 25, 2004 09:02:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sun, Jul 25, 2004 at 01:33:38PM -0500, Ivan Petrovich wrote:
> > This is not a parisc-linux question, though it is somewhat related.
> > I am trying to build a i386-linux to hppa-hpux (not hppa-linux)
> > cross-compiler. I have read the parisc-linux FAQ, but found it to not
> > be useful for my application.
> 
> For the linker, you'll need the hpux linker which was ported in the early
> days of the port.  Try http://cvs.parisc-linux.org/obsolete/linker/ but
> be warned nobody's touched it for a number of years.  You may also wish
> to review old postings to this list (say, 1999/2000) before we ported
> the kernel to be ELF.

I haven't tried this code under linux but I have hacked on it a bit
under hpux.  As is, it is somewhat broken and I don't think you
will be able to create shared libraries with it.  It predates the
patches that HP applied to fix the handling of secondary definition
symbols and initializers.  As a result, it is not going to work for
hpux11 targets with gcc 3.3 or later.  However, it should work for
hpux10 targets even with gcc 3.5 (prerelease) versions as secondary
definition symbols aren't used under hpux10.

Collect2 uses chatr to determine library dependencies for hpux10.
This is used to build tables of initializers and finalizers.  There
is no port of chatr to linux, so this will be a problem.  You will
have to create an equivalent tool under linux to make this work.

You will also have to setup an appropriate build and link environment.
It would be easier to setup a 64-bit hpux build environment as you can
use ld from binutils for hppa64-hpux.

I don't know of anyone that has successfully setup a cross to hppa-hpux
because of the problems in handling the SOM object format in linking.
How difficult this is going to be depends on what you want to build.
Doing C++ will be harder than C.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
