Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA14214
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 16:04:54 -0600
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA03558
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 16:05:51 -0600 (MDT)
Sender: frowand@cup.hp.com
Message-ID: <380F8E39.F41B5D56@hp.com>
Date: Thu, 21 Oct 1999 15:05:45 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Paul Bame <bame@debian.fc.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
References: <199910212057.OAA19923@debian.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> This is long.  Thanks to Alex Williamson for this -
> 
> The short answer is once control is apparently transferred to the
> kernel, the system dies hard.  Someone who can read PIM dumps
> might deduce more from this log.
> 
>         -Paul Bame


Look in the IO ARS, under PDC_PIM() for info on decoding this stuff.
I'll decode a couple of key words, but I have to run to a meeting.


> Main Menu: Enter command > ser pim
> 
> PROCESSOR PIM INFORMATION
> 
> - -----------------  Processor 0 HPMC Information ------------------
> 
> Timestamp =
>   Thu Oct  21 20:18:08 GMT 1999    (19:99:10:21:20:18:08)
> 
> HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc
> 
> General Registers 0 - 31
> 00-03   0000000000000000  ffffffffffffffff  00000000000100c4  0000000000504000
> 04-07   0000000000504010  0000000000504000  0000000000000048  00000000f0002f88
> 08-11   0050427700000002  000000000000004d  000000000012c320  000000000000000a
> 12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
> 16-19   000000f0f00008a4  000000f0f0000160  000000f0f0000158  fffffffffff80810
> 20-23   0000000003000000  0000000000001000  0000000000000000  00000000000c0000
> 24-27   0000000000000000  0000000000000001  00000000c0159610  ffffffffc00a8000
> 28-31   ffffffffffffffff  00000000000ac948  00000000000ac400  0200000000000204
> 
> <Press any key to continue (q to quit)>
> 
> Control Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11   0000000000000000  0000000000000000  0000000000000000  000000000000003c
> 12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 16-19   0000001d9f33c26d  0000000000000000  0000000000010184  000000000e601181
> 20-23   00000000a627ffff  c0000000e0380810  0000000000000009  0000000080000000
> 24-27   00000000fdffffff  00000000ffffffff  0000000000000002  0000000008000009
> 28-31   00000000fdffffff  00000000ffffffff  00000000fdffffff  00000000fdffffff
> Space Registers 0 - 7
> 
> 00-03   00000000          00000000          00000000          00000000
> 04-07   00000000          00000000          00000000          00000000
> 
> <Press any key to continue (q to quit)>
> 

This should be the address of the instruction that caused the HPMC.  Use adb
against the kernel to see what this instruction is.  Then you'll probably
need to use the contents of the general registers above to figure out what
was going on:
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000010188

Bus check:
> Check Type                   = 0x20000000


> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000

Read timeout:
> Bus Check                    = 0x0030103b

> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000

Someone needs to look at an address map to see what address was being accessed:
> System Responder Address     = 0x000000fffff80810

cpu 0 is the requestor:
> System Requestor Address     = 0x000000fffffa0000



Off to the meeting...

-Frank Rowand
