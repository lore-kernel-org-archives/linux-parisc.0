Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E5DD482B
	for <parisc-linux@parisc-linux.org>; Sun,  4 Nov 2001 00:33:59 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id xbiniaaa for parisc-linux@parisc-linux.org; Sun, 4 Nov 2001 00:28:58 -0700
Date: Sat, 3 Nov 2001 23:33:52 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Cc: bcollins@debian.org, chris@debian.org
Message-ID: <20011103233352.F505@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa binutils/glibc updates
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

Some good news, I hope....

With latest patches from Alan Modra, things seem to be looking better.
Here's what I've tried:

In a chroot built with debootstrap plus build-essential:
- Rebuild binutils from sourceware cvs
- Using new binutils, rebuild glibc (2.2.4-5) with am's latest patch

With these bits installed, the following were tested:
- build and install wget (just a simple sanity test)
- install and run libgtk1.2 and gkrellm
- recompile and run python1.5 and apache

all these seem to be ok now. Before recompiling, things like python will
die with a SIGILL

I've made a list of all the packages that got uploaded between around
Oct 15 till now. All these need to be recompiled and binary-NMU's need to
be made. James/LaMont/Bdale/myself/etc can do these fairly easily with
sbuild after new binutils and glibc bits are uploaded. Hopefully we can also
restart the buildd after that.

Chris/Ben: can you let us know when we can expect new binutils/glibc?
I'll forward the glibc patch to Ben separately.

If you can think of anything else that we should try to make sure
everything works, please let us know.

fingers crossed,
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
