From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG dp_write() data page fault
Date: Mon, 21 Mar 2005 23:37:43 -0700
Message-ID: <20050322063743.GA3867@colo.lackof.org>
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

my a500 (gsyprf11) crashed again with do_wp_page() calling
copy_user_page_asm() with bad parameters. Console output appended.

grant

Backtrace:
 [<000000001019b824>] do_wp_page+0x434/0xd88
 [<000000001019dafc>] handle_mm_fault+0x34c/0x9c0
 [<000000001011314c] do_page_fault+0x39c/0x458
 [<0000000010115050>] handle_interruption+0x328/0x790
 [<00000000101070a4>] intr_check_sig+0x0/0xc


Press Q/q to quit, Enter to continue: 


Kernel Fault: Code=15 regs=00000001a993c570 (Addr=0000000210000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000000000000 000000001019b824 00000001137fffc8
r04-07  0000000010542540 00000001d44ec000 00000000000d0bac 00000001db141760
r08-11  0000000112af13a0 00000000fd869a80 00000001fffffb25 000000015981e680
r12-15  00000001a9730000 00000000fd869af8 00000000001cbfa8 00000000001cccc8
r16-19  00000000f2b153a0 0000000000000000 0000000000000000 0000000000000000
r20-23  0000000000000000 0000000000000000 0000000000000000 00000000105d1098
r24-27  000000000800000f 0000000210000000 00000001d44ed000 0000000010542540
r28-31  0000000112af13a0 00000001a993c540 00000001a993c570 00000000400d61d7
sr0-3   000000000252c800 0000000000000000 0000000000000000 000000000252c800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101012c0 00000000101012c4
 IIR: 0f2010d3    ISR: 0000000000000000  IOR: 0000000210000000
 CPU:        0   CR30: 00000001a993c000 CR31: 000000001050c000


Press Q/q to quit, Enter to continue: 
 ORIG_R28: 0000000000000000
 IAOQ[0]: copy_user_page_asm+0xa0/0xac
 IAOQ[1]: copy_user_page_asm+0xa4/0xac
 RP(r2): do_wp_page+0x434/0xd88
Kernel panic - not syncing: Kernel Fault


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
