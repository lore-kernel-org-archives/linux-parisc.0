Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA26257
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 15:03:36 -0700
Received: from localhost (4210 bytes) by fileserv2.Cologne.DE
	via rmail with P:stdio/R:bind/T:smtp
	(sender: <excalibur.cologne.de!karsten>) (ident <excalibur.cologne.de!karsten> using unix)
	id <m1488QN-0007FSC@fileserv2.Cologne.DE>
	for <parisc-linux@thepuffingroup.com>; Mon, 18 Dec 2000 23:06:27 +0100 (CET)
	(Smail-3.2.0.101 1997-Dec-17 #5 built 1998-Jan-19)
Message-ID: <20001218230325.A934@excalibur.cologne.de>
Date: Mon, 18 Dec 2000 23:03:25 +0100
From: Karsten Merker <karsten@excalibur.cologne.de>
To: Helge Deller <deller@gmx.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
References: <20001217115105.A17378@excalibur.cologne.de> <00121721201800.25726@P100>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <00121721201800.25726@P100>; from Helge Deller on Sun, Dec 17, 2000 at 09:20:51PM +0100
List-ID: <linux-parisc.vger.kernel.org>


On Sun, Dec 17, 2000 at 09:20:51PM +0100, Helge Deller wrote:

> > $CONFIG_FB_STI is set to "y" as can be seen in .config, nonetheless
> > CONFIG_FBCON_STI is not declared. 
> 
> Hi Karsten,
> 
> I can't reproduce your problems with a freshly checked-out tree. Maybe you 
> have wrong permissions on .config or a similiar silly problem ?
> 
> If you check out, please remove your .config and make a new "make menuconfig".
> Now remember to DISABLE (!!) "Support for console on serial port" under 
> "Character Devices" and enable STI-console and STI-fb again.

I did that, but - as I have found out now - something more I should better
not have done :-).
I had activated "Console drivers -> Frame buffer support -> Advanced low
level driver options", and whenever this is selected, CONFIG_FBCON_STI is
not defined. If I unselect it, everything is ok. This is because the code
sequence

      if [ "$CONFIG_FB_STI" = "y" ]; then
         define_tristate CONFIG_FBCON_STI y
      fi

is not called when CONFIG_FBCON_ADVANCED ist set to "y":

   bool '  Advanced low level driver options' CONFIG_FBCON_ADVANCED
   if [ "$CONFIG_FBCON_ADVANCED" = "y" ]; then
      tristate '    Monochrome support' CONFIG_FBCON_MFB
      tristate '    2 bpp packed pixels support' CONFIG_FBCON_CFB2
      tristate '    4 bpp packed pixels support' CONFIG_FBCON_CFB4
      tristate '    8 bpp packed pixels support' CONFIG_FBCON_CFB8
      [... etc. ...]
   else
      [... etc. ...]
      if [ "$CONFIG_FB_STI" = "y" ]; then
         define_tristate CONFIG_FBCON_STI y
      fi
   fi

I had not seen this from the beginning as there are lots of nested
if-then-else blocks, in which I just had missed the point. I had not
thought that selecting CONFIG_FBCON_ADVANCED would be a problem, as the
additional options available when CONFIG_FBCON_ADVANCED is set do not seem
to contain anything regarding the definition of CONFIG_FBCON_STI and I
thought it would only show or hide the submenu. My mistake...

Thanks a lot for your help.

Another thing I would like to ask (please forgive a PA-RISC-newbie if
this is a dumb question, at least this is not mentioned in the FAQ on
parisc-linux.org):

Has anybody tried to run Linux with serial console on a 715/100? When I
boot a kernel without support for STICON but with serial console enabled
(and console=ttyS0 as commandline parameter) the system crashes just after
displaying the "kernel command line" (system console is still in
"graphics" mode - does this make a difference?). 

When using STICON instead, the console output works in principle, but
there is pixel garbage throughout the screen (it looks like it is between
the character cells) after the second "mode switch" (when the first line
on the screen is "Console: switching to colour STI console 160x64"). I
have seen a similar effect on a 712/80 when using STICON. The keyboard
works on the 712/80 but is dead on the 715/100 (in both cases the keyboard
is a ps/2 model, connected directly on the 712/80 and via the small
external adaptor box on the 715/100).

Greetings,
Karsten
-- 
#include <standard_disclaimer>
Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der Nutzung
oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die Markt- oder
Meinungsforschung.
