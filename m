Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA00368
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 08:06:08 -0600
Message-Id: <199906111406.KAA01206@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: law@cygnus.com
Date: Fri, 11 Jun 1999 10:06:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <18273.929092119@upchuck.cygnus.com> from "Jeffrey A Law" at Jun 11, 99 03:08:39 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <3760CF80.887DA4C3@thepuffingroup.com>you write:
>   > Okay, I'm a bit better off now.  I've at least located the problem.  I
>   > copied the IPL straight out of Jason's binary, rebuilt, and it boots. 
>   > The next task is to figure out why the cross compiled version of ipl is
>   > broken, and how to fix it.
> It could well be an endianness problem in the ELF tools if that's what you
> are using to build stuff.

While there could be an endianness problem, I think it more likely that
it is how IPL is being linked and extracted into the LIF image.  Jason's
link options, "-R 0 -N", specified a text origin of 0 and data following
the text.  I think the default for ELF is to place the text at 0x1000 and
data at 0x40000000.  The gnu ld equivalent for "-R 0" would appear to
be "-Ttext 0".  I am not sure there is a direct equivalent for "-N".
Maybe, you could use "-Tdata" to set the data location.  Maps might be
useful to sort out what is going on.  Also, the SOM and ELF headers at the
beginning of each binary may differ in size.  When I tried "-Ttext 0",
the size of the ELF header seemed to change in size.  I think there
is info in the header about its size, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
