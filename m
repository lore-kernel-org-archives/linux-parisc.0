Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA02253
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Mar 2000 02:09:17 -0700
Received: from proxy.ats.nld.alcatel.nl (proxy.ats.nld.alcatel.nl [138.203.176.252])
	by btmplq.god.bel.alcatel.be (8.9.3+Sun/8.9.1) with ESMTP id LAA26786
	for <parisc-linux@thepuffingroup.com>; Wed, 29 Mar 2000 11:08:59 +0200 (MET DST)
Received: from nlsols1.ats.nld.alcatel.nl (nlsolnfs [138.203.176.15])
	by proxy.ats.nld.alcatel.nl (8.8.8/8.8.8) with ESMTP id LAA14608
	for <parisc-linux@thepuffingroup.com>; Wed, 29 Mar 2000 11:05:40 +0200 (MET DST)
Received: from ats.nld.alcatel.nl (beerse@nlhw02 [138.203.176.72])
	by nlsols1.ats.nld.alcatel.nl (8.9.1/8.9.1) with ESMTP id LAA03981
	for <parisc-linux@thepuffingroup.com>; Wed, 29 Mar 2000 11:02:22 +0200 (MET DST)
Sender: beerse@ats.nld.alcatel.nl
Message-ID: <38E1C69C.1BEB8F9C@ats.nld.alcatel.nl>
Date: Wed, 29 Mar 2000 11:02:20 +0200
From: Corne Beerse <beerse@ats.nld.alcatel.nl>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Couple of questions
References: <852568B0.005CB5C5.00@tormta3.tor.cel.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

davisg@Celestica.com wrote:
> 
> Greetings,
> 
> Corne' Beerse wrote:
> >
> > As I read this, the TOC button can have the next implementations:
> > - hardware reset, as the button on intel platforms
> > - three finger salute (<ctrl><alt><del>) as on intel platforms
> > - Boot prom prompt (if available, like Sun's <Stop><A>)
> > - Kernel core dump and [stop|halt|reboot|continue|shutdown]
> > - What does HPUX with it?
> > a combination of the above.
> 
> HP-UX provides an OS_TOC vector which is invoked by the platform firmware's
> PDCE_TOC handler. When control is transferred to the OS_TOC handler, the OS
> proceeds to perform a core dump. Then reboots (resets) the system.
> 
> >
> > The main reason for this button is a kernel debugging aid. Not that I'm a
> > kernel hacker, I follow this group out of interest.
> 
> Correct! TOC is used as a diagnostic tool when debugging systems which appear
> to be hung and are no longer responding, i.e. TOC is a high priority interrupt
> (although it's not technically classified as an interrupt - rather, it is a
> special form of reset which preserves machine state) which ideally invokes
> a core dump then reboots (resets) the system. The core can then be reviewed
> after reboot to determine the potential cause of the hang condition.
> 
> >
> > BTW, Where can I find this TOC button on my 9000/712/60 machine? is it the
> > white button on the front? If so, please give some software control to it.
> > In the past, I frequently pushed my keyboard against it, rebooting the
> > machine while typing......
> >
> 
> There is no TOC button available on the Model 712. A special debug card is
> used by HP hardware and OS developers for TOC among other things on this
> platform.
> 
> BTW, the white button on the front left side of the Model 712 is a soft
> power switch. Upon initial application of power, the switch operates as
> a hard power switch which immediately affects the power supply state (ON/OFF).
> After the OS (HP-UX) has booted and initialized, a bit buried in the Lasi
> power control register can be flipped by the OS to enable the soft power
> feature which, with proper setup of the hardware and inclusion of the
> necessary OS hooks, invokes an interrupt when depressed thus allowing
> a clean shutdown of the system, i.e. the soft power switch interrupt
> handler invokes 'shutdown -h now' to perform a clean unmount of all
> file systems, etc,. Note that not all systems which use Lasi utilize
> this feature - some don't implement any form of soft power feature,
> while others use a different method entirely. But in the case of the
> Model 712...

To my experience, in power-off state it is the power-on. I think it is a
pushbutton which activates a hold-relais to keep the power on. In power-on
mode it invokes `shutdown -h now` as you describe. This is on a machine
running HPUX 10.20, same experience (as I recal by head) on 10.10, 10.01 and
9.x.

For the ease of use in the future, my wich is to control the behavoure from
linux. I think of an entry in the init.tab file, similar to the
<ctrl><alt><delete> entry which is in there for intel platforms. For Sun
sparc machines, there is a similar switch. How is that handled in sparc
linux?

CB

btw, if I reply to messages received trouth parisc-linux@thepuffingroup.com,
it replies only to the originator, not to the puffin list. Other maillists
generate a Reply-to: header line with the maillist address. Can this be
added to the puffin headers too? Or are there reasons not to do it?

-- 
Everything should be as simple as possible but not simpler - A. Einstein
Corne' Beerse					| Alcatel Telecom Nederland
mailto:beerse@ats.nld.alcatel.nl		| Postbus 3292
talkto:+31(70)3079108 faxto:+31(70)3079191	| NL-2280 GG  Rijswijk
