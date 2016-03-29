From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: HP c8000 linux install issues, troubles and questions
Date: Tue, 29 Mar 2016 08:04:58 +0200
Message-ID: <4207644.uZSTasQYhb@caliban.sf-tec.de>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2471454.XFmOYSpxen"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2471454.XFmOYSpxen
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> Q1. On HP c8000 the built-in serial ports A and B are useless for
> Linux installation. A PCI serial card with a PC compatible UART must
> be used.
> 
> Q2. After installation, serial ports A and B are still unusable with
> Linux or they become available?

Both ports will work, but they have non-standard names. You need to pass 
"console=ttyB0" to see the boot messages.

> Q3. Is it possible to install Linux and boot from an IDE/PATA disk or
> any IDE/PATA disk will be available only as "data disk" (no boot; boot
> works only on SCSI disks)?

I have installed mine from an IDE CD to SCSI disks, no idea if booting from 
IDE disks works.

> Q3. I have found that c8000 "bios" has an x86 emulator capable to
> detect and initialise PCI and AGP "x86 PC" cards with x86 coded
> VGA-BIOS. It is correct?

Yes, you can use standard AGP cards. I have not done it myself, but a 
colleague did.

> Q4. Recent kernel and X11 versions have built-in hardware support for
> OpenGL for the models where the manifacture has released the technical
> specs. Why on Linux-hppa the hardware acceleration is not supported?

Probably because noone did it.

> Q5. After the installation, the built-in Ethernet interface will
> becomes available or I need to install a second PCI network card?

Works fine, e1000 driver.

> Q6. Recent kernel versions have built-in Comedi data acquisition
> drivers built-in. If I will install a compatible DAQ card in a PCI
> slot, it will works?

None idea, but if not it's probably just a bug.

> Q7. Someone has tried any hard-real-time-patched linux kernel on
> pa-risc machines (like RT-PREEMPT or RTAI) or other tricks to reduce
> kernel latency (like forced cpu assignement to a specific process)?

I did not. The machine is slow enough that I'm happy for every throughput I 
get without this ;)

Greetings,

Eike
--nextPart2471454.XFmOYSpxen
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlb6Gw8ACgkQXKSJPmm5/E4oswCgm9mP8pyrw87LTF1U4Fm6nWG0
lsgAn0YtesNn2cCXiANOJsjtQMA08Z6b
=64Cm
-----END PGP SIGNATURE-----

--nextPart2471454.XFmOYSpxen--

