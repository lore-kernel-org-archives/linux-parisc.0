Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA27503
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 14:49:24 -0600
Message-Id: <199910282045.QAA01929@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hack to use HPUX boot loader
To: phi@hpfrcu03.france.hp.com (Philippe Benard)
Date: Thu, 28 Oct 1999 16:45:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, alan@lxorguk.ukuu.org.uk,
        Helge.Deller@ruhr-uni-bochum.de, parisc-linux@thepuffingroup.com
In-Reply-To: <3818B159.958F6B13@hpfrcu03.france.hp.com> from "Philippe Benard" at Oct 28, 99 10:26:01 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > If
> > Linux was relocated at addresses near zero, this would result in
> > user programs having to start at addresses larger than the amount
> > of memory used by the kernel, which would be weird.
> > 
> >         -P
> 
> Does someone knows how linux will use the hppa quadran (space) for both
> kernel-mode and user-mode for 32bit processor (and 64bit processors running
> narrow), this somewhat influance mmap(), or more generally the virtual adress
> space usage/limitation.
> 
> If someone envisioned the hppa 64 bits wide it would be nice to know as well
> the layout and space convention too, this would help to see how narrow binary
> could run on a wide kernel.

Docs for 32 & 64 bit runtime environments can be found at
<http://www.software.hp.com/STK/toc.html>.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
