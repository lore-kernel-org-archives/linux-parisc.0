Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from da-horus.directannonces.com (unknown [81.80.128.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7F5A4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 04:32:13 -0700 (MST)
Message-ID: <01b201c3af59$fa8d72f0$65c0a8c0@directannonces.com>
Reply-To: "CrazyCat from CPF" <crazycat@c-p-f.org>
From: "CrazyCat from CPF" <crazycat@c-p-f.org>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 20 Nov 2003 12:32:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Trouble whith hp-pa 712/80
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

Hi there,

I'm trying to install an old hp-pa 712/80.
I've to change the hard disk, so I use a 3.2GB one.

When initialising hard disk, I make these partitions:

Disk Drive: /dev/sda
Size: 3216310272 bytes
Heads: 255   Sectors per Track: 63   Cylinders: 391

    Name        Flags      Part Type  FS Type          [Label]        Size
(MB)
 ---------------------------------------------------------------------------
---
    sda1       Boot         Primary   Linux/PA-RISC boot
32.91
    sda2                    Primary   Linux ext2
49.36
    sda3                    Primary   Linux swap
131.61
    sda5                    Logical   Linux
1497.01
    sda6                    Logical   Linux
1505.23

And after, I try to initialise partition sda5 (sda1 to sda3 are allready
initialised).
And the system blocks when writing superblocks....

What's the trouble? my disk is ok.
I'd tried with smaller sda5, or greater, or sda4 (primary) using the 3GB
staying... allways the same.


CrazyCat from C-P-F.org
