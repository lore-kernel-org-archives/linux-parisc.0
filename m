Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA19512
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Apr 2000 19:14:28 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 1C94CEE6
	for <parisc-linux@thepuffingroup.com>; Tue, 18 Apr 2000 21:14:27 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id SAA24724 for <parisc-linux@thepuffingroup.com>; Tue, 18 Apr 2000 18:14:39 -0700 (PDT)
Message-Id: <200004190114.SAA24724@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2-way j5000 hangs early 
In-reply-to: Your message of "Tue, 18 Apr 2000 18:01:39 PDT."
             <200004190101.SAA24682@milano.cup.hp.com>
Date: Tue, 18 Apr 2000 18:14:39 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Hi all,
> 
> I was hoping to use a j5000 to debug problems with built-in 100BT
> but couldn't even "get off the ground" (so to speak).

I forgot to append the TOC output....here it is.

Grant Grundler
Unix Development Lab
+1.408.447.7253

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  ffffffffc023d000  00000000c01131dc  0000000000000000
04-07   00000000c023b300  00000000c020e1fc  0000000000000006  0000000000000004
08-11   ffffffffc0100000  00000000c023e6b2  00000000c023e6b2  ffffffffc0215000
12-15   000000000000000a  000000000000003e  000000000000003c  0000000000000007
16-19   00000000c023b300  00000000f000017c  00000000f0000174  00000000000007ab
20-23   000000000001ea80  0000000000000001  0000000000000001  000000000001eac0
24-27   00000000000007ab  0000000000000800  0000000000000040  ffffffffc020e000
28-31   0000000000000000  00000000c023b300  00000000c023b4c0  00000000c0130370

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  000000000000001f
12-15   0000000000000000  0000000000000000  0000000000103000  0000000000000000
16-19   000000458ce198af  0000000000000000  00000000c01131c0  000000008a79bfa5
20-23   0000000015240000  000000000781ea80  000000000004000a  0000000080000000
24-27   000000000021c000  000000000021c000  00000000ffffffff  00000000ffffffff
28-31   0000000000000000  0000000000000000  0000000000000000  000000000023b300
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x00000000c01131c4
CPU State                    = 0x9e000001



IIA 0xc01131c4 flush_instruction_cache+54
GR2 0xc01131dc flush_all_caches+c




-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  00000045997a6613  0000000000000000  0000000000000000
04-07   0000000000000547  fffffff0f0400008  00000000000000fa  fffffff0f0002f68
08-11   0000000000000000  0000000000000000  000000000000000a  fffffff0f0001608
12-15   00000000000000f2  0000000000000001  0000000000000001  00000000000000f3
16-19   0000000002020202  0000000000000002  fffffff0f000016c  fffffff0f04120d1
20-23   0000000000000000  fffffff0f04120d0  0000000000000000  0000000000000000
24-27   00000000000000f1  fffffff0f04120c0  fffffff0f0400880  fffffff0f0412000
28-31   0000000000000000  fffffff0f0409f30  fffffff0f0409e80  fffffffffffffff0

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   000000007fffffff  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0007ffff0007ffde  0007ffff0007ffde  0000000000000000  000000000000001e
12-15   0007ffff0007ff5e  0007ffff0007ff5e  000000f0f0003800  0000000000000000
16-19   00000045998109b2  00000000ffffffff  0000000000000794  0000000002e008a2
20-23   000000009a07c3c1  c00000007c1f00b8  0000000008000008  0000000000000000
24-27   ffffffffffffffde  ffffffffffffffde  ffffffffffffffff  ffffffffffffffde
28-31   ffffffffffffffde  ffffffffffffffde  ffffffffffffffde  ffffffffffffffde
Space Registers 0 - 7

00-03   ffffffff          ffffffff          ffffffff          ffffffff
04-07   ffffffff          ffffffff          ffffffff          ffffffff

IIA Space                    = 0x00000000ffffffff
IIA Offset                   = 0x0000000000000798
CPU State                    = 0x9e000001
