Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id E36674843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 25 Feb 2004 18:59:35 -0700 (MST)
Date: Thu, 26 Feb 2004 01:59:32 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
In-Reply-To: <1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
Message-ID: <Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 26 Feb 2004, Alan Cox wrote:

> On Iau, 2004-02-26 at 00:52, M. Grabert wrote:
> > It occurs to me that the driver has some big endian issues (and probably
> > some other issues aswell). I've given up hope to get it working after
> > I didn't receive any replies from the maintainer, linux-ide or even lkml.
>
> Well as the older maintainer I certainly didnt get anything.

<nickpick>
Well, actually you did ...

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-December/021842.html

... and you were very helpful.

But you were not the maintainer I was refering to. I meant the one
you suggested in the mail mentioned above:

---
Date: Mon, 8 Dec 2003 23:47:13 +0000 (GMT)
From: M. Grabert <xam@cs.ucc.ie>
To: B.Zolnierkiewicz@elka.pw.edu.pl
Cc: linux-ide@vger.kernel.org
Subject: siimage problems on Linux/PA-RISC
---

As I said, I also sent a mail to linux kernel mailing list:
http://www.ussg.iu.edu/hypermail/linux/kernel/0402.2/0011.html

</nickpick>


> The core
> code is known to be good for 64bit and also big endian, the mmio IDE
> code is a little less tested so you could try running the 680 in I/O
> mapped mode as a first guess. Otherwise it should be clean.

I last time I tried was with the 2.4.24-pa0 kernel and with 2.6.3-rc2.

Both show the output
   hda: TS130220A2, ATA DISK drive
instead of
   hda: ST3120022A, ATA DISK drive

That's why I thought it would be related to a big-endian problem.


> Your IRQ routing is probably wrong. However this is a gotcha with
> promise controllers. Some of them require the x86 boot firmware is run
> before they operate.

Yes, that's the case for the FastTrak RAID controllers (and some others).
I found the
  "Special FastTrak feature" option that allows you to detect
the hard drives without the help from the BIOS (AFAIK).

I digged around in the 2.4.25-pa0 kernel sources obviously the option
doesn't apply to the Promise Ultra100 TX2 controllers (no #ifdefs).

And since I've seens reports that some got it working on Linux/PPC
without patching, I think you don't need the ix86 firmware to operate
this particular controller.


> > One very interesting thing is that the "hda: lost interrupt" messages
> > also appeared when I tried the siimage IDE controller on 2.4 kernels!
> > (see http://www.cs.ucc.ie/~xam/siimage/bootlog-2.4.23-pa3.txt)
> > Perhaps the siimage problem might be related to this problem?
> >
> > Any suggestions what could be the problem or how to debug it any further?
>
> First stop sounds like figuring out what IRQ routing is being used. In
> particular you need to know how legacy mode interrupt mapping is done on
> your system and whether it is even wired that way. If its using native
> mode you then need to work out why your IRQ is not appearing (or which
> IRQ is actually correct).

I've put the output of "lspci -vvv", /proc/interrupts and /proc/ioports
here: http://www.cs.ucc.ie/~xam/promise/


> (IDE chips have two modes - some more but the basic ones are
>
> legacy mode: decodes the traditional PC IDE I/O ports, uses ISA IRQs
> which can be fun since motherboard IDE may point them anywhere or not
> wire them.
>
> native mode: Uses PCI irq signalling and addressing. Used for plug in
> cards but doesn't always work on motherboard devices.
> )

I suppose the output I see with 2.6.3-pa2

"PDC20268: ROM enabled at 0xf7004000"
"PDC20268: 100% native mode on irq 192"
"ide0 at 0x3c400-0x3c407,0x3c302 on irq 192"

and the fact, that I can see the partition correctly with fdisk
(albeit very slow) seem to indicate that it is in native mode
rather than legacy mode?

BTW, the controller supports PCI33 and PCI66. I've tried both
(always the same problems), and currently it is in the PCI66 slot.


Thanks alot for the fast reply,
 greetings from Ireland,
   Max

PS: still awake at this time?
