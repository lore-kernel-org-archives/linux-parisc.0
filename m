Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52381611E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 16:09:56 -0700 (MST)
Received: from hpgrla.gr.hp.com (hpgrla.gr.hp.com [15.57.1.1])
	by atlrel6.hp.com (Postfix) with ESMTP id 38929600B26
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 18:09:55 -0500 (EST)
Received: from kontiki.gr.hp.com (kontiki.gr.hp.com [15.38.138.59])
	by hpgrla.gr.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) with SMTP id QAA10720
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 16:09:54 -0700 (MST)
Received: from spawn ([15.38.138.60] verified) by kontiki.gr.hp.com (Stalker SMTP Server 1.8b8) with SMTP id S.0000030114 for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 16:10:00 -0700
Reply-To: <sanaya@gr.hp.com>
From: "Sean J. Anaya" <sanaya@gr.hp.com>
To: "HP Linux Email List" <parisc-linux@lists.parisc-linux.org>
Date: Wed, 12 Dec 2001 16:13:50 -0700
Message-ID: <004701c18362$a880c6d0$3c8a260f@spawn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] A C180 up and running (partially)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

I finally got my C180 installed with pa-linux v0.9.3, WooHoo!

Couple of questions tho:

1) I'm having trouble navigating the install program using a windows 2000
   machine as a serial terminal using the Hyperterminal program setup as
   a vt100. Seems the up/down arrows do not work and I need to use CTRL-n
   in some areas and CTRL-v in others, but they don't scroll down to the
   next item, acts more like a page.

   Any suggestions on how to setup the Hyperterminal program to correctly
   navigate the install program or a different program I could use as a
terminal
   with a windows 2000 machine?

2) I can get the system to boot with the serial console, but when I attach a
graphics
   one, the system hangs during the boot process. I'm guessing this has
something to
   do with the fact I couldn't properly choose what kernel devices to add
since I could
   scroll through the selection list. See Above.

Thanks,

Sean Anaya
sanaya@gr.hp.com
