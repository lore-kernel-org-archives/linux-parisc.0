Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 83C9748BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 12:48:29 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Sun, 14 Mar 2004 20:48:27 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
In-Reply-To: <20040314073706.GA28440@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403142048.27506.deller@gmx.de>
Cc: Martin Schulze <joey@infodrom.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 14 March 2004 08:37, Martin Schulze wrote:
> > In the latest 2.6 kernel series, we switched from a parisc-only
> > PS/2 mouse/keyboard driver to the standard linux kernel PS/2
> > mouse keyboard drivers.
> 
> Makes sense.  However, would it be useful to add this to the config
> help texts?  Same for the dependency of a HIL mouse to the MOUSE_PS2,
> if HIL always takes PS/2 mice.  I know this is not the case in general,
> since my 425 uses HIL but doesn't use PS/2, but then again, it's m68k
> and not parisc.  However, it may be the case on PA-RISC, I don't know.
> In that case it may make sense to rearrange the ordering and move
> MOUSE_HIL up so it can pre-select MOUSE_PS2.
> 
> Anyway, here's a short improvement for the MOUSE_PS2 help text:
> 
> --- Kconfig.orig	Sun Mar 14 08:27:51 2004
> +++ Kconfig	Sun Mar 14 08:31:18 2004
> @@ -22,7 +22,8 @@
>  	  Say Y here if you have a PS/2 mouse connected to your system. This
>  	  includes the standard 2 or 3-button PS/2 mouse, as well as PS/2
>  	  mice with wheels and extra buttons, Microsoft, Logitech or Genius
> -	  compatible.
> +	  compatible. This also includes a PS/2 mouse connected to your HIL
> +	  hub on PA-RISC.
>  
>  	  Synaptics TouchPad users might be interested in a specialized
>  	  XFree86 driver at:

Hi Joey

I don't know if this makes sense to be too verbose here....
"...a PS/2 mouse connected to your system..." looks pretty ok, independed
if it is connected to a HIL hub or not.

Helge
