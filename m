Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C6EE4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 08:25:22 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA09592
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Feb 2001 08:21:12 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA11161
	for <parisc-linux@thepuffingroup.com>; Fri, 2 Feb 2001 09:25:11 -0600
Date: Fri, 2 Feb 2001 09:25:11 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <200102012215.XAA10570@zaphod.halden.lillfab.se>
Message-ID: <Pine.LNX.4.21.0102020921190.10996-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 w/ Current CVS Bits
List-ID: <linux-parisc.vger.kernel.org>

Howdy,

Did it again.  CVS update, build new kernel, boot.  This one mounts the
root filesystem from a SCSI disk and then barfs copiously with this
message:

	kernel BUG at /usr/src/parisc/linux/include/asm/pgalloc.h:60!

Quick ref:  Here's the offending code from flush_cache_range():

	if (!mm->context) {
		BUG();
		return;
	}

Suggestions?

- Greg
