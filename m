From: Jochen Friedrich <jochen@scram.de>
Subject: [parisc-linux] 53c700.c problems with tags?
Date: Tue, 31 Aug 2004 12:39:12 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0408311232240.2373@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

when doing heavy io on my 715/64, i sometimes get the following panic:

scsi0 (0:0) Target is suffering from tag starvation.

scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 f2 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x00 00 00 00 00 00
scsi0: Bus Reset detected, executing command 00000000, slot 00000000, dsp
00358] failing command because of reset, slot 00008788, cmnd 103c3000
 failing command because of reset, slot 000088bc, cmnd 103c3200
 failing command because of reset, slot 000089f0, cmnd 103c4800
 failing command because of reset, slot 00008d8c, cmnd 103c3a00
 failing command because of reset, slot 00008ff4, cmnd 103c3a00
 failing command because of reset, slot 0000925c, cmnd 103c3400
 failing command because of reset, slot 00009390, cmnd 103c4c00
 failing command because of reset, slot 00009994, cmnd 103c4e00
 failing command because of reset, slot 00009bfc, cmnd 100f8c00
 failing command because of reset, slot 00009f98, cmnd 103c4600
 failing command because of reset, slot 0000a334, cmnd 103c4200
 failing command because of reset, slot 0000a468, cmnd 103c4a00
 failing command because of reset, slot 0000a6d0, cmnd 103c3800
 failing command because of reset, slot 0000a938, cmnd 103c4400
 failing command because of reset, slot 0000aa6c, cmnd 100f8e00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 4a 00 00 08 00
scsi0: (0:0) Synchronous at offset 8, period 100ns
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 9a 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 65 ca 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 01 4c c0 00 00 10 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 ca 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 7a 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 3a 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 8a 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 aa 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 e2 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 78 e2 00 00 20 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 01 4c 98 00 00 20 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 79 0a 00 00 08 00
scsi0 (0:0) New error handler wants to abort command
        0x28 00 00 18 66 2a 00 00 08 00
scsi0 (0:0) New error handler wants device reset
        0x28 00 00 18 66 f2 00 00 08 00
scsi0 (0:0) New error handler wants BUS reset, cmd 103c3a00
        0x28 00 00 18 66 f2 00 00 08 00
scsi0: Bus Reset detected, executing command 00000000, slot 00000000, dsp
00358]scsi0: (0:0) Synchronous at offset 8, period 100ns
SLOTS FULL, but count is 8, should be 64

Stack Dump:
 10370980:  0004ff0e 101ba834 10370900 10264aa0
 10370970:  00000000 101ba548 103b8a00 103b8a68
 10370960:  00000010 00000020 1010e2c8 0000001f
 10370950:  90080000 ffffffba 00000000 00000002
 10370940:  f000b858 f0000704 00000000 00000001
 10370930:  102f6660 100fa474 100fa49c 1027637c

Kernel addresses on the stack:
 [<101ba834>]  [<101ba548>]  [<1010e2c8>]  [<101b319c>]
 [<101ab4a0>]  [<101ac228>]  [<101b3b80>]  [<101204ac>]
 [<101b319c>]  [<1013df08>]  [<101bb920>]  [<10118604>]
 [<1013f3d4>]  [<101ac228>]  [<101abf70>]  [<1014e684>]
 [<101ba834>]  [<101205fc>]  [<101204ac>]  [<101b30e4>]
 [<101201f4>]  [<101207c4>]  [<10106c4c>]  [<10106cf4>]
 [<101352bc>]  [<101628d4>]  [<101355b8>]  [<10162b5c>]
 [<10121580>]  [<10162b5c>]  [<1012071c>]  [<1012150c>]
 [<10129124>]  [<1011f4bc>]

Kernel Fault: Code=26 regs=10370980 (Addr=00000114)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 10264810 101ba548 101abdb4
r04-07  10375c00 103b9e00 10311810 00000000
r08-11  103b9eb8 1027637c 100fa49c 100fa474
r12-15  102f6660 00000001 00000000 f0000704
r16-19  f000b858 00000002 00000000 00000000
r20-23  00000001 0000001f 102d13a0 102f6010
r24-27  00000001 00000001 00000003 10254010
r28-31  00000000 ffffe531 10370980 1011b954
sr0-3   00000000 00000129 00000000 00000129
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101ba548 101ba54c
 IIR: 6b850228    ISR: 00000000  IOR: 00000114
 CPU:        0   CR30: 10370000 CR31: 102e0000
 ORIG_R28: 00000002

I tried decreasing the number of tags in 53c700.h, but that made the
problem even worse. However, increasing the number to an insane 128 fixed
the problem for me (and the number of active tags really goes up to 80
while doing heavy io and back to 0 at the end, so i don't blame the
devices for the problem). For now i guess there might be something fishy
with the "starving tag" detection and the attempt to "fix" the situation.

Kernel: 2.4.26-pa7, but any older kernel (tested since 2.4.21) shows the
exact same behaviour.

Thanks,
Jochen
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
