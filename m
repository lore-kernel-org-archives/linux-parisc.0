Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76F444829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 13:08:13 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15979.40670.331645.441499@gargle.gargle.HOWL>
Date: Sun, 9 Mar 2003 21:06:54 +0100
To: Randolph Chung <tausq@debian.org>
Cc: debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030302045936.GS11363@tausq.org>
References: <15968.40812.741982.606734@gargle.gargle.HOWL>
	<15969.1828.456001.122737@gargle.gargle.HOWL>
	<20030302045936.GS11363@tausq.org>
Subject: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
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

Randolph Chung writes:
> In reference to a message from Matthias Klose, dated Mar 01:
> > Matthias Klose writes:
> > > AFAIK the transition from 3.2 to 3.3 requires recompilation of C++
> > > code due to the changed exception handling (now DWARF2 based). As
> > > libstdc++ in 3.2 and 3.2 have the same soname, how to handle it?
> > > Currently 3.2 is in unstable only. Would you want to start the
> > > recompilation before 3.2 based binaries go to testing?
> > > 
> > > The packaging for 3.3 can be found in the Debian CVS.
> > 
> > You can get test packages from
> > 	http://ftp-master.debian.org/~doko/gcc-3.3/
> 
> well.... this is not looking good. after installing these in a freshly
> built sarge chroot, all c++ programs stop working (well, i've only tried
> two -- apt and fakeroot)

You can find updated packages at
	http://ftp-master.debian.org/~doko/gcc-3.3/hppa/
checked building bash (fakeroot) and upgrading an unstable chroot (apt).

> (btw, small packaging detail, but the libstdc++*-dev package above
> cannot be installed cleanly because it overwrites things in the current
> 3.2 package)

There is still one conflict for libstdc++5-dev (<= 1:3.2.3-0pre3), so
please install libstdc++5-dev (1:3.2.3-0pre4) first.

	Matthias
