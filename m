Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BAB0482A
	for <parisc-linux@parisc-linux.org>; Sat,  9 Mar 2002 11:35:47 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id luoxlaaa for parisc-linux@parisc-linux.org; Sat, 9 Mar 2002 11:35:07 -0700
Date: Sat, 9 Mar 2002 10:35:24 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020309183524.GC628@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] FYI: state of toolchain for Debian woody release
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

Just thought I'd post a quick note about some of the things happening
recently:

With many thanks to Dave Anglin and the investigation work by Carlos
O'Donell, we've finally fixed the bug in gcc-3.0 that affected passing
floating point arguments in indirect calls.

The new compilers are now in the Debian archive, and we are slowly
starting to rebuild some of the affected packages. (gs and python2.1
were the ones I knew about offhand, and they are now in the incoming
queue). If you know of any other Debian packages you use that might be
affected by this bug, let us know and we'll rebuild it.

There are still some known problems with the compilers, most notably the
problems with fixups that aren't able to reach their targets and thus 
requiring compilation with -ffunction-section. I have one patch from
Dave that fixes this in some cases, but as I understand it the general
problem is more involved and might not get fixed till post-woody.

gdb also seems to be rather broken on hppa at the moment. Single
stepping doesn't always (doesn't usually) work, and there's a problem 
with recognizing core files. If anyone has time to look into these 
and submit patches, that'll be great!

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
