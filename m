Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAAE0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 00:57:04 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Dodgy SCSI in L2000 
Date: Tue, 7 May 2002 19:00:40 +1200
Message-ID: <000201c1f594$e5bc6aa0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20020507062119.F0744482A@dsl2.external.hp.com>
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

> Which kernel version?
Ooops, forgot to include this, its:

2.4.18-pa24, and
2.4.18-pa23 
 
> This suggests something is wrong with that device.
> Are all RAID0 disks internal? Or connected to external box?
> I see further down they seem to be working fine individually.

All disks are internal disks in the hotswap cage thing, connected to the
core I/O board (? not sure if that's what its called , it's a big board
with 3 SCSI cables on it and the ethernet jack/external SCSI). All the
disks are plugged into this, two disks per cable, and the DVD on its own
cable.

> Can you post lspci -v output from you L2000?
> I just want to verify the built-in SCSI chips are the
> same as on my A500: sym53c896.

Sure:

hypo:~# lspci -v
00:00.0 Ethernet controller: Digital Equipment Corporation DECchip
21142/43 (rev 41)
        Subsystem: Hewlett-Packard Company: Unknown device 104f
        Flags: bus master, medium devsel, latency 128, IRQ 128
        I/O ports at 0080 [size=128]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=1K]
        Expansion ROM at fffff800 [size=256K]

00:01.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c896 (rev 05)
        Flags: bus master, medium devsel, latency 0, IRQ 129
        I/O ports at 0100 [size=256]
        Memory at fffffff0 (64-bit, non-prefetchable) [size=1K]
        Memory at fffffff0 (64-bit, non-prefetchable) [size=8K]
        Capabilities: [40] Power Management version 2

00:01.1 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c896 (rev 05)
        Flags: bus master, medium devsel, latency 0, IRQ 130
        I/O ports at 0200 [size=256]
        Memory at fffffff0 (64-bit, non-prefetchable) [size=1K]
        Memory at fffffff0 (64-bit, non-prefetchable) [size=8K]
        Capabilities: [40] Power Management version 2

00:02.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 14)
        Flags: bus master, medium devsel, latency 0, IRQ 130
        I/O ports at 0300 [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]

00:02.1 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 14)
        Flags: bus master, medium devsel, latency 0, IRQ 131
        I/O ports at 0400 [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]

00:04.0 Serial controller: Hewlett-Packard Company: Unknown device 1048
(rev 02) (prog-if 02 [16550])
        Subsystem: Hewlett-Packard Company: Unknown device 1049
        Flags: bus master, medium devsel, latency 0, IRQ 132
        BIST result: 00
        Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 0040 [size=64]

00:05.0 Serial controller: Hewlett-Packard Company: Unknown device 1048
(rev 02) (prog-if 02 [16550])
        Subsystem: Hewlett-Packard Company: Unknown device 104a
        Flags: medium devsel, IRQ 133
        BIST result: 00
        Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 0500 [size=64]

08:02.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI
(rev 05)
        Subsystem: QLogic Corp.: Unknown device 0000
        Flags: medium devsel, IRQ 194
        I/O ports at 10000 [disabled] [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [disabled]
[size=4K]
        Expansion ROM at fffff800 [size=64K]

08:03.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI
(rev 05)
        Subsystem: QLogic Corp.: Unknown device 0000
        Flags: medium devsel, IRQ 195
        I/O ports at 10100 [disabled] [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [disabled]
[size=4K]
        Expansion ROM at fffff800 [size=64K]

20:00.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 04)
        Flags: bus master, medium devsel, latency 0, IRQ 384
        I/O ports at 40000 [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=256]
        Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
        Expansion ROM at fffff800 [size=64K]

The Qlogic cards I put in as I was going to move the scsi drives onto
them, but then I found out that the Qlogic ISP driver doesn't compile
for PA-RISC (doh!). The problem happens with or without the Qlogic
boards in there.

> Can you try running two different dbench instances at the some time on
> two different disks?

On three disks (sdb/sdc/sdd):

hypo:/sdb# dbench 10
10 clients started
..........

hypo:/sdc# dbench 10
10 clients started
..............

hypo:/sdd# dbench 10
10 clients started
........................................................................
................................................

None of them finish, and I get a ton of both bus and device
RESETS/ABORTS on the GSP terminal.

On two disks (sdc/sdc):

hypo:/sdb# dbench 10
10 clients started
......................................

hypo:/sdc# dbench 10
10 clients started
...............

Pretty much the same thing, lots of RESETS/ABORTS. I can post these if
needed, but its pretty much just more of what was in my first message.
It all goes pear shaped after this with lots of I/O errors and EXT2
errors, e.g.

EXT2-fs error (device sd(8,17)): ext2_write_inode: unable to read inode
block - inode=1357217, block=2719749
 I/O error: dev 08:11, sector 9961512
 I/O error: dev 08:11, sector 0

I will try again with dbench on just one disk at a time as well.

Thanks, James.
