Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 005FE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 06:07:07 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3GC76631263
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 13:07:06 +0100
Date: Wed, 16 Apr 2003 13:07:06 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0304161214080.15781-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Presicionbook success
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

I just wanted you to inform that I successfully installed
Debian testing on my Presicionbook.

However there are still some glitches:

- Internal LCD display not supported (properly)

  If you want to install Debian on a Presicionbook you have to use
  an external monitor and choose the "external VESA" modes - e.g.
  "1280x1024x8 75Hz VESA external" - the ONLY modes that worked for me.

  The "1024x768 62Hz RCILCD (internal)" doesn't work for me, ie. it
  doesn't switch to the stifb mode and it stops to display anything right
  after "Branching to kernel entry point" ... however the systems boots
  up and I can remote login (using my custom kernel)! Using the ESIEE
  kernel (also a 2.4.20-pa32) I was even able to see some kernel messages
  BEFORE it tried to switch to stifb; at least there was no tux on the
  screen (see my last posts), but seemed to hang then.

  BTW, there is some confusing info about the LCD screen;
  apparently it supports 256k colours (thousands!), but I doen't know
  whether it automatically converts 24bit pictures into 256k or
  whether you need to use a special video mode to be able use the 256k
  colours.

  The graphic card is an Visualize-EG, which can be updated with
  additional RAM (so you're able to display resolutions up to
  1600x1200 and having 1280x1024 in (true?) colour). I don't know
  how many memory my one has, but it's supposed to support
  1024x768 in true colour (so at least 3MB)

- PS/2 laptop keyboard

  The Presicionbook uses a 97-key keyboard. You can also attach an
  external PS/2 keyboard.

  The internal keyboard seems to work now - however it wouldn't work
  properly during the debian installation! I had to attach an external
  PS/2 keyboard to be able to use the debian-installer, since TAB, ESC and
  the ARROW-Keys didn't work using the laptop keyboard.

  Strangely enough it works perfectly now (for all other applications),
  maybe because it's just the debian-installer or maybe because I
  recompiled the kernel?!

- PS/2 laptop touchpad

  Had problems getting it to work at first.
  You have to use gpm and use the 'broken PS/2' mouse driver, e.g.

  gpm -t fups2 -m /dev/psaux -3 -Rms3

  (-Rms3 enables the repeater mode, so that you can use the mouse within
   XFree86. Choose '/dev/gpmdata' and 'IntelliMouse' as the mouse device
   and mouse type in XF86Config)

  You also need this configuration if you want to use an external PS/2
  mouse (even an external ImPS/2 Scrollwheel mouse in my example)

- The precompiled kernel from the EISEE team may hang ...

  ... since it has support for the CMD PCI0643 IDE Busmaster chip,
  which is obviously used in the Presicionbook, but the driver
  doensn't/mustn't be used in Linux, since it causes confusion!
  So add "ide=nodma" or something similar to the kernel parameters
  (using the IPL) or simply recompile the kernel with no IDE support.

  (The Presicionbook uses 2.5" IDE harddrives, obviously connected
   to the CMD chip, but they automagically appear as SCSI drives on LASI
   SCSI.)

- b/w LCD status screen

  The heartbeat, disk-activity etc. indicators seem to work perfectly.

- PCMCIA

  I'm honestly a little bit confused here.
  It uses the  Cirrus Logic PD 6832 PCMCIA/CardBus Controller, which
  seems to be supported under Linux, HOWEVER the physical slots
  appear to be just for old PCMCIA ISA 16bit PC Cards, not for the
  newer 32bit PCI CardBus PC Cards. I haven't tried whether it works,
  since I don't have any PCMCIA PC Cards (ISA or PCI Cardbus).

- Irda

  I don't know whether the IrDA chip is supported

- Serial/Parallel

  Couldn't test it since you need an external adapter to get access to the
  serial/parallel/aui ports.



greetings, Max
