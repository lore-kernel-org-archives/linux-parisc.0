From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.9-bk6-pa4: serial console fixed for b180, n4k
Date: Wed, 27 Oct 2004 12:18:38 +0200
Message-ID: <41617480000075D0@mail-4-bnl.tiscali.it>
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

Hello pa*,

The serial console loop pb seems to be fixed for the 2 model b180 and n4k=
:
b180:
[...]
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 69 @ 8:16:7
serio: GSC PS/2 mouse port at 0xffd08100 irq 69 @ 8:16:8
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled=

ttyS0 at MMIO 0xffd05800 (irq =3D 90) is a 16550A
ttyS1 at MMIO 0xfff83800 (irq =3D 106) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
PPP generic driver version 2.4.2
[...]

n4k: (handy notes)
[...]
Serial: 8250/16550 driver $Revision: 1.90...
ttyS0 at MMIO 0xffffffff80000000 (irq=3D132) is a 16550A
ttyS0 at MMIO 0xffffffff80000008 (irq=3D132) is a 16450
ttyS0 at MMIO 0xffffffff80000010 (irq=3D132) is a 16550A
ttyS0 at MMIO 0xffffffff80000038 (irq=3D132) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
[...]

Thanks for all,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
