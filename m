Return-Path: <hppa-linux@puffingroup.com>
Date: Thu, 4 Feb 1999 00:32:44 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Message-ID: <Pine.LNX.3.96.990204002746.907E-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] egcs in cvs.
Resent-Message-ID: <"Hqd_p.0.Hn6.BhKks"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


I uploaded egcs 1.1b into the HPPA Linux CVS so that we can work on this
together.  I know that Paul Lahaie was interested in working on it.

I've gotten partway; it's all under the assumption that you're using my
binutils rpm.

I've fixed a few things, like detection of hppa1.1-hp-linux, merging some
stuff from the mklinux gcc 2.6.3.  

The intention is to get a cross compiler at first, so, build it with:

./configure --prefix=/usr/hppa-linux --target=hppa1.1-hp-linux

Also, because we don't have glibc include files yet, you'll have to
manually add -Dinhibit_libc in gcc/Makefile.  Bleah.

I'm not *quite* sure about cvs instructions.  I'm sure someone can post
them tomorrow.

At some point we're going to have to look into HPPA 2.0 instructions.

- Alex

-- 
Alex deVries <puffin@redhat.com>
Red Hat Contrib Net maintainer
Ottawa, Canada

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
