From: j.raspe@t-online.de (Johannes Raspe)
Subject: Fwd: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Fri, 29 Oct 2004 22:28:14 +0200
Message-ID: <200410292228.14940.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: ajwalker@broadpark.no,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de
Return-Path: <j.raspe@t-online.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

I just noticed that I lost my text-console. Don't know if this is the patched 
stifb.c (I cant' check either :-)). The getty processes are started on tty1 
to tty6, but switching to those consoles with "CTRL+ALT+F1-6" only gives a 
black screen.
After switching system-console to graphics there are no bootmessages, I have 
to switch back to serial console to see them.
X-Server still is working fine.

Any suggestions?

Best regards Johannes

----------  Weitergeleitete Nachricht  ----------

Subject: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Freitag, 29. Oktober 2004 21:35
From: Johannes Raspe <j.raspe@t-online.de>
To: Helge Deller <deller@gmx.de>
Cc: "Andy Walker" <ajwalker@broadpark.no>, parisc-linux@lists.parisc-linux.org

Am Donnerstag, 28. Oktober 2004 23:51 schrieb Helge Deller:
> Hi,
>
> could you please test this patch to stifb.c ?
> It compiles, but is else absolutely untested....
>
> Helge

Hi Helge,

you are a wizard!!
After patching and compiling a 2.6.9-bk6-pa7-kernel it boots fine in 32bpp,
did not try 8bpp yet, but could do so if useful.
The hppa "boot-penguin" looks a little bit psychedlic but everything,
 included X-server with "DefaultDepth 24", runs fine.
Will this patch make it into the kernel tree?

Many thanks for your work

Johannes

--
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105

-------------------------------------------------------

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
