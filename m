Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 526144829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 13:27:21 -0700 (MST)
Message-Id: <200303092027.h29KR1pk026585@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Sun, 9 Mar 2003 15:27:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <15979.40670.331645.441499@gargle.gargle.HOWL> from "Matthias Klose" at Mar 9, 2003 09:06:54 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Randolph Chung writes:
> > In reference to a message from Matthias Klose, dated Mar 01:
> > > Matthias Klose writes:
> > > > AFAIK the transition from 3.2 to 3.3 requires recompilation of C++
> > > > code due to the changed exception handling (now DWARF2 based). As
> > > > libstdc++ in 3.2 and 3.2 have the same soname, how to handle it?
> > > > Currently 3.2 is in unstable only. Would you want to start the
> > > > recompilation before 3.2 based binaries go to testing?
> > > > 
> > > > The packaging for 3.3 can be found in the Debian CVS.
> > > 
> > > You can get test packages from
> > > 	http://ftp-master.debian.org/~doko/gcc-3.3/
> > 
> > well.... this is not looking good. after installing these in a freshly
> > built sarge chroot, all c++ programs stop working (well, i've only tried
> > two -- apt and fakeroot)
> 
> You can find updated packages at
> 	http://ftp-master.debian.org/~doko/gcc-3.3/hppa/
> checked building bash (fakeroot) and upgrading an unstable chroot (apt).
> 
> > (btw, small packaging detail, but the libstdc++*-dev package above
> > cannot be installed cleanly because it overwrites things in the current
> > 3.2 package)
> 
> There is still one conflict for libstdc++5-dev (<= 1:3.2.3-0pre3), so
> please install libstdc++5-dev (1:3.2.3-0pre4) first.

Did you configure 3.3 using "--enable-sjlj-exceptions=yes"?  That way
the 3.3 C++ library should be compatible with the previous 3.3 library.
The switch to dwarf2 can be delayed until the next debian release.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
