Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2A1E482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 14:02:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14hHeZ-0008CV-00
	for parisc-linux@parisc-linux.org; Sun, 25 Mar 2001 22:02:23 +0100
Date: Sun, 25 Mar 2001 22:02:23 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010325220223.G31126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Building packages, problems with printf
List-ID: <linux-parisc.vger.kernel.org>

Something we've been running into when building packages is the problem
that printf is defined as a macro when using gcc 2.97.  This should be
resolved by doing the following:

#include <stdio.h>
#undef printf

fixing glibc to not do that seems to not be an option.  ANSI explicitly
allows any of the functions in libc to also be defined as macros.

-- 
Revolutions do not require corporate support.
