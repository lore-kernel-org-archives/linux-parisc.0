Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA16760
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Nov 1999 21:03:25 -0700
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.1])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id XAA06046
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Nov 1999 23:14:33 -0500
Date: Tue, 2 Nov 1999 23:14:33 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <199911030250.TAA16563@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Recent changes
List-ID: <linux-parisc.vger.kernel.org>


Matt Wilcox committed some code that I know he's unable to test, so I'm
mailing the bug report here.

The first is that building the kernel kernel will result in:

ld: Unsatisfied symbols:
   hpux_brk (code)

so I just commented out the only reference to it, and now I end up with:

(start_code) 00001000
(end_data) 40008000
(start_stack) 20000028
(brk) 40017000

PSW  : 0004f80b  GR 1 : 40006928  GR 2 : 00016f5f  GR 3 : 40007128  
GR 4 : 40016314  GR 5 : 40006928  GR 6 : 00002001  GR 7 : 00000020  
GR 8 : 40001511  GR 9 : 00000000  GR10 : 00000050  GR11 : bc0fd569  
GR12 : 000043ff  GR13 : 00004400  GR14 : 00004800  GR15 : 43f02aa9  
GR16 : 00004000  GR17 : 00000000  GR18 : 00000c00  GR19 : 00000001  
GR20 : 00000001  GR21 : 40019000  GR22 : ffffff05  GR23 : 00000000  
GR24 : 00000000  GR25 : ffffffff  GR26 : ffffffff  GR27 : 40007128  
GR28 : 4001830c  GR29 : 40018ffc  GR30 : 20000780  GR31 : 00033323  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  
IAOQ : 00016f7b 00016f7f

bad address 40018ffc (code 15)
Kernel panic: bad address

In swapper task - not syncing

And that is it.

- Alex

ps.  All the puffins will be out of town in Montreal on Wednesday to
attend/speak at a conference and see live puffins.

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group
