Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id ACB774857
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 12:46:22 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Martin Schulze <joey@infodrom.org>
Date: Mon, 15 Mar 2004 20:46:13 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403142219.00823.deller@gmx.de>
	<20040315171420.GW9104@finlandia.infodrom.north.de>
In-Reply-To: <20040315171420.GW9104@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403152046.13832.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 15 March 2004 18:14, Martin Schulze wrote:
> > Furthermore you might try to increase the value of mdelay(6); in line 168
> > in file linux-2.6/drivers/input/serio/gscps2.c...
> > Maybe it's a timing issue ?
> 
> Apparently, it was.  I now have keyboard and mouse support.
> I set the delay to 12.

Did you tried any other values between 6 and 12 ?
If a lower value works for you, I would like to put this one in the source....

> > This is what you should have in your .config:
> > CONFIG_SERIO_GSCPS2=y
> > CONFIG_INPUT_KEYBOARD=y
> > CONFIG_KEYBOARD_ATKBD=y
> > CONFIG_INPUT_MOUSE=y
> > CONFIG_MOUSE_PS2=y
> 
> All there.
> 
> Everything's working fine now, btw.

Cool. 

Regards,
Helge
