Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D93C5482A
	for <parisc-linux@parisc-linux.org>; Tue, 27 Mar 2001 22:00:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14i83s-0006E4-00
	for parisc-linux@parisc-linux.org; Wed, 28 Mar 2001 06:00:00 +0100
Date: Wed, 28 Mar 2001 06:00:00 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010328060000.F7738@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Type sizes
List-ID: <linux-parisc.vger.kernel.org>

What was the reasoning behind:

/* Note these change from narrow to wide kernels */
#ifdef __LP64__
typedef unsigned long           __kernel_size_t;
typedef long                    __kernel_ssize_t;
typedef long                    __kernel_ptrdiff_t;
typedef long                    __kernel_time_t;
#else
typedef unsigned int            __kernel_size_t;
typedef int                     __kernel_ssize_t;
typedef int                     __kernel_ptrdiff_t;
typedef int                     __kernel_time_t;
#endif

in <asm/posix_types.h> ?

on a 32-bit kernel, sizeof(long) == sizeof(int), so why can't we just use
the first set of typedefs?

-- 
Revolutions do not require corporate support.
