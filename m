Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe40.law3.hotmail.com [209.185.240.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 775C04858
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Jul 2002 08:58:45 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Joel Soete" <joel.soete@freebel.net>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE62b63Kbc9oLfgzBsc00001390@hotmail.com> <3D21DFDD.9090002@freebel.net> <3D21E354.8050701@freebel.net> <OE17H31NKzHWcQTLwR20000190f@hotmail.com> <3D2460E6.2040608@freebel.net>
Subject: Re: [parisc-linux] Installing on C3600
Date: Thu, 4 Jul 2002 16:58:43 +0200
Message-ID: <OE40wtsQztQoPAzdaQY00001f9b@hotmail.com>
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

ok thanks,

i've got a serial term connected, but the when the installer i get screen
corruption, I have tried vt52, vt100, vt102 and hp.  I have the same result
on all.

I've got a HP 700/96 Teminal.

Thanks again
Alex
----- Original Message -----
From: "Joel Soete" <joel.soete@freebel.net>
To: "Alex Green" <alexdgreen@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Thursday, July 04, 2002 4:51 PM
Subject: Re: [parisc-linux] Installing on C3600


>
>
> Alex Green wrote:
> > [....]
> >
> >
> >>>If it is a hp terminal, you can change the emulation. It depends of the
> >>>terminal type but you can have a look in your user guide or test (but I
> >>>think that would request severall reboot) the emulation nearest vt100
> >>
> > IIRC.
> >
> >>>Once you have found the right emulation, try first the more stable
> >>>32-bits kernel (IIRC if you unplug ps/2 or usb mouse and keyboard, the
> >>>kernel will switch to serial console on port 1).
> >>
> >>Another good solution could also be to run minicom as console emulation.
> >
> >
> > So, should i set the terminal type to be VT102 IIRC or just VT102?.. the
> > terminal is a proper HP Serial Console.
> >
> Sorry I have not any material neither doc to help you right now. Next
> week I will be back to office and more accurate details for your help.
>
> > Is it possible to use the STI Console ( Which I believe to be the
Graphics
> > Adapter Console) to start the installation?
> >
> Let first try to build a build a system wit serial console, than you
> would be able to choose install a more recent kernel
> (ftp://ftp.parisc-linux.org) to see if you can use STI (IIRC Standard
> Text Interface) with your Graphics adapter).
>
> So yes STI give you actually a text interface for your console on your
> Graphical adaptor through fb (Frame Buffer) support.
>
> > Thanks for the help
> > Alex
> >
> See you later,
> Joel
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
