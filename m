Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60B45482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 00:39:35 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id ulbrgaaa for parisc-linux@lists.parisc-linux.org; Mon, 16 Jul 2001 23:36:02 -0700
Date: Mon, 16 Jul 2001 23:38:54 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010716233854.B21338@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="k1lZvvs/B4yU6o8G"
Subject: [parisc-linux] IDE patch
List-ID: <linux-parisc.vger.kernel.org>

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch was applied to CVS yesterday. It enables the IDE and
USB config options for parisc if SuperIO support is selected. This is
just some preliminary infrastructure work. Much still needs to be done
and tested to get IDE to work.

Some notes:
- the changes to ns87415.c is optional. Most PCI-IDE drivers have
  irq14/15 hardcoded as defaults. the ide drivers tries these first,
  fails, and falls back to the default in asm-parisc/ide.h, which has
  the right value
- the patch needs more checking for whether probing can be done. right
  now it blindly probes if superio support is configured, irregardless
  of whether superio is enabled.
- only pio mode is enabled at the moment. I was told that some
  additional work needs to be done elsewhere before we can do bm-dma
- On my c3k it detects the CD-ROM drive fine, but mounting a CD-ROM
  gives a lot of { DriveReady SeekComplete Error } messages. I'm 
  investigating these at the moment.

comments, suggestions and constructive criticisms welcome as always :)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^


--k1lZvvs/B4yU6o8G
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="ide.diff.gz"
Content-Transfer-Encoding: base64

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
AAA=

--k1lZvvs/B4yU6o8G--
