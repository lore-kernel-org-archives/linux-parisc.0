Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 28 Sep 2003 01:16:57 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030928071657.GA28657@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [owner@bugs.debian.org: Bug#204844 acknowledged by developer (Re: Bug#204844: xlibs: libXt.so needs to be built with gcc 3.3.x for HPPA)]
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

FYI -  hppa xfree86 libs should be usable again in "testing" release.
(eg xpdf and related stuff should be working).
Please post issues if it's not.
I can rebuild xfree86-4.2.1-11 bits if that is needed.
I'll be removing the 4.2.1-9 hppa.debs in the future when it's
clear they aren't needed.

enjoy!
grant

(kudos to branden+et al who enabled this!)

----- Forwarded message from Debian Bug Tracking System <owner@bugs.debian.org> -----

Date: Sat, 27 Sep 2003 19:56:23 -0500
From: Branden Robinson <branden@debian.org>
To: 204844-done@bugs.debian.org
Subject: Re: Bug#204844: xlibs: libXt.so needs to be built with gcc 3.3.x for HPPA

On Wed, Aug 27, 2003 at 09:57:00PM -0600, Grant Grundler wrote:
> On Wed, Aug 27, 2003 at 09:27:45PM -0500, Branden Robinson wrote:
> ...
> > My feeling is that our efforts are best spent on getting a newer 4.2.1
> > package into testing at this point.
>=20
> Agreed.
>=20
> I've placed a full set of "hand crafted" 4.2.1-9 hppa debs on:
> 	http://gsyprf11.external.hp.com/hppa/xfree86-4.2.1-9/
>=20
> Built with gcc 3.3.1 and current "testing" binutils.
> Works For Me (tm).
>=20
> These are built by hacking the Makefile "world" target to not rebuild
> everything from scratch and iteratively fix up the two problems by hand.
> source/build tree is intact on gsyprf11 in case someone wants a copy.

xfree86 4.2.1-11 entered Debian testing on Friday.

Closing this report.

--=20
G. Branden Robinson                |    Freedom is kind of a hobby with me,
Debian GNU/Linux                   |    and I have disposable income that
branden@debian.org                 |    I'll spend to find out how to get
http://people.debian.org/~branden/ |    people more of it. -- Penn Jillette

----- End forwarded message -----
