Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA21276
	for <parisc-linux@puffin.external.hp.com>; Mon, 9 Oct 2000 20:56:04 -0600
Received: from gag.com (localhost [127.0.0.1])
	by rover.gag.com (Postfix) with ESMTP id 26519359E7
	for <parisc-linux@thepuffingroup.com>; Mon,  9 Oct 2000 20:57:00 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Date: Mon, 09 Oct 2000 20:57:00 -0600
From: Bdale Garbee <bdale@gag.com>
Message-Id: <20001010025700.26519359E7@rover.gag.com>
Subject: [parisc-linux] ntpd fails on mlockall()
List-ID: <linux-parisc.vger.kernel.org>

I built a package of ntp, and it installed ok, but when ntpd goes to launch,
I get the following in daemon.log:

Oct  9 20:51:27 j5k ntpd[19416]: ntpd 4.0.99g Mon Oct  9 20:44:40 MDT 2000 (1)
Oct  9 20:51:27 j5k ntpd[19416]: mlockall(): Cannot allocate memory

And in dmesg output, I see:

do_page_fault() pid=19416 command='ntpd'

PSW  : 0004000a  GR 1 : 40053cf0  GR 2 : 40052777  GR 3 : 40054c44  
GR 4 : 400544f0  GR 5 : 4005ec4c  GR 6 : 4005ec4c  GR 7 : 00000000  
GR 8 : ffffffff  GR 9 : 00059cf0  GR10 : 2001fd24  GR11 : 0005c140  
GR12 : 0003a800  GR13 : 0003a800  GR14 : 0005c140  GR15 : 0005c140  
GR16 : 0005c140  GR17 : 00000001  GR18 : 0005c140  GR19 : 40197148  
GR20 : 00000000  GR21 : 00000000  GR22 : 00001fe9  GR23 : 00000004  
GR24 : 000001b0  GR25 : 0005d020  GR26 : 4005ec88  GR27 : 00045140  
GR28 : 00000000  GR29 : 0005f1b8  GR30 : 200203c0  GR31 : 40083f13  
SR0  : 00000000  SR1  : 0000200b  SR2  : 00000000  SR3  : 0000200b  
SR4  : 0000200b  SR5  : 0000200b  SR6  : 0000200b  SR7  : 0000200b  

IASQ : 0000200b 0000200b IAOQ : 4005277f 40052783 ORIG_R28 : 00000000
 IIR : 0eb41288 ISR : 0000200b IOR : 00000004

sending SIGSEGV


Anyone know what's going on?

Bdale
