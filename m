From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Re: HP c8000 linux install issues, troubles and questions
Date: Tue, 29 Mar 2016 11:12:55 +0200
Message-ID: <CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
	<4207644.uZSTasQYhb@caliban.sf-tec.de>
	<trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thanks a lot for your answers and suggestions, but on a specific point
I'm really perplexed.

> With the debian install image you don't need to do any changes to the names.
> Please read the documentation at
> https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
> especially this part:
> - Installation of a C8000 workstation needs to happen via serial console since the install image will not activate the ATI graphics card.
> - After installation the ATI cards will work in non-accelerated mode though.
>
> I'd suggest to just plug the graphics cable and keyboard cable, and then
> install via serial port (that works, I did it on my C8000 machines).

Serial A (c8000) --> COM1 (Dell 490)
Serial B (c8000) --> COM2 (Dell 490)

Both serial ports use tied&tested null modem cables and 9600,8,N,1
standard setting; Dell 490 runs Win8.1 with two terminal programs
open.

Serial A shows only BIOS/POST messages; Serial B is dead.

I'm using Debian 8.0 ustable boot CD "debian-8.0-hppa-CD-1.iso"; the
CD boot perfecty (usual linux boot messages on vga monitor)  then
hung, looking for a serial port.

> https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation

said " Installation of a C8000 workstation needs to happen via serial
console since the install image will not activate the ATI graphics
card. After installation the ATI cards will work in non-accelerated
mode though. " .... but other people said that you need an additional
PCI serial card with PC-compatible UART.

Question: "Can you tell me which serial port (A or B?) and parameters
(baud rate, n-bits, stop bit, parity, etc). you have used to complete
the Debian installation? "

Thanks in advance for your help.

  Simone Mannori - Italy
