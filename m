Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE746497C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 20:04:26 -0600 (MDT)
Date: Thu, 15 Apr 2004 03:04:10 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] B1000/C3000
In-Reply-To: <20040414232833.GQ31873@tausq.org>
Message-ID: <Pine.LNX.4.58.0404150125020.28713@sal.ucc.ie>
References: <200404142051.i3EKpfQX018442@hiauly1.hia.nrc.ca>
	<Pine.LNX.4.58.0404142155100.8626@sal.ucc.ie>
	<20040414232833.GQ31873@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 14 Apr 2004, Randolph Chung wrote:

> > "What non-HP PCI graphic cards are supported/work with PA-RISC Linux"
>
> would you like to write up the entry and send it to the list?

Okay, it's not a patch/diff, it's not XHTML, but a start:


====
Q: Can I use a non-HP PCI graphic cards with PA-RISC Linux?

A: Depends on which graphics card you are using.

   Most graphics card have to be initialized by the computer
   before it can  be used. Usually this is done by the BIOS on (ix86-PCs),
   the PDC (on PA-RISC) or OpenFirmware (on Sun and MACs), which run a
   initialization programme stored on the graphics card.

   Unfortunately each of these ways is incompatible with each other, so
   you cannot initialize a PC graphics card using the PA-RISC PDC.
   Therefore the graphic card vendors produce different versions for
   each platform (e.g. ATI produces different 'Fire GL' graphics cards for
   PC, MAC and PA-RISC).

   This leads to the following problems:


   - PA-RISC PDC doesn't know how to use a non-HP graphics card

      Eg. you will not be able to use the boot menu with a non-HP graphics
      card.
      Unfortunately we are not able to provide a work-around for this
      problem, since this would require patching the PDC firmware.
      Therefore you have to use the serial console if you want access
      the boot menu.


   - You have to initialize a non-HP graphics card somehow


     1. Linux framebuffer driver
     ---------------------------
     Some graphic cards that can be initialized by the linux framebuffer
     drivers directly, and might work on PA-RISC Linux.
     This is an incomplete list:

       - Voodoo2
       - ATI Rage XL
       - older Matrox Millenium

     So far had success reports for the Voodoo2 and the ATI Rage XL card.
     In combination with the fbdev X-server from XFree86/X.org
     you should able to have a nice X11 desktop.



     2. XFree86/X.org driver
     -----------------------
     Another approach is to use the XFree86/X.org graphic card drivers:

     The XFree86/X.org server contains a small ix86-Emulator that is able
     to initialize some graphic cards on non-ix86 systems. However it
     is far from being perfect, so you shouldn't expect that it will
     work with your card.

     An advantage of this approach is that you would be able to use
     some advanced features of your graphics card, like 2D/3D
     acceleration, graphics overlay etc.

     Unfortunately we haven't heard any success stories from anyone using
     this aproach.
===


Any comments/corrections?


Greetings,
  Max
