Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp01.web.de [217.72.192.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9E5F482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 14:19:06 -0700 (MST)
Received: from c-180-204-126.n.dial.de.ignite.net ([62.180.204.126] helo=web.de)
	by smtp.web.de with asmtp (WEB.DE(Exim) 4.93 #1)
	id 18bokb-0007UC-00
	for parisc-linux@lists.parisc-linux.org; Thu, 23 Jan 2003 22:19:05 +0100
Message-ID: <3E305C44.11F38160@web.de>
Date: Thu, 23 Jan 2003 22:19:00 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kernel update bug?
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

Hi,

I recently got a C360 to play around with it. After installing an old beta
of woody (thats the distribution, I got on my private net), everything seemd
fine. The kernel --
Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov
30 19:36:30 MST 2001 -- worked just fine. 

After this, I installed a newer kernel (well, I just copied the kernel, and
omitted the modules):  -- 
Linux version 2.4.20-pa18 (bame@dsl2) (gcc version 3.0.3) #1 Fri Dec 27
06:12:20 MST 2002 --
and with this kernel, the machine crashes reproduceable when starting up. 

Now the reason: I found, that with kernel 2.4.9, there were 3 serial devices
found

/dev/ttyS0 uart 16550A port 0x0000 irq 90 baud_base 454545 spd_normal
/dev/ttyS1 uart 16550A port 0x0000 irq 106 baud_base 454545 spd_normal
/dev/ttyS2 uart 16550A port 0x0000 irq 170 baud_base 454545 spd_normal

the later kernel finds only the first two of these interfaces, and restarts
when restoring the settings of /dev/ttyS2. Later it crashes completely of
course. I could fix this behaviour by commenting out the last line in
/etc/serial.conf.

Now my question: should kernel 2.4.20 find two or three serial devices on a
C360, and why does the kernel crash if setserial tries to configure a
(nonexistant?) device?


Berthold
