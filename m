Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA02436
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Sep 2000 07:05:41 -0600
Sender: romain@front6.grolier.fr
Message-ID: <39C37F48.E9481800@club-internet.fr>
Date: Sat, 16 Sep 2000 15:10:16 +0100
From: Romain Dolbeau <dolbeaur@club-internet.fr>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Netbooting a 710 : IPX ?
List-ID: <linux-parisc.vger.kernel.org>

Hello,

I've trouble netbboting my 710 : it seems that it doesn't
broadcast bootp request, but some IPX Service Advertisement
Protocol stuff...

here's what tcpdump has to say :

#####
tcpdump: listening on hme0
14:31:31.864970 8:0:9:25:bd:de 8:0:20:86:f0:d3 0029 55: sap f8 ui/C
>>> Unknown IPX Data: (38 bytes)
[000] 00 00 00 06 08 06 09 01  00 00 00 00 00 FF FF 00  ........
........
[010] 02 48 50 53 37 30 30 20  20 20 20 20 20 20 20 20  .HPS700          
[020] 20 20 20 20 20 00                                      . 
 len=38
                         f8f8 0300 0000 0608 0609 0100 0000 0000
                         ffff 0002 4850 5337 3030 2020 2020 2020
                         2020 2020 2020 2020 00
14:31:53.778428 8:0:9:25:bd:de 9:0:9:0:0:4 0029 55: sap f8 ui/C
>>> Unknown IPX Data: (38 bytes)
[000] 00 00 00 06 08 06 09 01  00 00 00 00 00 FF FF 00  ........
........
[010] 02 48 50 53 37 30 30 20  20 20 20 20 20 20 20 20  .HPS700          
[020] 20 20 20 20 20 00                                      . 
 len=38
                         f8f8 0300 0000 0608 0609 0100 0000 0000
                         ffff 0002 4850 5337 3030 2020 2020 2020
                         2020 2020 2020 2020 00
#####

8:0:9:25:bd:de is the hp710
8:0:20:86:f0:d3 is the bootpd host (a Sun Ultra 1)

Does anyone know :

# if it's possible to make this 710 behave properly
 (i.e. use IP)

# or to netboot using IPX (I can use Solaris/sparc
 or NetBSD/sparc for netbooting, I could probably
 add Linux/sparc to the list)

Thanks in advance,

-- 
DOLBEAU Romain
ENS Cachan / Ker Lann
Thesard IRISA / CAPS
dolbeaur@club-internet.fr
