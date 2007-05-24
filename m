From: "Vesa Ruokonen" <vesa.ruokonen@gmail.com>
Subject: [parisc-linux] 2.6.20 SMP crash
Date: Thu, 24 May 2007 19:02:19 +0300
Message-ID: <92dc10290705240902y370a802ch3f226290fb026b91__16241.8945845731$1416624363$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

Below are console messages from kernel crash with 2.6.20.1
(Gentoo) with SMP. The box is 4-way K380.
Older 2.6.18-rc5-pa3 (git) hasn't crashed.

...
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: <0>------------[ cut here ]------------
Badness at arch/parisc/kernel/smp.c:322
Backtrace:
 [<10252e8c>] report_bug+0x74/0xbc
 [<101084a8>] handle_break+0x38/0xe4
 [<10108a3c>] handle_interruption+0x22c/0x5c0
 [<1010c090>] intr_check_sig+0x0/0x34
 [<1012e748>] vprintk+0x380/0x3c8
 [<1019e8b8>] mntput_no_expire+0x2c/0xfc
 [<10136280>] on_each_cpu+0x1c/0x50
 [<10105d8c>] free_initmem+0x4c/0x208
 [<1010553c>] init+0xb8/0x18c
 [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24

348k freed
INIT: version 2.86 booting


<<stuck here for couple minutes>>


BUG: soft lockup detected on CPU#3!
Backtrace:
 [<10155b94>] softlockup_tick+0xf8/0x124
 [<1013b918>] update_process_times+0x54/0x90
 [<10108f08>] timer_interrupt+0x138/0x1a0
 [<10157b68>] handle_specific_irq_timer+0x60/0x98
 [<10109888>] do_cpu_irq_mask+0x1c0/0x24c
 [<1010c068>] intr_return+0x0/0x1c

      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
bash (pid 1252): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 104a7810 10111798 dc4c8108
r04-07  fb2f5ec0 129355c4 129353c8 fb2f5ee4
r08-11  00000000 00000000 129355c4 dc4c8108
r12-15  00000019 fb2f5ab8 00000000 00000001
r16-19  129353c8 fb2f59ec 00000001 00000001
r20-23  00000019 fffffff8 df8d7494 dc4c8088
r24-27  fb2f5ee4 dc4c8088 fb2f5ee4 1046e010
r28-31  00000019 00000080 dc4c8280 409def8f
sr00-03  00000000 00000000 00000000 00000010
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1013fe74 1013fe78
 IIR: 0f54d280    ISR: 00000010  IOR: fb2f5ee4
 CPU:        3   CR30: dc4c8000 CR31: 11111111
 ORIG_R28: 00000000
 IAOQ[0]: copy_siginfo_to_user+0x54/0x458
 IAOQ[1]: copy_siginfo_to_user+0x58/0x458
 RP(r2): setup_rt_frame+0xb8/0x38c
Backtrace:
 [<101083a8>] die_if_kernel+0x130/0x194
 [<10108c28>] handle_interruption+0x418/0x5c0
 [<1010c090>] intr_check_sig+0x0/0x34

-- 
Vesa
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
