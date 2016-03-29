From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: HP c8000 linux install issues, troubles and questions
Date: Tue, 29 Mar 2016 09:48:21 +0200
Message-ID: <trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>,
 <4207644.uZSTasQYhb@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Simone Mannori" <simone.mannori@gmail.com>,
	linux-parisc@vger.kernel.org
To: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4207644.uZSTasQYhb@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Q1. On HP c8000 the built-in serial ports A and B are useless for
> > Linux installation. A PCI serial card with a PC compatible UART must
> > be used.

No, the serial ports on C8000 are fully useable.
No need to add other serial cards.

> > Q2. After installation, serial ports A and B are still unusable with
> > Linux or they become available?
> 
> Both ports will work, but they have non-standard names. You need to pass 
> "console=ttyB0" to see the boot messages.

With the debian install image you don't need to do any changes to the names.
Please read the documentation at
https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
especially this part:
- Installation of a C8000 workstation needs to happen via serial console since the install image will not activate the ATI graphics card.
- After installation the ATI cards will work in non-accelerated mode though. 

I'd suggest to just plug the graphics cable and keyboard cable, and then
install via serial port (that works, I did it on my C8000 machines).

> > Q3. Is it possible to install Linux and boot from an IDE/PATA disk or
> > any IDE/PATA disk will be available only as "data disk" (no boot; boot
> > works only on SCSI disks)?
> 
> I have installed mine from an IDE CD to SCSI disks, no idea if booting from 
> IDE disks works.

Yes, installing and/or booting from IDE hard disc drive or CD works.
 
> > Q3. I have found that c8000 "bios" has an x86 emulator capable to
> > detect and initialise PCI and AGP "x86 PC" cards with x86 coded
> > VGA-BIOS. It is correct?
> 
> Yes, you can use standard AGP cards. I have not done it myself, but a 
> colleague did.

I never tried.
 
> > Q4. Recent kernel and X11 versions have built-in hardware support for
> > OpenGL for the models where the manifacture has released the technical
> > specs. Why on Linux-hppa the hardware acceleration is not supported?
> 
> Probably because noone did it.

We have problems initializing the ATI cards to a state where the
standard Linux drivers can take over.
Not sure where exactly the problem is.
Look at the kernel messages, something like "Initialization of ring failed..."

> > Q5. After the installation, the built-in Ethernet interface will
> > becomes available or I need to install a second PCI network card?
> 
> Works fine, e1000 driver.

Correct.

> > Q6. Recent kernel versions have built-in Comedi data acquisition
> > drivers built-in. If I will install a compatible DAQ card in a PCI
> > slot, it will works?
> 
> None idea, but if not it's probably just a bug.

No idea. Try it and report back.

> > Q7. Someone has tried any hard-real-time-patched linux kernel on
> > pa-risc machines (like RT-PREEMPT or RTAI) or other tricks to reduce
> > kernel latency (like forced cpu assignement to a specific process)?
> 
> I did not. The machine is slow enough that I'm happy for every throughput I 
> get without this ;)

I didn't tried either.

Helge
