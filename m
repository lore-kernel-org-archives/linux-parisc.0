From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] serial console brokenness
Date: Wed, 27 Oct 2004 08:16:58 +0200
Message-ID: <200410270816.58792.deller@gmx.de>
References: <20041026185052.6328B494733@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: James Bottomley <jejb@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041026185052.6328B494733@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

serial console is sadly still broken for me...

Linux version 2.6.9-bk6-pa4 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #98 Wed Oct 27 08:05:48 CEST 2004                         
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
....
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
Serial: device 0xf0105000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
Serial: device 0xf0202000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
Backtrace:
 [<1024b53c>] serial8250_get_divisor+0x4c/0x58
 [<1024b5ec>] serial8250_set_termios+0xa4/0x36c
 [<1045df48>] uart_set_options+0xe8/0x148
 [<1045e1c8>] serial8250_console_setup+0xb4/0xc8
 [<1012b2e0>] register_console+0x1b0/0x224
 [<1045e1f4>] serial8250_console_init+0x18/0x48
 [<1045e4b4>] serial8250_pci_init+0x20/0x30
 [<1044d4e4>] do_initcalls+0x8c/0x138
 [<10103d70>] init+0x38/0x104
 [<1010fc5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=13 regs=100ac400 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 ffffffff 1024b53c 104d5e98
r04-07  00000000 100ac2c8 00000013 103ca010
r08-11  1049d318 1034c800 00000000 1034c800
r12-15  1036f800 1034c800 104a7810 103cb010
r16-19  f000b858 00000002 00000000 00009600
r20-23  00000cb0 104d5e98 00000000 00000000
r24-27  00000000 00000000 00000000 103b1010
r28-31  00000000 1f972880 100ac400 10246324
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1020578c 10205790
 IIR: b3202000    ISR: 00000000  IOR: 10205798
 CPU:        0   CR30: 100ac000 CR31: 10444000
 ORIG_R28: 100ac540
 IAOQ[0]: $$divU+0xc/0x210
 IAOQ[1]: $$divU+0x10/0x210
 RP(r2): serial8250_get_divisor+0x4c/0x58
Kernel panic - not syncing: Kernel Fault

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
