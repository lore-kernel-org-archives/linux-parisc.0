Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA28176
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Dec 1999 11:24:40 -0700
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199912241826.NAA26906@lucifier.dial-up.user.akula.net>
Subject: Re: [parisc-linux] Firmware (was How to set serial ..)
In-Reply-To: <38635E6D.322C282A@storm.ca> from Sandy Harris at "Dec 24, 99 06:52:13 am"
To: sandy@storm.ca (Sandy Harris)
Date: Fri, 24 Dec 1999 13:26:50 -0500 (EST)
Cc: parisc-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Sandy Harris:
> Tom Gallagher wrote:
> 
> > ...  Before I managed to do this I upgraded it to the
> > lastest firmware.
> 
> How does one do that?
there is a bootable image somewhere on hp site.
one should boot either from spare disk or over the network.
the image itself will perform an upgrade.
one caution, it upgrades the graphics eprom as well and
changes the video mode.
the cure is to type blindly the boor_admin command to change to whatever
resolution one had before the upgrade.

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
