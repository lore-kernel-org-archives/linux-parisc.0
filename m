From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Tue, 15 Feb 2005 23:55:39 -0700
Message-ID: <20050216065539.GB5251@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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


Bad night. :^(

Running 2.6.11-rc4-pa0-plus (equivalent to -pa1) on a500-65 (riot).
xfs ran spew for 48h but panic'd when I did a "cvs up -A"
to the CVS source tree on the same file system.

This file system is a raid0 of 6 disks (3 per scsi bus).
Then default "mkfs -t xfs /dev/md0".

grant


Backtrace:
[ argh...no backtrace got dumped ]

Kernel Fault: Code=15 regs=0000000032860d20 (Addr=00000027452d93e1)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000100001111 Not tainted
r00-03  0000000000000000 0000002647c44fe0 00000000a7f9a6c0 00000000f9aa3000
r04-07  0000000000000001 0000000000242000 00000000732bcab8 0000000032860ae8
r08-11  0000000000000001 00000000732bcab8 0000000000011c1b 0000000000000010
r12-15  0000000000000001 00000000f9aa3288 00000000f9aa3150 0000000000000001
r16-19  00000000328607b8 00000000cd3bb090 0000000032860560 00000000fd694400


Press Q/q to quit, Enter to continue: 
r20-23  00000000002a2a40 000000000000055c 0000000058414749 00000000cb631400
r24-27  00000027452d93e0 0000000000000001 0000000000242000 0000000000242000
r28-31  00000000cb631400 0000000032860cf0 0000000032860d20 0000000000000000
sr0-3   000000000a95f800 000000000a95f800 0000000000000000 000000000a95e800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000002a1574 00000000002a1578
 IIR: 0f021014    ISR: 0000000000000000  IOR: 00000027452d93e1
 CPU:        0   CR30: 0000000032860000 CR31: 0000000010508000
 ORIG_R28: 0000000000242000
 IAOQ[0]: xfs_ialloc_read_agi+0x164/0x188 [xfs]
 IAOQ[1]: xfs_ialloc_read_agi+0x168/0x188 [xfs]
 RP(r2): 0xa7f9a6c0
Kernel panic - not syncing: Kernel Fault
 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
