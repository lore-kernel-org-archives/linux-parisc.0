Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nimes8.k0k.net (AMontpellier-203-1-2-94.abo.wanadoo.fr [80.14.10.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA35A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 14:24:58 -0600 (MDT)
Received: from humus (martin@martin.k0k.net [192.168.1.1])
	by nimes8.k0k.net (8.12.3/8.12.3/Debian -4) with ESMTP id g5CKOsGC000735
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 22:24:55 +0200
Content-Type: text/plain;
  charset="us-ascii"
From: Martin =?iso-8859-15?q?K=FCchler?= <martin@k0k.net>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 12 Jun 2002 22:22:35 +0200
MIME-Version: 1.0
Message-Id: <200206122222.35054.martin@mail.k0k.net>
Subject: [parisc-linux] tst unaligned access
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

Hello,

After a successful uptime of about a month, I could not log in to my 712/60 
any longer. I found the following error message at the console: 

tst(11624): unaligned access to 0xbff003d4 at ip=0x000105b3
Not-handled unaligned insn 0x2f401016
unaligned handler failed, ret = -1

I am not even sure if this is the cause of the login problem, but I found a 
description that was samewhat similar (but on a different machine):

http://lists.debian.org/debian-hppa/2001/debian-hppa-200109/msg00053.html

My problem was, everything was working fine (network, iptables with 
masquerading, server processes ...), but when I tried to log in he just 
wouldn't give me the shell (after the username/password I got the login 
message and nothing else). 

Even shutdown with the soft power switch didn't work, I had to pull the plug 
:-(
But now, after reboot everything seems to be fine ... 

What could this have been ? And what is this tst process ??

I have a 2.4.18-pa22 kernel,  iptables v1.2.6a.

Thanks,

Martin
