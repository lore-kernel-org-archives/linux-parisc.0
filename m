Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from picard.corpconnect.com.au (picard.corpconnect.com.au [203.34.58.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7ED74A18
	for <parisc-linux@parisc-linux.org>; Fri,  2 Feb 2001 04:56:53 -0700 (MST)
Received: from klingon (ppro.corpconnect.com.au [203.34.58.17])
	by picard.corpconnect.com.au (8.8.7/8.8.7) with SMTP id WAA29415
	for <parisc-linux@parisc-linux.org>; Fri, 2 Feb 2001 22:56:50 +1100
Date: Fri, 2 Feb 2001 22:56:50 +1100
Message-Id: <3.0.32.20010202225653.0102f598@pop01.ny.us.ibm.net>
To: parisc-linux@parisc-linux.org
From: Richard Muratti <rmurat@ibm.net>
Subject: Re: [parisc-linux] Problems building glibc
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

In Makeconfig
change 
default_cflags := -g -O2
to
default_cflags := -g -O

I had the same problem and someone on the list
suggested the above

Cheers
Rick




At 12:17 PM 2/02/2001 +0100, you wrote:
>Hi,
>
>building with palinux-autobuilder from todays CVS head I get following 
>problem on 32bit parisc
>
>Greetings,
>Helge


>../include/libc-symbols.h     -o
>/home/cvs/parisc/xc-build/glibc/posix/glob.o
>../sysdeps/generic/glob.c: In function `glob_in_dir':
>../sysdeps/generic/glob.c:1446: Internal compiler error in eliminate_regs,
at 
>reload1.c:2505
>   Please submit a full bug report.
>   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
>make[2]: *** [/home/cvs/parisc/xc-build/glibc/posix/glob.o] Fehler 1
>make[1]: *** [posix/subdir_lib] Fehler 2
>make: *** [all] Fehler 2
