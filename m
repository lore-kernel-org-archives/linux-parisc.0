Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902070426.WAA03584@tomahawk.rsn.hp.com>
To: hppa-linux@puffingroup.com
cc: jason@gatekeeper.equator.com
Subject: Re: [hppa-linux] Cross compile setup 
Date: Sat, 06 Feb 1999 22:26:11 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
Resent-Message-ID: <"ltd881.0.J5.b0Jls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Jason Eckhardt wrote
> Also, a question to others:
> I have started to tinker with writing an IPL for the native
> port (i.e. bootstrap code). I've been compiling/assembling within HPUX,
> but I can't seem to ascertain how to get "ld" to generate a "straight"
> binary file rather than a SOM object. The bootstrap code obviously
> has to be a plain binary to work. Note that the version of gcc I picked
> up from www.software.hp.com utilizes the HP linker, not GNU ld.

If you haven't already seen them, careful examination of the following
HP-UX man pages will get you a long way toward understanding the typical
boot process:

	boot(1m)
	pdc(1m)
	isl(1m)
	hpux(1m)

Since PDC resides in a ROM, I assume you're talking about building
something analogous to ISL, which resides in a LIF filesystem (see lif(4))
on the boot media and is loaded by PDC.  I think the ISL image is plain
SOM, but you have to be careful to use the correct type when copying it
into the LIF filesystem.

I don't know how much of the boot process you want to replace, but if
you're willing to use the HP-UX ISL and HPUX, at least to get started,
you can fairly easily get things set up to boot your kernel over the net.
710's and 715's use a proprietary protocol called RMP (see rbootd(1m)),
while 712's and newer boxes use BOOTP (see bootpd(1m)).

Booting over the net, combined with using the serial port as the console,
makes things go a lot faster.

-------------
Bjorn Helgaas   helgaas@rsn.hp.com  telnet 1-497-3069  (972)497-3069

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
