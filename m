Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41AEC4A19
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 16:16:55 -0700 (MST)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id 63BD216B
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 18:16:54 -0500 (EST)
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] New native glibc debs available 
In-Reply-To: Your message of "Wed, 07 Mar 2001 16:11:20 MST."
             <20010307231120.68F2737CB4@carmen.fc.hp.com>
References: <20010307231120.68F2737CB4@carmen.fc.hp.com> 
Date: Wed, 07 Mar 2001 16:16:53 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14anAr-0004g4-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

This fixes the "fixincludes" problem, which was then called a pipe
problem, which was then thought to be an lseek problem, which turned
out to be due to using an == instead of an = in some quite old code.
Many thinks to jda and jle for seeing the offensive ==, and to
richard for doing much early work to localize this.

Once your libc shared library is updated, fixincludes (which could
be re-enabled I suppose could be re-enabled in gcc) should work.  Other
things might start working better too, because this problem
theoretically was causing bogus error return values from many syscalls.

	-P
