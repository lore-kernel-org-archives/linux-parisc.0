Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA09068
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 13:52:30 -0700
Message-Id: <199911162052.PAA01909@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: bame@debian.fc.hp.com (Paul Bame)
Date: Tue, 16 Nov 1999 15:52:48 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911162018.NAA15083@debian.fc.hp.com> from "Paul Bame" at Nov 16, 99 01:18:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> The _end symbol is not a reliable indicator of where
> the kernel's memory ends.  And the hpux
> bootloader doesn't provide the SOM header from whence this could
> theoretically be calculated.  I haven't tried out the _end trick
> posted last week, but it looks like it'll work (don't call the symbol
> _end if you try it).  As long as your kernel links, the guess is
> probably OK for now.

Ok, I see the problem now.  The section $DLT$ contains a bunch of
undefined common symbols as well as _end.  For example,

boot_cpu_data       |       416|undef |common |$CODE$

The _end defined by the linker is the end of the bss section but not
the end of last section of the kernel.

Why is boot_cpu_data in $CODE$ rather than $DATA$?  There may be
some incorrect .section/.subsection directives somewhere (probably
in the include files).

--
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
