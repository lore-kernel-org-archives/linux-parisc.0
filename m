Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0921A482A
	for <parisc-linux@parisc-linux.org>; Thu, 14 Jun 2001 01:59:10 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Byte mode STI roms
Date: Thu, 14 Jun 2001 09:58:34 +0200
References: <20010614023210.A11525@solo.franken.de>
In-Reply-To: <20010614023210.A11525@solo.franken.de>
MIME-Version: 1.0
Message-Id: <20010614075910.0921A482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Thomas,

> I've played a little bit with the stifb on my C200 with a HCRX24 and got
> the stifb to recognize it as valid card. My approach was to just get rid
> of that funky STI_Uxx macros by copying the byte rom into memory and
> adjusting the offsets. This way sticon-wmode.c and sticon-bmode.c are
> nearly the same and with a little bit more tweaking I could get them
> merged.

Great !

> So is there a deeper magic hidden why bmode is done the way it is, or
> should I clean up my code and check it in ?

No, there is no real deeper magic the way it is done now. It's just, that the 
sti[wb]con code has already went through quite a number of development 
cycles. 
At the beginning both had the complete console-code in them with just some 
tweaks for the mode, now they are in a state where both files just provide 
callbacks for sticore.c.
And the real goal is to have both files merged in a clean manner. This is why 
I'm really interested to see your patch. But in any case I would like if you 
would send the patch to the list prior checking it in. 

> PS: No, stifb doesn't work on the HCRX24, yet. It gets initalized, but
> still doesn't show anything.

It's because the stifb code does not have any HCRX24 specific code in it yet. 
I'll look if I can add it today - it shouldn't be that much.

Greetings,
Helge
