Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA25511
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 09:53:28 -0700
From: davisg@Celestica.com
Received: from hivermuet.advantis.ca (hivermuet [198.74.66.3]) by glace.qu.ca.prserv.net (AIX4.3/UCB 8.8.8/8.8.8) with ESMTP id LAA64324 for <parisc-linux@thepuffingroup.com>; Tue, 28 Mar 2000 11:39:16 -0600
To: Corne Beerse <beerse@ats.nld.alcatel.nl>
cc: parisc-linux@thepuffingroup.com
Message-ID: <852568B0.005CB5C5.00@tormta3.tor.cel.com>
Date: Tue, 28 Mar 2000 11:52:42 -0500
Subject: Re: [parisc-linux] Couple of questions
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Greetings,

Corne' Beerse wrote:
>
> As I read this, the TOC button can have the next implementations:
> - hardware reset, as the button on intel platforms
> - three finger salute (<ctrl><alt><del>) as on intel platforms
> - Boot prom prompt (if available, like Sun's <Stop><A>)
> - Kernel core dump and [stop|halt|reboot|continue|shutdown]
> - What does HPUX with it?
> a combination of the above.

HP-UX provides an OS_TOC vector which is invoked by the platform firmware's
PDCE_TOC handler. When control is transferred to the OS_TOC handler, the OS
proceeds to perform a core dump. Then reboots (resets) the system.

>
> The main reason for this button is a kernel debugging aid. Not that I'm a
> kernel hacker, I follow this group out of interest.

Correct! TOC is used as a diagnostic tool when debugging systems which appear
to be hung and are no longer responding, i.e. TOC is a high priority interrupt
(although it's not technically classified as an interrupt - rather, it is a
special form of reset which preserves machine state) which ideally invokes
a core dump then reboots (resets) the system. The core can then be reviewed
after reboot to determine the potential cause of the hang condition.

>
> BTW, Where can I find this TOC button on my 9000/712/60 machine? is it the
> white button on the front? If so, please give some software control to it.
> In the past, I frequently pushed my keyboard against it, rebooting the
> machine while typing......
>

There is no TOC button available on the Model 712. A special debug card is
used by HP hardware and OS developers for TOC among other things on this
platform.

BTW, the white button on the front left side of the Model 712 is a soft
power switch. Upon initial application of power, the switch operates as
a hard power switch which immediately affects the power supply state (ON/OFF).
After the OS (HP-UX) has booted and initialized, a bit buried in the Lasi
power control register can be flipped by the OS to enable the soft power
feature which, with proper setup of the hardware and inclusion of the
necessary OS hooks, invokes an interrupt when depressed thus allowing
a clean shutdown of the system, i.e. the soft power switch interrupt
handler invokes 'shutdown -h now' to perform a clean unmount of all
file systems, etc,. Note that not all systems which use Lasi utilize
this feature - some don't implement any form of soft power feature,
while others use a different method entirely. But in the case of the
Model 712...


Regards,
Geoge G. Davis
Software Engineer,  Celestica Chelmsford Design Center
20 Alpha Road
Chelmsford, MA 01824
