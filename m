From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.9-rc4-pa2 32bits faiiled to boot on b2k ??
Date: Thu, 14 Oct 2004 15:12:57 +0200
Message-ID: <4161746600002FFE@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Grundler Grant" <grundler@parisc-linux.org>,
 "List Parisc" <parisc-linux@parisc-linux.org>
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

(Yet) another pb with this b2k and the new 2.6.9-rc4-pa2 (pa3 wouldn't he=
lp,
I don't use HIL on this box).

In summary, this kernel boot fine on b180 (32bit), on n4k (64bit smp, abo=
ut
101 make -j 4 vmlinux on this last 2 days on a local disk :-) ) and fwiw
on
b2k but 64bit only with I-K patch (superio init prior others).

BUT as describe in the title, those same sources with same config (the c3=
k
defconfig)
 but for 32bit, it failled to boot very early, just after the ipl banner:=

Command line for kernel: 'root=3D/dev/sda5 HOME=3D/ panic=3D180 console=3D=
ttyS0
TERM=3Dvt102 palo_kernel=3D3/vmlinux-2.6.9-rc4-pa2-b2k32'
Selected kernel: /vmlinux-2.6.9-rc4-pa2-b2k32 from partition 3
ELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 3727616 mediaptr 0x1000
Segment 1 load 00490000 size 270470 mediaptr 0x390000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

And the cdrom green led stay continuously lighted.

I could grab a piminfo and analyse it: useless because IAOQ was pointing
to:
Func: L4^B2, Off: 0x4, Addr: 0x1010d650

1010d650:       0f a2 12 90     stw rp,8(,ret1)
1010d654:       0f a3 12 98     stw r3,c(,ret1)
1010d658:       6b a4 00 20     stw r4,10(,ret1)
1010d65c:       6b a5 00 28     stw r5,14(,ret1)

:(.

I so came back to latest 2.6.9-rc3-pa5: 32bit and 64bit up kernels were
booting as well on this box :)

It's hard to check but it seems that nothing was missed during merge :)
(btw this pb was already mentioned for pa1 <http://lists.parisc-linux.org=
/pipermail/parisc-linux/2004-October/025018.html>)

Finaly all 4 kernels (2.6.9-rc3-pa5, 2.6.9-rc4-pa2, each 32 and 64 bits)
were build on the same  b2k local disk and the same unstable debian insta=
ll
with latest tools:
ii  libc6          2.3.2.ds1-17   GNU C Library: Shared libraries and Tim=
ezone
ii  libc6-dev      2.3.2.ds1-17   GNU C Library: Development Libraries an=
d
Hea
ii  binutils       2.15-4         The GNU assembler, linker and binary ut=
iliti
ii  binutils-dev   2.15-4         The GNU binary utilities (BFD developme=
nt
fi
ii  binutils-doc   2.15-4         Documentation for the GNU assembler, li=
nker

ii  gcc-3.3        3.3.5-1        The GNU C compiler
ii  gcc-3.3-base   3.3.5-1        The GNU Compiler Collection (base packa=
ge)
ii  gcc-3.3-doc    3.3.5-1        Documentation for the GNU compilers (gc=
c,
go
ii  gcc-hppa64     3.0.4ds3-8     Cross gcc for hppa64

Any idea? what, where, how could I check addtional stuff?

(btw, is any lkcd foreseen for our hppa?)

Thanks in advance,
    Joel

PS1: Is c3xxx, jxxxx doesn't have the same pb?

PS2: it's also the only box where CONFIG_FW_LOADER is set (Y)  (that make=

sense with the select of pcmcia and usb support) but even uncheck this op=
tion
doesn't help.

PS3: because of cdrom led lighted, I also unselect superio support and al=
l
atapi - ide support but nothing help :(




-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
