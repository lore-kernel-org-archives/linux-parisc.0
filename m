Return-Path: <simmel@anymotion.de>
Received: from mail.3d-boerse.de (port-212-202-156-103.reverse.qsc.de
	[212.202.156.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB0A448AA
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 09:11:26 -0700 (MST)
Message-ID: <00ca01c3eccc$350ffe70$8100a8c0@punk>
From: "Jens Simmoleit" <simmel@anymotion.de>
To: "PARISC list" <parisc-linux@lists.parisc-linux.org>,
	<debian-hppa@lists.debian.org>
References: <02d601c3ebef$e3241650$8100a8c0@punk><200402060007.27911.deller@gmx.de>
	<009801c3ecc6$d637d990$8100a8c0@punk>
	<1076082583.1823.23.camel@mulgrave>
Subject: Re: [parisc-linux] Re: Install GNOME on 712/80
Date: Fri, 6 Feb 2004 17:13:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi List, Hi James,

nope this is unfortunately not the solution to my problem :-(

But I maybe found something else. Instead of starting GDM I started the
gdmlogin and maybe it gave back a clue, look here.....

lisa:/dev/input# gdmlogin --version

Gdk-WARNING **: locale not supported by C library
Gnome gdmlogin 2.2.5.5
lisa:/dev/input#



Any idea?

Thanks for helping me,
Simmel




----- Original Message ----- 
From: "James Bottomley" <James.Bottomley@steeleye.com>
To: "Jens Simmoleit" <simmel@anymotion.de>
Cc: "PARISC list" <parisc-linux@lists.parisc-linux.org>;
<debian-hppa@lists.debian.org>
Sent: Friday, February 06, 2004 4:49 PM
Subject: Re: [parisc-linux] Re: Install GNOME on 712/80


> On Fri, 2004-02-06 at 10:35, Jens Simmoleit wrote:
> > But now something strange happens, I type in my user and the password at
the
> > gnome desktop login, the screen turns black and after a certain amount
of
> > time the box comes back with the Gnome login prompt (where I started
from)?
>
> Gnome is a known consumer of colour resources, and it's applications
> aren't very graceful when they run out (as they do with our 8 bit
> framebuffer), it could be that you are simply running out of them.
>
> You can use a true colour visual at this depth (the colours are pretty
> ratty, but at least you never run out) by adding
>
> Visual "TrueColor"
>
> To the SubSection "Display" part that covers you.
>
> James
>
>
>
