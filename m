From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] console on ttyS0 broken with 2.6.9-bk6-pa1 ?
Date: Mon, 25 Oct 2004 06:47:09 +0000
Message-ID: <416174660000620A@mail-3-bnl.tiscali.it>
References: <200410241554.52818.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Helge Deller" <deller@gmx.de>,
 parisc-linux@parisc-linux.org
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200410241554.52818.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

> 
> I just compiled/booted the latest CVS kernel (2.6.9-bk6-pa1) which seem=
s
> to boot fine.
> Sadly using a serial console is broken. Any ideas ?
> 
Sorry I could very help but I experiment a similar pb on my c110:

> This is the bootlog in minicom:
> 
> palo ipl 0.99 root@P100 Sat Apr 13 22:21:21 CEST 2002
> 
> Boot image contains:
>     0/vmlinux32 4714377 bytes @ 0x8000
> 
> Information: No console specified on kernel command line. This is norma=
l.
> PALO will choose the console currently used by firmware (serial).
> Command line for kernel: 'HOME=3D/ root=3D/dev/sda3 ip=3Dbootp console=3D=
ttyS0
TERM=3Dvt102
> palo_kernel=3D0/vmlinux'
> Selected kernel: /vmlinux from partition 0
> Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
32-bit
> kernelELF32 executable
> Entry 00100368 first 00100000 n 1
> Segment 0 load 00100000 size 3780741 mediaptr 0x1000
> Branching to kernel entry point 0x00100368.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org=

> 
After this , on this c110 (and b180) model, there are not any more messag=
es
display (since release 2.6.9-rc2-pa1?) on serial console (no way to test
sti one :( ) before :
0x00000009}
lp: driver loaded but no devices found
Generic RTC Driver v1.07
(ie just after sti switch should occur ?)

> 
> Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabl=
ed
> ttyS0 at MMIO 0xf0105800 (irq =3D 90) is a 16550A
The same but the message is weird for me:
0x00000009}
0x00000009}
0x00000009}
etc

(Note that one of this line was already displayed before "lp: driver..."
?)

Anyway (may be was I not enough patient) the system never came up 
(I couldn't even launch a TOC to grab some piminfo:  the time stamp of wh=
at
I read was date May 23 ... when the hw system clock was well Oct 23 ...?)=


Also a simiar pb on the n4k, the message was:
'io scheduler noop registered'
'io scheduler noop registered'
etc

And the system didn't bring up too (I almost waited 10 mininutes before
reset it)

OTC my b2k with 32bit kernel boot fine without any pb of any kind (all me=
ssages
are well displayed :)

 Cheers,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR
