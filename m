Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5331482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Apr 2002 15:11:44 -0600 (MDT)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g3RLBia12886
	for parisc-linux@lists.parisc-linux.org; Sat, 27 Apr 2002 17:11:44 -0400
Date: Sat, 27 Apr 2002 17:11:44 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020427171144.C12610@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HIL -> Keymap ok?
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

pa's,

I recently needed to connect an HIL keyboard to our 715/50 boxes and
was surprised to find that the key mapping was less than correct
(2.4.18-pa22).

--
5. Scorpio Core HIL (10) at 0xf0821000 [2/0/3], versions 0x7, 0x0, 0x73
Found HIL at 0xf0821000, IRQ 94
HIL: keyboard found at id 0
HIL: keymap loaded.
--

Looks okay. But I get all the wrong letters and control commands in 
all the wrong places (e.g. a=x, i=\n).

I've tried on two or three boxes with two or three different keyboards
(have a whole box of HIL keyboards if anyone is in desperate need of
one).

The install is based on 0.9.3 with all the latest apt-get updates.
I stopped running keymap.sh with no adverse effects (since the keymap
is loaded by the HIL driver).

The HIL driver is the old one?
[Character Devices]-[Support for Console on VT]-[HIL kbd support]

CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_HIL=y

I also have a serial console enabled.

I haven't tried HP System Device Driver (i8042) yet... (Though from
the looks of it, it's not quite complete?)

Any thoughts? (I've wadded through the list archives but no success).

c.

p.s. This is just the start of my quest to stop the unbliking eye...
     a.k.a. "hardware cusor blinking" ... from _always_ appearing 
     during framebuffer writes.
