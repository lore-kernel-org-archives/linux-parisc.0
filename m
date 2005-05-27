From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] sara make panicing 2.6.12-rc4-pa5 running on c110
Date: Fri, 27 May 2005 19:56:46 +0000
Message-ID: <42977B7E.4010307@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
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

Hello all,

This week I followed a cursus on security admin and would like to test a vulnerabilty scanner like sara against my c110 running a 
2.6.12-rc4-pa5...

Unfortunately, it panics:
device eth0 entered promiscuous mode
eth0: command unit timed out, status resetting.


Backtrace:
  [<10144fb0>] disable_irq_nosync+0x58/0x5c
  [<10144fd4>] disable_irq+0x20/0x38
  [<1026c9fc>] init_i596_mem+0x40/0x71c
  [<1026ee38>] i596_start_xmit+0x200/0x27c
  [<102c8cac>] qdisc_restart+0x74/0x1f8
  [<102bc904>] dev_queue_xmit+0x1a4/0x224
  [<102d40d4>] ip_finish_output+0xc4/0x240
  [<102d616c>] ip_push_pending_frames+0x2dc/0x45c
  [<102d6654>] ip_send_reply+0x1f4/0x254
  [<102eb24c>] tcp_v4_send_reset+0xfc/0x15c
  [<102ec6b0>] tcp_v4_rcv+0x320/0x7ac
  [<102d11d0>] ip_local_deliver+0xb8/0x1b8
  [<102d1670>] ip_rcv+0x3a0/0x4a8
  [<102bce40>] netif_receive_skb+0x108/0x1f4
  [<102bcfd0>] process_backlog+0xa4/0x18c
  [<102bd158>] net_rx_action+0xa0/0x16c


High Priority Machine Check (HPMC): Code=1 regs=103b1080 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001110 Not tainted
r00-03  00000000 10402000 102187d4 0000000f
r04-07  10be3b00 2ffc7000 2ffc7320 2ffbb400
r08-11  2ffbb400 0000003c 103cf010 103cf010
r12-15  00000000 0000004d 00000001 00000000
r16-19  10404140 f00000ac f00000a4 ffd00004
r20-23  a0400000 10402240 102187ac 00000000
r24-27  00000020 10be3b3c 00000012 103ae010
r28-31  00000017 00000000 10404c00 10144fb0
sr0-3   00000000 00000000 00000000 00000f90
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102187e8 102187ec
  IIR: d680141f    ISR: 00000000  IOR: 5fbc1a0c
  CPU:        0   CR30: 10404000 CR31: 10408000
  ORIG_R28: 00000000
  IAOQ[0]: gsc_asic_disable_irq+0x3c/0x50
  IAOQ[1]: gsc_asic_disable_irq+0x40/0x50
  RP(r2): gsc_asic_disable_irq+0x28/0x50
Kernel panic - not syncing: High Priority Machine Check (HPMC)

It seems to be du to the reset but not sure.

Any idea?

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
