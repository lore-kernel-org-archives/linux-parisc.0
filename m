Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2851C483E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Nov 2003 07:50:27 -0700 (MST)
Date: Mon, 3 Nov 2003 15:50:22 +0100
Message-ID: <3F969FFE000062C9@ocpmta2.freegates.net>
In-Reply-To: <20031022063943.GA30984@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] SuckyIO still doesn't work
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Grant,


> Current patch on ftp.p-l.o:patches/diff-2.6.0-suckyio-serial-03

I apply your patch against 2.6.0-test9-pa4 but not yet boot on the b2k  :(
I stopped at another place now and not any more on a div by zero:
[...]
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
superio_probe(0000:00:0e.0) ven 0x100b dev 0x2 sv 0x0 sd 0x0 class 0x1018a
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 64) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
superio_probe: IDE 87415
superio_probe(0000:00:0e.1) ven 0x100b dev 0xe sv 0x0 sd 0x0 class 0x68000
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Registering serial 0
Registering serial 1
superio_probe(0000:00:0e.2) ven 0x100b dev 0x12 sv 0x0 sd 0x0 class 0xc0310
superio_probe: USB OHCI controller
Soft power switch enabled, polling @ 0xf0400804.
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq = 99) is a 16550A
flags= 0 (uart_get_baud_rate() ).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
[...]
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 504k freed
      _______________________________ 
     < Your System ate a SPARC! Gah! >
      ------------------------------- 
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 1): Breakpoint (code 0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 103eb800 101f83d8 0000001c
r04-07  00000063 10216a60 00000000 1034e4a4
r08-11  00000002 0098963a 4df21500 10461844
r12-15  3b9aca00 1038f810 10461810 f0400004
r16-19  f00008c4 f000017c f0000174 00000000
r20-23  00000003 00000000 101f8380 1034e4a4
r24-27  000000d3 00000003 10396d28 10378010
r28-31  00000060 1fe5f940 10718580 10107014
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 103ebdbc 103ebdc0
 IIR: 00000000    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 10718000 CR31: 103d1000
 ORIG_R28: 1fe9a48c
 IAOQ[0]: superio_init+0x0/0x410
 IAOQ[1]: superio_init+0x4/0x410
 RP(r2): superio_enable_irq+0x58/0x84
Kernel panic: Attempted to kill init!
 
But I never encounter such do_page_fault().

Thanks in advance for additional help,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
