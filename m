From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] latest palinux crash
Date: Sat, 25 Jun 2005 16:09:05 +0100
Message-ID: <20050625150905.GC5200@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


Kernel Fault: Code=26 regs=0000000047c34720 (Addr=0000000000000001)
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000011001111111000001111 Not tainted
r00-03  0000000000000000 00000000105456f0 00000000101a3494 0000000000000001
r04-07  00000000104b9200 00000000c55ec518 000000006eb29a2d 00000000bd27d428
r08-11  0000000047c344d0 00000000141cc568 000000000000000a 0000000000000000
r12-15  00000000204f0018 000000000000004e 0000000000000001 0000000000000000
r16-19  0000000000000801 000000000004dee8 000000000004dee8 0000000000000000
r20-23  000000000007ffff 00001389e3fff288 00000000140ce5c0 000020dd6eb29a2d
r24-27  0000000047c344c0 0000000047c344d0 00000000bd27d428 00000000104b9200
r28-31  0000000000000000 0000000047c34630 0000000047c34720 00000000405d58c3
sr0-3   0000000000090800 0000000000090800 0000000000000000 0000000000090800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101b0b70 00000000101b0b58
 IIR: 0c6010d3    ISR: 0000000000000000  IOR: 0000000000000001
 CPU:        0   CR30: 0000000047c34000 CR31: 0000000010480000
 ORIG_R28: 0000000000000001
 IAOQ[0]: __d_lookup+0xc8/0x1a8
 IAOQ[1]: __d_lookup+0xb0/0x1a8
 RP(r2): do_lookup+0x3c/0xf0
Kernel panic: Kernel Fault


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
