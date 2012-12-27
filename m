From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Random crashes when calling git
Date: Thu, 27 Dec 2012 10:42:32 +0100
Message-ID: <4882058.deuBGYmI4J@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1780181.FjbiXn3C97"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1780181.FjbiXn3C97
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The CMake test suite includes running some git operations. I see the git test 
failing every some days, e.g. here:

http://open.cdash.org/testDetails.php?test=164070366&build=2734103

The syslog output to this event is this:

Dec 27 05:14:38 voyager kernel: 
Dec 27 05:14:38 voyager kernel: do_page_fault() pid=21120 command='git' type=6 
address=0x00000003
Dec 27 05:14:38 voyager kernel: 
Dec 27 05:14:38 voyager kernel: YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Dec 27 05:14:38 voyager kernel: PSW: 00000000000001000000000000001111 Not 
tainted
Dec 27 05:14:38 voyager kernel: r00-03  0004000f 4083bb40 00000000 00000007
Dec 27 05:14:38 voyager kernel: r04-07  4036e6f8 4103b480 00000000 4083c000
Dec 27 05:14:38 voyager kernel: r08-11  000000fb 4036b624 403709a4 00000000
Dec 27 05:14:38 voyager kernel: r12-15  402ffc60 fffff000 00800000 001397ae
Dec 27 05:14:38 voyager kernel: r16-19  fb217954 fb217964 4083c000 00000000
Dec 27 05:14:38 voyager kernel: r20-23  00000003 00000054 00000049 4103b900
Dec 27 05:14:38 voyager kernel: r24-27  0000000e 00123ec2 00000000 001350fc
Dec 27 05:14:38 voyager kernel: r28-31  00000000 00000002 4083c280 fefefeff
Dec 27 05:14:38 voyager kernel: sr00-03  0000002c 00000000 00000000 0000002c
Dec 27 05:14:38 voyager kernel: sr04-07  0000002c 0000002c 0000002c 0000002c
Dec 27 05:14:38 voyager kernel: 
Dec 27 05:14:38 voyager kernel: VZOUICununcqcqcqcqcqcrmunTDVZOUI
Dec 27 05:14:38 voyager kernel: FPSR: 00000000000000000000000000000000
Dec 27 05:14:38 voyager kernel: FPER1: 00000000
Dec 27 05:14:38 voyager kernel: fr00-03  0000000000000000 0000000000000000 
0000000000000000 0000000000000000
Dec 27 05:14:38 voyager kernel: fr04-07  0000000000000000 7d00000000000000 
00000004e2000000 4097700000000000
Dec 27 05:14:38 voyager kernel: fr08-11  0000000000000000 0000000000000000 
00000004019ff37b 2ecf5011101b4ce8
Dec 27 05:14:38 voyager kernel: fr12-15  4097700000000000 0000000000000000 
41d436ef72347f39 0000000050d30cd9
Dec 27 05:14:38 voyager kernel: fr16-19  0004fe0f105ad000 1012db6800000006 
0000000000000000 0000000000000031
Dec 27 05:14:38 voyager kernel: fr20-23  105ad00010605800 000000061060580a 
0000000000000088 00229d5b00000000
Dec 27 05:14:38 voyager kernel: fr24-27  0000000000000000 00000000a0b5ed8d 
00000000000000ff 0000000000000000
Dec 27 05:14:38 voyager kernel: fr28-31  00000005000203f9 105ad2b810592000 
105ad2a4000000ff 2f8302001011b974
Dec 27 05:14:38 voyager kernel: 
Dec 27 05:14:38 voyager kernel: IASQ: 0000002c 0000002c IAOQ: 00000003 
00000007
Dec 27 05:14:38 voyager kernel: IIR: 43ffff80    ISR: 0000002c  IOR: 4103b504
Dec 27 05:14:38 voyager kernel: CPU:        0   CR30: 2f100000 CR31: ffffffff
Dec 27 05:14:38 voyager kernel: ORIG_R28: 00000000
Dec 27 05:14:38 voyager kernel: IAOQ[0]: 00000003
Dec 27 05:14:38 voyager kernel: IAOQ[1]: 00000007
Dec 27 05:14:38 voyager kernel: RP(r2): 00000000

Kernel is up to date:

Linux voyager 3.7.1 #1 Thu Dec 20 12:22:22 CET 2012 parisc PA8600 (PCX-W+) 
9000/785/C3600 GNU/Linux

Glibc is 2.14.1.

Any ideas?

Eike
--nextPart1780181.FjbiXn3C97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlDcGBAACgkQXKSJPmm5/E6MSgCghP3V2fo46LCjPwiKSpUxAmd+
0aAAn0AGojDYv04ZPO22rYWFw10piq2i
=u6wL
-----END PGP SIGNATURE-----

--nextPart1780181.FjbiXn3C97--

