Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24.gci.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF6734837
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 08:22:46 -0700 (MST)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id h1LFQlAE018855;
	Fri, 21 Feb 2003 06:26:47 -0900
Date: Fri, 21 Feb 2003 06:26:47 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: PARISC Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] boot console wrong.
In-Reply-To: <20030221082726.GH6523@aurinko.ntc.nokia.com>
Message-ID: <Pine.LNX.4.53.0302210625170.18642@wolf.alaskatech>
References: <3E55A3FC.C06BFE43@optushome.com.au> <20030221082726.GH6523@aurinko.ntc.nokia.com>
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

> > On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:
> >     I have a C-180 and when in the Main Menu (booting) I have previously
> > setup the Console path to Serial, what input do I need to set it back to
> > normal console (Keyboard/screen) ?
>
> > >   Console path:         SERIAL_1.9600.8.none
>
> >     I have installed Debian through this console, and would like to play
> > with it the usual way now ;o)
>
> Um ... "path console graphics" could be a good starting point. It
> probably tells you that "graphics" isn't a good path and shows a list of
> what could be, but that's almost as good.
>
> Not sure though, I haven't had the chance to play with a C180, but that's
> what I do with the other Cxx0s.
> --
> Mikko Nahkola   <mikko.nahkola@nokia.com>

"path console graphics(0)" sets the console to the built-in video on my
C180; graphics(x) (where x is the slot number as printed on the back of
the case) sets it to the video card in that slot...
