Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA22712
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 15:04:34 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 9CD68555
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 17:06:00 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id OAA07605 for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 14:05:59 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <3829EC47.12A0BC04@hp.com>
Date: Wed, 10 Nov 1999 14:05:59 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Basic HPMC handler submitted.
List-ID: <linux-parisc.vger.kernel.org>

I have submitted a basic HPMC handler.  If an HPMC occurs, the message:

  >>  HPMC occurred  --  resetting system  <<

will be printed and the machine will be reset (except for the A180, which
wedges in the PDC call that is supposed to reset the system - power cycle
your A180).

Feel free to critique the code or fill in the gaps that I left...

The files modified are:

  arch/parisc/kernel/head.S
  arch/parisc/kernel/interruption.S
  include/asm-parisc/assembly.h
  include/asm-parisc/pdc.h


-Frank Rowand
