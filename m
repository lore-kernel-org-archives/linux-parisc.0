From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Resurrecting my C3000.
Date: Thu, 23 Dec 2010 12:26:56 -0500
Message-ID: <AANLkTinFSs6z35AcsAWZ8AuvvPgSDwj8G6Xt4uhOY1XV@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Team,

I wanted to resurrect my C3000 for some 32-bit kernel testing.

I booted it up, but it didn't work, the LCD displayed:
~~~
INI 8890: IO BD
Early Super init
~~~

I don't see anything on the connected serial port #1 (9600 8N1).

I took all the PCI cards out (LSI scsi, 3 VIS-EG PCI), cleaned it,
added some thermal paste to the cpu, and reseated the memory.

Same issue, but sometimes I get  "OFF 00FF:" on the LCD, which isn't a
valid Code for that Ostat.

The workstation reference manual for the C3000 has this to say:
Ostat: INI
Code: 8890
FRU: IO BD
Message: early Super init
Description: Initializing Super-I/O for early RS-232 output.

Technically one must re-seat or replace the failing FRU, but I don't
know what FRU "IO BD" is? The motherboard? :-(

Any ideas?

Cheers,
Carlos.
