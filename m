Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e202.dhcp212-198-142.noos.fr [212.198.142.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD8AC4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Apr 2003 10:58:04 -0600 (MDT)
Received: from Tatooine.r3z0 (varenet@Tatooine.r3z0 [192.168.69.3])
	by mail.zigoo.net (8.12.8/8.12.7) with SMTP id h3CGw2H8017279
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Apr 2003 18:58:03 +0200
Date: Sat, 12 Apr 2003 18:58:02 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20030412185802.0dd509bf.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Strange delay loop calibration with SMP kernel on UP system
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

Hi pa-ckers!

As I was working on 2.5 SMPness on our A500, tausq suggested me to try SMP
kernel on a UP box.
So I deconfigured one CPU on the A500.

The kernel failed miserably, and I rebooted the box with its _original 2.4
SMP kernel_, _without bringing the second CPU back online_.

I repeat: i booted the box with the 2.4 SMP kernel it used to run with 2
CPUs. That's 2.4.20-pa28 fwiw.

What a surprise!

The delay loop calibration gave a completely different value than what I'd
have expected according to previous boots.

see:

A500 configured with 2 CPUs:
Calibrating delay loop... 1097.72 BogoMIPS

A500 configured with 1 CPU:
Calibrating delay loop... 366.18 BogoMIPS

Please mind I'm not talking about "total bogomips".
I'm talking about the calibration that takes place at the very early stage
of the boot process, on 1 CPU (the monarch on SMP systems).

So that has nothing to do with having half bogomips because there's half
processors.

That being said, one would have noticed that 1097.72/366.18 ~= 3

Now I wonder, is that normal (I couldn't check on another arch), or is
that some kind of new and unknown bug?

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
