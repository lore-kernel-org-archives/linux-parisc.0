Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from obelix.hrz.tu-chemnitz.de (obelix.hrz.tu-chemnitz.de [134.109.132.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE4D8482A
	for <parisc-linux@parisc-linux.org>; Wed,  6 Feb 2002 03:09:09 -0700 (MST)
Received: from pat.hrz.tu-chemnitz.de ([134.109.132.143] ident=mail)
	by obelix.hrz.tu-chemnitz.de with esmtp (Exim 3.32 #1)
	id 16YP0l-0007h3-00
	for parisc-linux@parisc-linux.org; Wed, 06 Feb 2002 11:09:07 +0100
Received: from gerd.csn.tu-chemnitz.de ([134.109.88.146] helo=gerd.jandt-online.net)
	by pat.hrz.tu-chemnitz.de with esmtp (Exim 3.32 #2)
	id 16YP0k-0006GF-00
	for parisc-linux@parisc-linux.org; Wed, 06 Feb 2002 11:09:06 +0100
Message-Id: <5.0.2.1.2.20020206105902.00ae3d90@pop.puretec.de>
Date: Wed, 06 Feb 2002 11:07:47 +0100
To: parisc-linux@parisc-linux.org
From: Tilo Jandt <tilo@jandt-online.net>
In-Reply-To: <Pine.NEB.4.33.0202060812220.5141-100000@www2.scram.de>
References: <Pine.LNX.4.42.0202052016240.8579-100000@r6.petescaff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Subject: [parisc-linux] Some Problems
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

I'm using HPPA-Debian for 3 weeks and so I'm not very skilled and I have=20
different Problems. I hope you could help to solve.
My machine is a HP712/60 with 64 MB RAM.

First Problem:
Since my last dist-upgrade I can't start the X-Server anymore.
If I start gdm I can see the gray background for a short moment and move=20
the mouse and then the gdm restarts.
If I start with startx the following output is printed:

(II) FBDev(0): using default device
(II) Running in FRAMEBUFFER Mode
(**) FBDev(0): Depth 8, (--) framebuffer bpp 8
(=3D=3D) FBDev(0): Default visual is PseudoColor
(=3D=3D) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDev(0): Hardware:  (vidmem: 2048k)
(II) FBDev(0): Checking Modes against framebuffer device...
(II) FBDev(0):  mode "1280x1024" ok
(II) FBDev(0): Checking Modes against monitor...
(--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDev(0): Built-in mode "current": 28000.0 MHz, 21875.0 kHz, 21362.3 Hz
(++) FBDev(0): DPI set to (100, 100)
(**) FBDev(0): Using "Shadow Framebuffer"
(=3D=3D) FBDev(0): Backing store disabled
PEXExtensionInit: Couldn't open default PEX font file  Roman_M
(**) Mouse1: Protocol: "ps/2"
(**) Mouse1: Core Pointer
(=3D=3D) Mouse1: Buttons: 3
(**) Mouse1: Emulate3Buttons, Emulate3Timeout: 50
(II) Keyboard "Keyboard1" handled by legacy driver
(II) XINPUT: Adding extended input device "Mouse1" (type: MOUSE)

waiting for X server to shut down

Does anyone know what to do?

My second problem is that my keyboard doesn work well.
It's a PS2 Keyboard an I installed a german keymap but if I press e.g. > I=
=20
get a error-message like:
undefined scancode.
What could I do?

Third problem:
I wanna use the Cocoon2 XML Server with Tomcat but to start Tomcat I need=20
java. Is there any Java runtime available or is it impossible at the moment=
=20
to run Tomcat and Cocoon?

Last problem:
I also wanna run the zope server, but when I start it with zopectl start it=
=20
failed and I don't know what to do. Does anyone work with zope under=20
HPPA-Debian?

Thanx,
Tilo

Student of Computer Science at Chemnitz University of Technology
|[ Tilo Jandt, Vetterstra=DFe 70, Zi. 330, D-09126 Chemnitz        ]|
|[ mailto:tija@hrz.tu-chemnitz.de ]  [ ICQ: 73832493               ]|
|[ Phone: +49 179 5333 255        ]  [ Fax: +49 89 2443 25531 ]|
