From: Simone Mannori <simone.mannori@gmail.com>
Subject: HP c8000 linux install issues, troubles and questions
Date: Tue, 29 Mar 2016 07:33:35 +0200
Message-ID: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello everyone,

I have recenty bought a second-hand HP c8000 workstation and I would
like to install Linux.
The c8000 has arrived with a pre-installed HP-UX 11 and works
perfectly (no hardware issues).

No matter Debian or Gentoo versions, the install CD/DVD boot/install
process hangs in the very same place. Just to limit the discussion to
a specific case, I would like to take in account the latest Debian 8.0
unstable: http://ftp.debian-ports.org/debian-cd/hppa/debian-8.0
( https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation )

The c8000 has TWO serial ports (A and B). Using null modem cables I
have connected both serial ports to a Dell desktop with two serial
ports and two serial terminals (9600, 8, n ,1) programs open.

Serial A : a lot of diagnostic and booting messages. The c8000 "bios"
produces a lot of "post" messages on the Serial A port.

Serial B : none

The CD/DVD Linux install disk boots and produce a series of messages
on the VGA monitor, then hungs. No further messages on the built-in
serial ports A and B. Game over ?

On Internet I have found serveral posts that point out the necessity
of a PCI serial port "PC compatible UART". I will try it as soon it
will available.

Just to be sure, can you confirm/negate/answer to the following questions?

Q1. On HP c8000 the built-in serial ports A and B are useless for
Linux installation. A PCI serial card with a PC compatible UART must
be used.

Q2. After installation, serial ports A and B are still unusable with
Linux or they become available?

Q3. Is it possible to install Linux and boot from an IDE/PATA disk or
any IDE/PATA disk will be available only as "data disk" (no boot; boot
works only on SCSI disks)?

Q3. I have found that c8000 "bios" has an x86 emulator capable to
detect and initialise PCI and AGP "x86 PC" cards with x86 coded
VGA-BIOS. It is correct?

Q4. Recent kernel and X11 versions have built-in hardware support for
OpenGL for the models where the manifacture has released the technical
specs. Why on Linux-hppa the hardware acceleration is not supported?

Q5. After the installation, the built-in Ethernet interface will
becomes available or I need to install a second PCI network card?

Q6. Recent kernel versions have built-in Comedi data acquisition
drivers built-in. If I will install a compatible DAQ card in a PCI
slot, it will works?

Q7. Someone has tried any hard-real-time-patched linux kernel on
pa-risc machines (like RT-PREEMPT or RTAI) or other tricks to reduce
kernel latency (like forced cpu assignement to a specific process)?

Thanks in advance for your help. A lot of hppa/c8000 hardware is now
available at ridiculous prices, therefore I suppose that the answer to
my questions in a single thread will help a lot of hppa newbies like
me.

    Simone Mannori - Italy
