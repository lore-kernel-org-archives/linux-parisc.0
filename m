Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (p238.sw02.auto.usertools.net [202.154.81.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 361034829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Jan 2003 02:18:42 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id RAA03832
	for parisc-linux@lists.parisc-linux.org; Sat, 25 Jan 2003 17:17:54 +0800
Date: Sat, 25 Jan 2003 17:17:51 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Um... WTF?
Message-ID: <20030125171749.F674@neep.com.au>
References: <Pine.LNX.4.33.0301241520210.25246-100000@jordan.eng.nateng.com> <20030125015308.GC6228@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030125015308.GC6228@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Jan 24, 2003 at 06:53:08PM -0700
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

Grant Grundler said:
> On Fri, Jan 24, 2003 at 03:37:28PM -0800, Sir Ace wrote:
> >   I have no idea who to direct this to, and everyone keeps directing me to
> > this liste, so here goes.
> 
> parisc-linux mailing list is really intended for kernel stuff.

And glibc, gcc, binutils, & documentation ... everything hppa but not
Debian.  =)

> lists.debian.org has lots of mailing lists to post rants.

Not that they're any more welcome there.

> > Herein lies the problem, some how EVERY DAMN THING on the system seems to
> > be built against ncurses,
> 
> Right. *system* being the operative word here.

Poor Sir Ace must be confused.  A Debian GNU/Linux 3.0 install on hppa
should work fine.  Look at all these happy people who are running it!

Possibly the ncurses package was not installed properly, or some of the
files owned by it had become damaged or corrupted.  You could manually
reinstall the package with 'dpkg -i /path/to/package.deb' and then make
sure that all packages are ready with 'dpkg --configure -a'.  Then you
can run 'dpkg -l|grep -v ^ii' to see what (if any) packages on the
system are in a state other than fully installed (eg partially
installed, not configured, etc.)

If you've done all this and not gotten anywhere, the debian-hppa list
may be able to help you out if you ask nicely.

> You might also try booting with "init=/bin/bash" or if you are lucky,
> "init=/bin/sash". Then by hand re-install the libncurses.

Grant, do you mean "lucky" as in "if you've got sash installed"?  It
doesn't depend on ncurses.  Or am I just not understanding you?

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
