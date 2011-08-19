From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Boot failure with 3.0.3: swapper (pid 0): Protection id trap (code 7)
Date: Fri, 19 Aug 2011 19:58:30 +0200
Message-ID: <201108191958.35802.eike-kernel@sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5216822.ezjL2bRbq4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart5216822.ezjL2bRbq4
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The last kernel I used on this machine was 2.6.38.4. Any hints appreciated.

Greetings,

Eike

Command line for kernel: 'root=3D/dev/sda3 console=3DttyS0=20
palo_kernel=3D2/kernel-3.0.3'                                              =
                                          =20
Selected kernel: /kernel-3.0.3 from partition 2                            =
                                                                           =
                    =20
ELF32 executable                                                           =
                                                                           =
                    =20
Entry 00100100 first 00100000 n 3                                          =
                                                                           =
                    =20
Segment 0 load 00100000 size 4820992 mediaptr 0x1000                       =
                                                                           =
                    =20
Segment 1 load 005c8000 size 116752 mediaptr 0x49a000                      =
                                                                           =
                    =20
Segment 2 load 005e5000 size 27888 mediaptr 0x4b7000                       =
                                                                           =
                    =20
Branching to kernel entry point 0x00100100.  If this is the last           =
                                                                           =
                    =20
message you see, you may need to switch your console.  This is             =
                                                                           =
                    =20
a common symptom -- search the FAQ and mailing list at parisc-linux.org    =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
Linux version 3.0.3 (root@voyager) (gcc version 4.5.3 (Gentoo 4.5.3-r1 p1.0=
,=20
pie-0.4.5) ) #1 Fri Aug 19 14:48:59 CEST 2011                              =
                  =20
unwind_init: start =3D 0x10503000, end =3D 0x1053a640, entries =3D 14180   =
                                                                           =
                          =20
WARNING: Out of order unwind entry! 105041f0 and 10504200                  =
                                                                           =
                    =20
WARNING: Out of order unwind entry! 10504200 and 10504210                  =
                                                                           =
                    =20
WARNING: Out of order unwind entry! 10504cf0 and 10504d00                  =
                                                                           =
                    =20
WARNING: Out of order unwind entry! 10504d00 and 10504d10                  =
                                                                           =
                    =20
=46P[0] enabled: Rev 1 Model 16                                            =
                                                                           =
                      =20
The 32-bit Kernel has started...                                           =
                                                                           =
                    =20
bootconsole [ttyB0] enabled                                                =
                                                                           =
                    =20
Initialized PDC Console for debugging.                                     =
                                                                           =
                    =20
Determining PDC firmware type: System Map.                                 =
                                                                           =
                    =20
model 00005cf0 00000481 00000000 00000002 77486b80 100000f0 00000008 000000=
b2=20
000000b2                                                                   =
                 =20
vers  00000301                                                             =
                                                                           =
                    =20
CPUID vers 17 rev 11 (0x0000022b)                                          =
                                                                           =
                    =20
capabilities 0x3                                                           =
                                                                           =
                    =20
model 9000/785/C3600                                                       =
                                                                           =
                    =20
Total Memory: 512 MB                                                       =
                                                                           =
                    =20
      _______________________________                                      =
                                                                           =
                    =20
     < Your System ate a SPARC! Gah! >                                     =
                                                                           =
                    =20
      -------------------------------                                      =
                                                                           =
                    =20
             \   ^__^                                                      =
                                                                           =
                    =20
                 (__)\       )\/\                                          =
                                                                           =
                    =20
                  U  ||----w |                                             =
                                                                           =
                    =20
                     ||     ||                                             =
                                                                           =
                    =20
swapper (pid 0): Protection id trap (code 7)                               =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                      =
                                                                           =
                    =20
PSW: 00000000000001000000000000001110 Not tainted                          =
                                                                           =
                    =20
r00-03  0004000e 0004000e 105caed8 00000000                                =
                                                                           =
                    =20
r04-07  10544014 10544000 105401cc 1054daf4                                =
                                                                           =
                    =20
r08-11  1054db10 10544020 10576800 000005ec                                =
                                                                           =
                    =20
