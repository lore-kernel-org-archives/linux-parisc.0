From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.11-rc3-pa3 (I think) do_wp_page
Date: Tue, 15 Feb 2005 23:51:44 -0700
Message-ID: <20050216065144.GA5251@colo.lackof.org>
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


*sigh*
gsyprf11 just panic'd (Data Page Fault) with 2.6.11-rc3-pa3 (I think).
I don't know if anything special was running - just gcc builds?

grant


Backtrace:
 [<000000001019b6c4>] do_wp_page+0x434/0xd88
 [<000000001019d99c>] handle_mm_fault+0x34c/0x9c0
 [<000000001011314c>] do_page_fault+0x39c/0x458
 [<0000000010115050>] handle_interruption+0x328/0x790
 [<00000000101070a4>] intr_check_sig+0x0/0xc


Kernel Fault: Code=15 regs=0000001108ddc570 (Addr=0000001110000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000000000000 000000001019b6c4 0000001100380fc8
r04-07  000000001053e620 000000110dafc000 00000000005e30a4 00000001aff7b760
r08-11  00000011002ff720 00000001ad063ac0 00000010fffffb25 0000001104d07f18
r12-15  00000011021ac008 00000001ad063b38 00000000000d8ac8 00000000000d8708
r16-19  00000011034dbb38 0000000000000000 0000000000000000 005e818000000006
r20-23  00000007005e8498 0000000300000004 005e850800000005 00000000105cd098
r24-27  000000000800000f 0000001110000000 000000110dafd000 000000001053e620
r28-31  00000011002ff720 0000001108ddc540 0000001108ddc570 00000000404620db

sr0-3   00000000059df800 00000000059e3800 0000000000000000 00000000059df800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101012c4 00000000101012c8
 IIR: 0f2010d3    ISR: 0000000000000000  IOR: 0000001110000000
 CPU:        0   CR30: 0000001108ddc000 CR31: 0000000010508000
 ORIG_R28: 0000000000000000
 IAOQ[0]: copy_user_page_asm+0xa4/0xb0
 IAOQ[1]: copy_user_page_asm+0xa8/0xb0
 RP(r2): do_wp_page+0x434/0xd88
Kernel panic - not syncing: Kernel Fault

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
