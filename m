Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from feanor.nuclear.demokritos.gr (feanor.nuclear.demokritos.gr [143.233.244.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 101AF482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 Mar 2001 10:34:13 -0700 (MST)
Received: from localhost ([127.0.0.1])
	by feanor.nuclear.demokritos.gr with esmtp (Exim 3.16 #1 (Debian))
	id 14jPHU-0000vR-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 Mar 2001 20:35:20 +0300
Date: Sat, 31 Mar 2001 20:35:20 +0300 (EEST)
From: Konstantinos Margaritis <markos@feanor.nuclear.demokritos.gr>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0103312017460.3454-100000@feanor.nuclear.demokritos.gr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 715/80 woes
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I still have trouble with my 715/80 recognizing my ps/2 keyboard, but I
did a little searching and thought that maybe someone more knowledgeable
might help.

For a start when I turn on the machine the status leds are like this:

oxoooooxx

x: on, o: off

the last one is the power led (obviously on)

ok. now the machine just reports

Failed to initialize a keyboard
Fix the keyboard and cycle power

as I previously reported, and it just keeps changes screen resolution (I
believe I have to press TAB or SPACE to make this stop, but the keyboard
does not work).

Then I press the TOC button, which is supposed to act like a reset. Then
screen goes blank, disks spin like crazy and now the leds become:

oxxoxxoox

now, I was looking to a 720 users guide pdf -thinking that the led
combinations are the same- and i could not find this particular
combination. instead i found that 

oxxoooooo is indicative to a faulty SIMM (which it is not, I tried it on a
712 and it worked).

Anyone has any ideas? Can I force the 715 to use the serial for console?

Any help appreciated.

Konstantinos Margaritis
