From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] kernel BUG at mm/slab.c:1889
Date: Wed, 6 Oct 2004 13:06:45 +0000
Message-ID: <4161756A00000986@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
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

Hello pa-*,

Building latest glibc cvs over an nfs the system halted with following ms=
g:

kernel BUG at mm/slab.c:1889!
Backtrace:
 [<0000000010114748>] dump_stack+0x20/0x38
 [<000000001017ea80>] cache_free_debugcheck+0x3d0/0x438
 [<000000001017fdb0>] kmem_cache_free+0x50/0x130
 [<00000000101c2f24>] d_callback+0x64/0x80
 [<000000001016048c>] rcu_do_batch+0x54/0xf8
 [<0000000010160774>] __rcu_process_callbacks+0x94/0x148
 [<0000000010160870>] rcu_process_callbacks+0x48/0x98
 [<000000001014f31c>] tasklet_action+0xec/0x140
 [<000000001014ee14>] __do_softirq+0x7c/0x128
 [<000000001010f920>] __lock_text_end+0x68/0x78
 [<0000000010116634>] do_irq+0x14c/0x1a0
 [<0000000010116768>] do_cpu_irq_mask+0xe0/0x150
 [<0000000010107074>] intr_return+0x0/0x14
 [<000000001010d18c>] __udivdi3+0x1c/0x30
 [<00000000101423e4>] effective_prio+0x8c/0xc0
 [<00000000101bbfd0>] locate_fd+0x130/0x1d0

Here are some additional info:
kernel 2.6.9-rc3-pa3 64bit +DEBUG_SLAB (lastest cvs 2004-10-05) (+I K sup=
erio
patch)
# hppa64-linux-a -v
hppa64-linux-addr2line  hppa64-linux-ar         hppa64-linux-as        

# hppa64-linux-as -v
GNU assembler version 2.14.90 (hppa64-linux) using BFD version 2.14.90 20=
040204

System model: b2000 

mmm 32bit (same kernel src) just panic (more quickly then 64bit :( ):

 [<10348c1c>] xprt_transmit+0xec/0x518
 [<10346898>] call_transmit+0x5c/0xbc
 [<1034abc8>] __rpc_execute+0x344/0x444


Kernel Fault: Code=3D15 regs=3D1c050ac0 (Addr=3D593f3c9e)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 103e7094 1014c7b0 00000000
r04-07  593f3c9e 00000800 00000000 000007ff
r08-11  593f3c9a 1050eb00 10362000 1b4b5298
r12-15  1c593830 00000000 000005dc 1ccb1bf0
r16-19  00000014 00000000 000005dc 00052c00
r20-23  00000001 1073109c 00000003 102e6958
r24-27  593f3c9a 593f3c9a 1050eb00 103c5010
r28-31  00000800 17013b6c 1c050ac0 1147e000
sr0-3   00000000 00000000 00000000 000008ca
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1014c7c4 1014c7c8
 IIR: 0c830013    ISR: 00000000  IOR: 593f3c9e
 CPU:        0   CR30: 1c050000 CR31: 10494000
 ORIG_R28: 00000000
 IAOQ[0]: check_poison_obj+0x54/0x230
 IAOQ[1]: check_poison_obj+0x58/0x230
 RP(r2): check_poison_obj+0x40/0x230
Kernel panic - not syncing: Kernel Fault

# gcc -v
gcc version 3.3.4 (Debian 1:3.3.4-13)
# as -v
GNU assembler version 2.15 (hppa-linux) using BFD version 2.15

This last one seems much more related to nfs?

Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
..
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
