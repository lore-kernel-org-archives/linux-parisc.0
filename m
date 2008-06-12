From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: hppa release status
Date: Thu, 12 Jun 2008 10:39:07 -0500
Message-ID: <1213285147.3426.23.camel@localhost.localdomain>
References: <20080608194617.GT10194@mails.so.argh.org>
	 <484EF5D7.5000209@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andreas Barth <aba@not.so.argh.org>, debian-hppa@lists.debian.org,
	debian-release@lists.debian.org, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <484EF5D7.5000209@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2008-06-10 at 23:44 +0200, Helge Deller wrote:
> CC'ed: parisc-linux kernel development list
> 
> Andreas Barth wrote:
> > during the upload of python2.5, the build failed on hppa due to stalls
> > in the test suite, see http://bugs.debian.org/483042 and
> > http://buildd.debian.org/fetch.cgi?&pkg=python2.5&ver=2.5.2-5&arch=hppa&stamp=1211583145&file=log
> > (Matthias "fixed" that bug by disabling the testsuite, not something that makes
> > us happy.)
> > 
> > After that happened, we asked on #parisc if someone could take a look,
> > and we were told that linuxthreads is currently unmaintained for hppa,
> > and the issue could only be fixed by moving to nptl and we need to do an
> > (incompatible) abi change in glibc. Such a change would be really
> > unfortunate, and we hope that every other roads have been evaluated
> > first (like trying to understand why python on linuxthreads fails on
> > hppa but not on e.g. kfreebsd). We also would like to be sure that ntpl
> > is really better than linuxthreads for python2.5 before a transition.
> 
> My personal feeling is, that a switch to NPTL is probably the best 
> solution. Even if this involves a abi change.
> Maybe experts on NPTL could comment here?

Well ... we asked for a switch to NPTL over a year ago, raising the ABI
change issue (and requesting glibc6.1 or something similar).  At that
time there was a resounding lack of interest from Debian.  Ordinary
release logic does say that you shouldn't rev an ABI just before a
release.  However debian release logic seems to require some type of
crisis before we can get nptl in, so if this is it ...

> > In addition to the python2.5 issue, there are two other issues that are
> > quite concerning:
> >   * a problem with ruby1.9 which likely is kernel related #478717.
> 
> Hmm..

Actually, I can't reproduce this on ion, which is my debian testing
build box.  The only difference from a normal testing system is that
it's running 2.6.26-rc1 (it's also a pa8800 which makes its coherency a
bit more stringent).  Building python 2.5.2-6 and running all the built
in tests except the two parisc exceptions runs.  Ryan Murray stated that
the failing test was test_sys, so this is what I get running it alone:

jejb@ion> pwd
/home/jejb/sources/python2.5-2.5.2/build-shared
jejb@ion> ./python  -E -tt ../Lib/test/regrtest.py -w -l -uall -s
test_sys
test_sys
1 test OK.

So I think more investigation of the actual alleged failure is
warranted.  At this time, if it is a real failure, I'm not sure it's
necessarily threads related.

> >   * dirmngr that segfaults, likely because of some signalstack issues
> >     #459567.
> 
> Yes, we need to implement makecontext()/getcontext() in glibc.
> 
> > We've seen no porter activity on those bugs yet.
> 
> I'd volunteer to try on thedirmngr/makecontext() issue. (At least as far 
> as my time permits).
> 
> > On further discussing that within the release team, we noticed that the
> > Qualification page on http://wiki.debian.org/hppaLennyReleaseRecertification
> > is not really complete, e.g. it says:
> > | The installer is being maintained by ... and it's currently working
> > | effectively. Successful installation reports are available at: ...
> > 
> > It would really be great (read: it is necessary) that the Qualification
> > Page is filled with the missing information, and that we actually have
> > enough porters for hppa.
> 
> I've added myself there in a few items.
> I'd be willing to look into issues with the installer, but not being a 
> active debian developer I'd need help from a debian guy if necessary.
> 
> > So, with respect to the python2.5 issue, what now?
> > 
> > 
> > At the technical side, best of course would be if linuxthreads would
> > continue to work at least enough for lenny, this was the case for a few
> > years already, it should be able to survive a few months more, and
> > python2.5 can build with the test-suite on hppa.  Of course not breaking
> > the API during a linuxthreads -> NPTL switch would be even better.
> 
> I can't comment on that.

I'll see if I can fix it whatever it is, but right now I need a
reproducible test case.  It looks like the current failure might be tied
to whatever the buildd system was doing or some weird installation
dependency it happens to have that I don't.

James


