Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA18080
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 15:08:17 -0700
Date: Wed, 17 Nov 1999 21:54:06 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        law@cygnus.com, bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735
Message-Id: <19991117215406.C10209@mathe.stud.uni-erlangen.de>
References: <19991117073453.I750@mathe.stud.uni-erlangen.de> <199911171812.NAA17052@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911171812.NAA17052@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> The problem is the kernel can't determine how big its common data section
> is and therefore where free memory should start.

Okay, I didn't take into account we actually want to know where our free
memory starts  -  sometimes being stupid doesn't help.

> There are quite a few big structures and arrays throughout the linux code
> that are global and not initiallized.
> Uninitialized common data can be avoided by using static or explicitly
> initializing the data object (puts data into $DATA$ instead of $DLT$).

> Without the trick, _end is located at the end of the
> bss section.  When "theend" is linked in, _end moves to the end of
> unitialized common data and the kernel can easily determine where free
> memory starts.

Okay, this is a SOM-specific bug around a missing feature of the SOM linker
(i.e. not supporting linker scripts) (tell me if I'm wrong).

> The current hack to determine the start of free memory is to use a symbol
> that is near the end of the common data and add a fudge amount to it.

> This failed for me recently when I built a configuration without network
> support and the symbol was no longer defined.  The size of the common
> data varies depending on kernel configuration as well.

Yeah, this code needs to go / change.

> However, if you explicitly initialize, the size of the kernel will grow.
> I know some systems still allow installation from floppies.  The kernel

PARISC systems ?

> Memory from the start of the bss section to the end of the common data
> should be zeroed.  I presume other free memory will be initialized when
> it is used.

yup, Linux doesn't need to have all available memory zero'd out on boot.

	Philipp Rumpf
