Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id D86AE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 11:47:18 -0700 (MST)
Date: Mon, 3 Feb 2003 18:47:11 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: "Martin K. Petersen" <mkp@mkp.net>
Cc: baddy@free.fr, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] B132L+ and PCI cards
In-Reply-To: <yq1smv5p7pd.fsf@austin.mkp.net>
Message-ID: <Pine.LNX.4.44.0302031815270.28090-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 3 Feb 2003, Martin K. Petersen wrote:

> baddy> I've got a B132L+ with which I am trying to have a 16 ou 24
> baddy> bits (better than the original 8-bits framebuffer mode) : I've
> baddy> inserted a S3Trio64V2/DX based card but the B132L+ lock at
> baddy> boot.
>
> Unfortunately it seems that HP has a check in the firmware that only
> allows booting with HP-branded graphics cards.

Not entirely correct.

You can boot with any PCI-graphics card, but you won't see any output
until X is started (see below). However I haven't heard of anybody that had
success with PCI graphic cards other than the Visualize-EG (well, perhaps
the Voodoo2 with that special framebuffer driver, but I'm not sure)!


> I have tried several brands in both C160 and C3000, and both machines
> refuse to boot with non-HP graphics cards installed.

That's because you probably are using STIcon as default (and not console).
STIcon/STIfb only works with HP graphics cards. I assume by plugging in
the PS2 keyboard and mouse (which are needed to use X, of course) palo
automatically decides to use STIcon instead of serial console.


If you want to run a non-HP graphics card, lets say any ordinary PCI
graphics card taken out of a Intel-PC, then you have to use the serial
console (specify it in palo.conf, do not only use the default automatic
detection), so you won't see anything on the screen until X is started.
You also can't switch between virtual consoles. The reason for that is the
following:

You also can't use the normal Linux framebuffer drivers, since these
assume that the graphics card was initialized first by the BIOS/PDC/SRM
(for that reason the XFree86 server has a small Intel-Emulator built-in
to be able to initialize graphics cards on non-Intel platforms itself).

Well, the PDC doesn't initialize non-HP graphics cards - actually doesn't
support them at all - so you also can't use STI in combination with
non-HP cards. This means you won't see any kernel messages on the screen,
since for that either STIcon or a Linux framebuffer driver is needed.

Most of the 'generic' framebuffer drivers are just written, tested and
used on ix86 (or maybe Alpha) anyway, so the best bet to make a non-HP
graphics cards running on Linux/PA-RISC is XFree86.


greetings max
