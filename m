Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11867
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 16:57:25 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Karsten Merker <karsten@excalibur.cologne.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
Date: Wed, 20 Dec 2000 01:00:16 +0100
References: <20001217115105.A17378@excalibur.cologne.de> <00121721201800.25726@P100> <20001218230325.A934@excalibur.cologne.de>
In-Reply-To: <20001218230325.A934@excalibur.cologne.de>
MIME-Version: 1.0
Message-Id: <00122000445401.00303@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 18 December 2000 23:03, Karsten Merker wrote:
> On Sun, Dec 17, 2000 at 09:20:51PM +0100, Helge Deller wrote:
> > > $CONFIG_FB_STI is set to "y" as can be seen in .config, nonetheless
> > > CONFIG_FBCON_STI is not declared.
[snip]
> I had activated "Console drivers -> Frame buffer support -> Advanced low
> level driver options", and whenever this is selected, CONFIG_FBCON_STI is
> not defined. If I unselect it, everything is ok. 
[snip]

Ok, thanks a lot for your investigation. I hadn't realized that and since 
most of the developers use the default config, this problem has not shown up 
yet. 

> Has anybody tried to run Linux with serial console on a 715/100? When I
> boot a kernel without support for STICON but with serial console enabled
> (and console=ttyS0 as commandline parameter) the system crashes just after
> displaying the "kernel command line" (system console is still in
> "graphics" mode - does this make a difference?).

This doesn't happen on my 715/64, which is afaik nearly the same machine as 
yours. And, you don't need "console=ttyS0", but I don't think, that this is 
related to your problem.

> When using STICON instead, the console output works in principle, but
> there is pixel garbage throughout the screen (it looks like it is between
> the character cells) after the second "mode switch" (when the first line
> on the screen is "Console: switching to colour STI console 160x64"). I
> have seen a similar effect on a 712/80 when using STICON. 

Yes, this is a known problem - it happens here too -, but since some of the 
developers currently work on better STI-support this will get fixed in the 
future - and I think this problem was not there, before we merged with linus.

> The keyboard
> works on the 712/80 but is dead on the 715/100 (in both cases the keyboard
> is a ps/2 model, connected directly on the 712/80 and via the small
> external adaptor box on the 715/100).

Hmm, does the other end of this external adaptor on the /100 looks like a 
RJ45-connector? If yes, I assume, that you have a PS/2 keyboard on a 
HIL-adaptor and need the HIL keyboard driver, which should already be enabled 
in defconfig. And the HIL keyboard works for me...
If you could send me your bootlog I could take a closer look at it.

Greetings,

	Helge