r12-15  00100000 00020000 10544000 10576af8                                =
                                                                           =
                    =20
r16-19  00020000 105b7000 005ebfff 0000000e                                =
                                                                           =
                    =20
r20-23  00000000 00000000 00000000 00000000                                =
                                                                           =
                    =20
r24-27  00000001 00000000 00000000 10544000                                =
                                                                           =
                    =20
r28-31  00000000 00000000 10540280 00000000                                =
                                                                           =
                    =20
sr00-03  00000000 00000000 00000000 00000000                               =
                                                                           =
                    =20
sr04-07  00000000 00000000 00000000 00000000                               =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
IASQ: 00000000 00000000 IAOQ: 1010047c 10100480                            =
                                                                           =
                    =20
 IIR: 43ffff40    ISR: 00000000  IOR: 00000000                             =
                                                                           =
                    =20
 CPU:        0   CR30: 10540000 CR31: ffffffff                             =
                                                                           =
                    =20
 ORIG_R28: 00000000                                                        =
                                                                           =
                    =20
 IAOQ[0]: .L21+0x0/0x8                                                     =
                                                                           =
                    =20
 IAOQ[1]: .L21+0x4/0x8                                                     =
                                                                           =
                    =20
 RP(r2): paging_init+0x7ac/0x848                                           =
                                                                           =
                    =20
Backtrace:                                                                 =
                                                                           =
                    =20
 [<105caed8>] paging_init+0x7ac/0x848                                      =
                                                                           =
                    =20
 [<105cb474>] setup_arch+0x5c/0x80                                         =
                                                                           =
                    =20
 [<105c86ac>] start_kernel+0x80/0x374                                      =
                                                                           =
                    =20
 [<1011497c>] start_parisc+0x4c/0x68                                       =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
Backtrace:                                                                 =
                                                                           =
                    =20
 [<10115050>] die_if_kernel+0xac/0x1bc                                     =
                                                                           =
                    =20
 [<1011587c>] handle_interruption+0x47c/0x718                              =
                                                                           =
                    =20
 [<10104078>] intr_check_sig+0x0/0x34                                      =
                                                                           =
                    =20
 [<10100480>] .L21+0x4/0x8                                                 =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
=2D--[ end trace 139ce121c98e96c9 ]---                                     =
                                                                           =
                      =20
Kernel panic - not syncing: Attempted to kill the idle task!               =
                                                                           =
                    =20
Backtrace:                                                                 =
                                                                           =
                    =20
 [<1010fdec>] panic+0x90/0x23c                                             =
                                                                           =
                    =20
 [<10135b28>] do_exit+0x5cc/0x640                                          =
                                                                           =
                    =20
 [<1011508c>] die_if_kernel+0xe8/0x1bc                                     =
                                                                           =
                    =20
 [<1011587c>] handle_interruption+0x47c/0x718                              =
                                                                           =
                    =20
 [<10104078>] intr_check_sig+0x0/0x34                                      =
                                                                           =
                    =20
 [<10100480>] .L21+0x4/0x8                                                 =
                                                                           =
                    =20
                                                                           =
                                                                           =
                    =20
      _______________________________                                      =
                                                                           =
                    =20
     < Your System ate a SPARC! Gah! >                                     =
                                                                           =
                    =20
      -------------------------------                                      =
                                                                           =
                    =20
             \   ^__^                                                      =
                                                                           =
                    =20
                 (__)\       )\/\                                          =
                                                                           =
                    =20
                  U  ||----w |                                             =
                                                                           =
                    =20
                     ||     ||                                             =
                                                                           =
                    =20
swapper (pid 0): Protection id trap (code 7)                               =
                                                                           =
                    =20
die_if_kernel() recursion detected.

--nextPart5216822.ezjL2bRbq4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk5OpEsACgkQXKSJPmm5/E7LLwCbBWf4PeRmnRu1CJYXEInIbp9r
/PUAoJW0OFR80fZOl+rAHyB2STdz+ECE
=/A/v
-----END PGP SIGNATURE-----

--nextPart5216822.ezjL2bRbq4--
