From: j.raspe@t-online.de (Johannes Raspe)
Subject: Re: Fwd: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Sun, 31 Oct 2004 10:10:47 +0100
Message-ID: <200410311010.47849.j.raspe@t-online.de>
References: <200410292228.14940.j.raspe@t-online.de> <200410300125.12145.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: ajwalker@broadpark.no,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <j.raspe@t-online.de>
In-Reply-To: <200410300125.12145.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

> Hi Johannes,
>
> On Friday 29 October 2004 22:28, Johannes Raspe wrote:
> > I just noticed that I lost my text-console. Don't know if this is the
> > patched stifb.c (I cant' check either :-)).
>
> I don't think so.

I had a strang idea about the text-consoles and it was right: The consoles are 
present, but they are black text on black background.
I can type in commands blindly and they are executed, but I don't see them. So 
it seems to be a minor problem with your patch I think. Somehow the colors 
got screwed up in textmode.

> > The getty processes are started on tty1  to tty6, but switching to those
> > consoles with "CTRL+ALT+F1-6" only gives a  black screen.
>
> Just tested and this works for me on 8bpp with Artist-gfx on a 715/64.
>
> > After switching system-console to graphics there are no bootmessages, I
> > have to switch back to serial console to see them.
> > X-Server still is working fine.
> >
> > Any suggestions?
>
> Do you still boot via serial console or is the cable still connected ?
> If yes, please stop at the IPL and delete the line "console=ttyS0", which
> is auto-appended by palo if you boot from serial console.

No, I changed the path to graphics in boot admin.

> You wrote in another mail:
> > The hppa "boot-penguin" looks a little bit psychedlic...
>
> could you describe this more exactly. Does the colors seem exchanged (e.g.
> red is blue and vice-versa) ?

The background of the penguin is green where it should be black. This is the  
obvious change. The rest just looks weird. If it helps I could make a picture 
of it.

> Helge

Regards Johannes

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
