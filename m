From: j.raspe@t-online.de (Johannes Raspe)
Subject: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Fri, 29 Oct 2004 21:35:18 +0200
Message-ID: <200410292135.19207.j.raspe@t-online.de>
References: <200410031355.12116.j.raspe@t-online.de> <200410282250.21583.deller@gmx.de> <200410282351.40342.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: "Andy Walker" <ajwalker@broadpark.no>,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <j.raspe@t-online.de>
In-Reply-To: <200410282351.40342.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

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
The hppa "boot-penguin" looks a little bit psychedlic but everything, included 
X-server with "DefaultDepth 24", runs fine.
Will this patch make it into the kernel tree?

Many thanks for your work

Johannes

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
