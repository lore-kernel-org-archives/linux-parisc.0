Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3712C482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 02:31:43 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Date: Sun, 15 Sep 2002 10:31:16 +0200
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
References: <200209150209.46701.deller@gmx.de> <3D840C5E.2080405@charter.net>
In-Reply-To: <3D840C5E.2080405@charter.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200209151031.16912.deller@gmx.de>
Subject: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
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

Hi Douglas,

it's safe to enable both (stifb and sstfb), in which case one of
them is /dev/fb0 (presumably the sstfb) and the other /dev/fb1 (stifb).
If you hook them up to different monitors you can use both graphic
cards at the same time. If you connect them in chain, only the
sstfb will be visible.

Greetings,
Helge

On Sunday 15 September 2002 06:28, B. Douglas Hilton wrote:
> Fantastic! I was tinkering with this but I stalled out. I had
> to cart my C200 in to work to use as a prototype server machine
> for a proof of concept on a new project, but I will be sure to
> give it a whirl as it still has the V2 inside it.
>
> This might really help the project as now all the FX guys
> have an inexpensive option for graphics!
>
> When building the kernel should I disable "console on STI fb"
> option then? Did you add a "console on sstfb" option to config?
>
> Can't wait to try it out!
>
> Cheers!
> - Doug
>
> Helge Deller wrote:
> > Hi,
> >
> > there has been some discussions on this lists a few weeks back
> > about getting the Voodoo framebuffer driver  working on HPPA.
> > The attached patch allows me to use my Voodoo 2 with the sstfb
> > framebuffer driver in 16bpp in 640x480, 800x600 and 1024x768
> > resolutions on console and under X.
> >
> > Greetings,
> > Helge
> >
> > NB: This patch is already integrated into the 2.4.19-pa18 kernel and
> > I'll continue to do some more code-cleanups before trying to get it
> > into the official kernel.
> >
> > ...patch removed...
