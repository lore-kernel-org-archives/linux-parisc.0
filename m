Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA07718
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 23:50:11 -0600
Received: (from pschwan@localhost)
	by sawed.res.cmu.edu (8.8.7/8.8.7) id BAA20834
	for parisc-linux@thepuffingroup.com; Fri, 30 Apr 1999 01:50:03 -0400
Message-ID: <19990430015003.E20143@cmu.edu>
Date: Fri, 30 Apr 1999 01:50:03 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=dkEUBIird37B8yKS
Subject: [parisc-linux] [prumpf@jcsbs.lanobis.de: temporary registers]
List-ID: <linux-parisc.vger.kernel.org>


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii

This mail was sent while I was moving the mailing lists to their new
home.  I apologise for the delay.

-Phil

------------------------------------------------------------------
"In film you will find four basic story lines. Man versus man, man
versus nature, nature versus nature, and dog versus vampire."
        - Steven Spielberg

--dkEUBIird37B8yKS
Content-Type: message/rfc822
Content-Description: Forwarded message from Philipp Rumpf <prumpf@jcsbs.lanobis.de>

Return-Path: <prumpf@jcsbs.lanobis.de>
Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sawed.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA19763
	for <parisc-linux@off.net>; Thu, 29 Apr 1999 12:52:23 -0400
Received: (qmail 25257 invoked by uid 15267); 29 Apr 1999 16:50:35 -0000
Delivered-To: thepuffi-parisc-linux@thepuffingroup.com
Received: (qmail 25250 invoked from network); 29 Apr 1999 16:50:33 -0000
Received: from mail.lanobis.de (HELO bbs.lanobis.de) (root@62.104.42.195)
  by mailserv2.iuinc.com with SMTP; 29 Apr 1999 16:50:33 -0000
Received: from world.local by bbs.lanobis.de with smtp
	(Smail3.2.0.92 #2) id m10cu2l-001LxpC; Thu, 29 Apr 1999 18:52:11 +0200 (CEST)
Received: (qmail 20443 invoked from network); 29 Apr 1999 16:44:01 -0000
Received: from insula.local (HELO insula.jcsbs.lanobis.de) (@10.1.31.6)
  by world.local with SMTP; 29 Apr 1999 16:44:01 -0000
Received: (from prumpf@localhost)
	by insula.jcsbs.lanobis.de (8.8.8/8.8.8) id QAA11744;
	Thu, 29 Apr 1999 16:50:05 GMT
Message-ID: <19990429165005.06165@insula.local>
Date: Thu, 29 Apr 1999 16:50:05 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: parisc-linux@thepuffingroup.com
Subject: temporary registers
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Mailer: Mutt 0.89.1
X-Accept-Language: en,de,se

I am currently trying to get basic kernel stuff for the pa1.1 port to work.
We have 6 temporary registers that are read/writable by PL0-code only. I
think we should use them to save commonly used values to have them ready
in interrupt handlers.

I propose to use them in the following way:

CR24 - current, 0 while we are handling an interruption
	current is where the registers' contents are stored when we enter
an interruption handler. We have to set it to some "special value" when we
already use the register save slots in current so we don't overwrite them.
(we can save the registers on the kernel stack in that case).

CR30 - kernel stack pointer, 0 when we are using the kernel stack
	when this is 0, GR30 is the valid kernel stack pointer

CR31 - kernel global pointer

this leaves us 3 more registers to save the registers in to handle inter-
ruptions.

	Philipp

--dkEUBIird37B8yKS--
