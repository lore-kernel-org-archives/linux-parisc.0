From: Ivar <orskaug@stud.ntnu.no>
Subject: Re: [parisc-linux] Firefox/Mozilla patches
Date: Sun, 19 Dec 2004 22:53:09 +0100 (MET)
Message-ID: <Pine.GSO.4.58.0412192218090.4208@panter.stud.ntnu.no>
References: <Pine.GSO.4.58.0412172254550.1196@panter.stud.ntnu.no>
	<20041219203417.GE25304@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041219203417.GE25304@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


As of now the patch is still very experimental - I'll devote some more
spare time for this during christmas.

Recently, I've also done some naive attemts to port the Xorg/XFree mga
driver to parisc - with the exception of a few minor bugs (displacement of
the HW accelerated cursor), it works OK - so, I have my hopes up for this
too :)

However, a biggerproblem with Xorg (as I see it) is that it's not
natively ported to parisc.

	-Ivar

On Sun, 19 Dec 2004, Carlos O'Donell wrote:

> On Fri, Dec 17, 2004 at 11:26:57PM +0100, Ivar wrote:
> > The apt-versions of Mozilla & Firefox have never worked for me, so I've
> > recently been looking into the codebase. Compiling with the current
> > toolchain (gcc-3.3) was painless, however it was necessary to slightly
> > modify the XPCOM HP-UX/HP-CC code for it to work with gcc & parisc-linux.
> > Some platform spesific code is required to make XPCOM (and consequently
> > Mozilla/Firefox) work on any combination of OS/compiler/architecture.
> > XPCOM calls virtual funtions direcly, using the vtable pointers (not via
> > the runtime).
> >
> > Anyway, after applying these modifications Firefox 1.0 runs nicely on my
> > C3000. If  these issues are not resolved in the apt versions of
> > mozilla/firefox, I will submit my patches,
>
> Wow! This is awesome! Many thanks!
>
> Randolph, Dave and myself had all given mozilla a couple of whacks, but
> never quite got the XPCOM code working properly. Even with some
> experimental code to enable XPCOM using libffi (thanks to Randolph),
> similar to ia64, we had problems with the XUL code.
>
> I appreciate the effort! This has been on my usability todo list for
> ages!
>
> c.
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
