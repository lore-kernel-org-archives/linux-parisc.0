Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E3DC482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 22:09:35 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id jbfdiaaa for parisc-linux@parisc-linux.org; Tue, 16 Oct 2001 21:04:55 -0700
Date: Tue, 16 Oct 2001 21:09:25 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011016210925.H537@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc builds!
List-ID: <linux-parisc.vger.kernel.org>

As it turns out there was a binutils bug that seems to be causing the
glibc build failures. it was also affecting mips. the binutils bug is
fixed in the upcoming (tomorrow) -3 release.

glibc is building on my box now. I will upload RSN.

Thanks to Ryan Murray <rmurray@debian.org> for the heads up!

For those of you interested in looking at glibc, there are some warnings
in atomicity.h (we don't have a hppa-specific one) and some of the
linuxthreads tests are failing. Patches will be much appreciated :)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
