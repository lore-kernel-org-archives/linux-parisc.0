Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe17.law3.hotmail.com [209.185.240.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24FCC4878
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 02:28:37 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Joel Soete" <joel.soete@freebel.net>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE62b63Kbc9oLfgzBsc00001390@hotmail.com> <3D21DFDD.9090002@freebel.net> <3D21E354.8050701@freebel.net>
Subject: Re: [parisc-linux] Installing on C3600
Date: Wed, 3 Jul 2002 10:28:34 +0200
Message-ID: <OE17H31NKzHWcQTLwR20000190f@hotmail.com>
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

[....]

> > If it is a hp terminal, you can change the emulation. It depends of the
> > terminal type but you can have a look in your user guide or test (but I
> > think that would request severall reboot) the emulation nearest vt100
IIRC.
> >
> > Once you have found the right emulation, try first the more stable
> > 32-bits kernel (IIRC if you unplug ps/2 or usb mouse and keyboard, the
> > kernel will switch to serial console on port 1).
>
> Another good solution could also be to run minicom as console emulation.

So, should i set the terminal type to be VT102 IIRC or just VT102?.. the
terminal is a proper HP Serial Console.

Is it possible to use the STI Console ( Which I believe to be the Graphics
Adapter Console) to start the installation?

Thanks for the help
Alex
