From: Sven Schnelle <svens@gmx.de>
Subject: [parisc-linux] USB Keyboard problems on C3600
Date: Sat, 06 Aug 2005 11:54:41 +0200
Message-ID: <874qa39yqm.fsf@deprecated.intranet.astaro.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1562706737=="
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

--===============1562706737==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Hi,

i have a MAC USB Keyboard, which won't work with the builtin USB
Controller of the C3600. If i connect it, i get this error messages:

usb 1-2: new full speed USB device using ohci_hcd and address 2
usb 1-2: device descriptor read/64, error -238
usb 1-2: device descriptor read/64, error -238
usb 1-2: new full speed USB device using ohci_hcd and address 3
usb 1-2: device descriptor read/64, error -238
usb 1-2: device descriptor read/64, error -238
usb 1-2: new full speed USB device using ohci_hcd and address 4
usb 1-2: device not accepting address 4, error -238

Now i use a PCI USB Controller, and with this the keyboard is working
fine, the only bad thing is that the Kernel crashes after 1-2h:

Backtrace:
 [<0012a8f4>] ohci_hub_status_data+0xa4/0x1dc [ohci_hcd]
 [<00148d64>] usb_hcd_poll_rh_status+0x4c/0x174 [usbcore]
 [<1013dea8>] run_timer_softirq+0x144/0x240
 [<10137ec4>] __do_softirq+0x140/0x194
 [<101046e0>] do_softirq+0x58/0x64
 [<1010d068>] intr_return+0x0/0x24
 [<10113eb0>] cpu_idle+0x20/0x30
 [<10182744>] dentry_open+0x120/0x380
 [<10113ebc>] cpu_idle+0x2c/0x30
 [<1054c8f4>] start_kernel+0x268/0x2ac


High Priority Machine Check (HPMC): Code=3D1 regs=3D10470080 (Addr=3D000000=
00)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 00126000 0012a8f4 4fe8e0c8
r04-07  4fe8e000 4fe8e000 105404c8 0000000f
r08-11  10540448 1046d010 00200200 1053c010
r12-15  00000000 ffffffff 00000000 f0400004
r16-19  10540140 f000017c f0000174 000000c0
r20-23  00000080 fb006048 0012a850 10eeaa08
r24-27  00000004 105404c8 4fe8e0c8 10464010
r28-31  fb006000 001404e8 105405c0 00148d64
sr0-3   00000000 00000000 00000000 0000e529
sr4-7   00000000 00000000 00000000 00000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000011111
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  4fe8dbc000000000 4fe503d000000020 111a0000f00008c4 000000011058b004
fr08-11  0000000300000000 111a000010eea9f8 105880102bf89280 000f41fa10585810
fr12-15  fdb79f6bbef796fb 6f73ef7effffffff ffffffff692e13f0 ffffffffffffffff
fr16-19  ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
fr20-23  7cdde347ffffffff ffffffffffffffff 02852756aebd0e21 0be451a19999999a
fr24-27  000007b100000000 3fe0000000000000 412e848000000000 00000000002dc6c0
fr28-31  0000000f111e013c 1047e01010182744 105a2a371047e010 111e009c00000000

IASQ: 00000000 00000000 IAOQ: 00126214 00126218
 IIR: 0ea00194    ISR: a627ffec  IOR: 01806048
 CPU:        0   CR30: 10540000 CR31: 10544000
 ORIG_R28: 00000000
 IAOQ[0]: roothub_a+0x8/0x64 [ohci_hcd]
 IAOQ[1]: roothub_a+0xc/0x64 [ohci_hcd]
 RP(r2): ohci_hub_status_data+0xa4/0x1dc [ohci_hcd]
Kernel panic - not syncing: High Priority Machine Check (HPMC)

BTW, the MAC Keyboard has a hub device build in, so i think that maybe a
problem. But the same keyboard works on x86 with 2.6.12 without
Problems. BTW, Kernel Version on the C3600 is 2.6.13-rc3-pa1, but this
happens also with 2.6.12-*

Any hints?

TIA,

Sven.
=2D-=20
Microsoft spelchekar vor sail, worgs grate!!!

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC9Ijj86MdxiXaIbERAqPgAJ4+V2T3jGJhPPxSkWMcd8CKQhPwSACg0tvY
QdMvRIVBW4Ufsy4urfddp1Q=
=/1Dg
-----END PGP SIGNATURE-----
--=-=-=--

--===============1562706737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1562706737==--
