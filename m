Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from feux01a-isp (unknown [213.199.4.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BC1D48A4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 03:16:46 -0700 (MST)
Received: from duecel.rete.priv (adsl-62-123-51-84.dial.atlanet.it [62.123.51.84] (may be forged))
	by feux01a-isp (8.10.1/8.10.1) with ESMTP id hAIAUCX27682
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 11:30:17 +0100 (MET)
From: Pietro <pietro-ki@3000.it>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 18 Nov 2003 11:16:30 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200311181116.31082.pietro-ki@3000.it>
Subject: [parisc-linux] serial console on hp 715/50
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

Hi to all,

I have only one question.

from PA-RISC/Linux Boot HOWTO, Chapter 3. Preparing to boot
> 3.2.2. Using serial console
> 3.2.3.2. Changing to serial console mode
> To change to serial console mode, type the following command at the  
> 'BOOT_ADMIN>' command prompt : 
> path console rs232_a.9600.8.none 
[cut]

It's nice, but I need switch to serial console because I _have not_ HIL kbd,
so I can't type anything !!
(box is live, after bootstrap flashing sequence of LEDs I can see heartbeat
LED blinking and on multisync monitor attached then on it I can see
screen full of messages)

I proved almost all: power on without TOC button, power on with TOC button,
TOC bt after power on for a while, TOC bt after power on for 10 sec,
all of this without screen attached (and without kbd attached too - I've no 
kbd)
but without results. Every time box uses graphic console, not serial one.

Terminal is runing on another Linux box (minicom - 9600-8-N-1) with
null modem cable (cable is tested against another Linux box - OK)

Any help is appreciated.
Many thanks in advance.

Pietro Bernardi, Italy
-- 
Have a nice day
