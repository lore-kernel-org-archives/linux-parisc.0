Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA20389
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Dec 1999 17:44:19 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id 98420B18
	for <parisc-linux@thepuffingroup.com>; Thu,  2 Dec 1999 16:46:15 -0800 (PST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id QAA13676 for parisc-linux@thepuffingroup.com; Thu, 2 Dec 1999 16:47:23 -0800 (PST)
Date: Thu, 2 Dec 1999 16:47:23 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199912030047.QAA13676@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] /usr/conf/machine header files
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
This started with the search for IODC return data. IODC data is
"documented" in the header file /usr/conf/machine/cpu.h. This is
on both 10.20 and 11.00 HP-UX.  Look for real_IODC_data. And remember
the bit fields are allocated from "left to right" (MSB is bit 0).


This directory seems to be a gold mine of information about hardware.
I happened to look into /usr/conf/machine/save_state.h and found:
 *      There are three kinds of PA-RISC computer:
 *
 *      PA-RISC 1.0 (sometimes called PA83)
 *              32-bit integer registers with 16 64-bit floating point
 *              registers.  No Series 700 is a PA 1.0 machine and only a
 *              few models of the oldest Series 600 and 800 machines are
 *              PA 1.0.
...

Anyone interested in context switching though might find this
*very* interesting reading...Other interesting files are:

   File     Example
   -------- ----------------
   boot.h   /* Parameters exchanged between kernel loader and the kernel    */
   cpu.h    real_IODC_data and Module type numbers
   eeprom.h eg MIRAGE_EEPROM_BASE_ADDR is defined here
   eisa.h   Sversion for snakes/WAX EISA and EISA system board ids
   frame.h  Assembly Language Offsets for Argument or Stack Pointer
...


Happy Hunting!

grant
