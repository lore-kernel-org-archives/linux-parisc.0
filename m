Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC4E9483A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 14:52:41 -0700 (MST)
Message-Id: <200211182152.gAILqaHk021705@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Mon, 18 Nov 2002 16:52:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211172143030.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 18, 2002 09:38:22 pm
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

> *grmml* failed again in; this time in parse.o

If the failure was caused by a segmentation fault, restart the build with
"make bootstrap2" or "make bootstrap3" depending on the stage in which
it failed and see what happens.

> ../gcc/configure -v --enable-languages=c,c++,f77,objc --prefix=/usr --infodir=/share/info \

It is not a good idea to replace the default compiler used for building
the system and glibc.  These pretty much have to be kept in sync.  Set
--prefix to some other directory.  It is not a bad idea to keep each
version of gcc in its own directory.  If there is a bug in the installed
compiler, it makes it much easier to do a new build.

The Makefile's use /bin/sh and pretty much assume bash or ksh.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
