Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5B724A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 03:31:01 -0700 (MST)
Received: from dot.at (IDENT:plattner@dot-tc01-020.dot.at [212.9.128.60])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id LAA15941
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 11:43:56 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A8FA463.E18666D3@dot.at>
Date: Sun, 18 Feb 2001 11:30:59 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Cross-Compiling BASH
List-ID: <linux-parisc.vger.kernel.org>

How to build successfully a `bash', with other tools (expect
strace) I have not so big problems.

The `bash' built process has problems in `configure' in a cross compiled
environment.
It tries some functions via C examples, and they have difficulties to
determine the
result of a compile option, as this is not native....

I tried with 

	HOSTCC=gcc CC=hppa-linux-gcc ../configure --host=hppa-linux \
		 --prefix=/usr/parisc/hppa-linux 

Configure stops with:

checking for working alloca.h... yes
checking for alloca... yes
checking whether getpgrp takes no argument... configure: error: cannot
check getpgrp if cross compiling

How to build a bash (I am always interested in building from the scratch
(hobby)) !

With friendly regards

	Christoph P.





-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
