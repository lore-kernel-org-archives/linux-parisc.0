Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA22273
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Nov 1999 13:40:11 -0700
Message-Id: <199911292041.PAA17116@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HPUX 9.05 notes
To: bri@mojo.calyx.net (Brian S. Julin)
Date: Mon, 29 Nov 1999 15:41:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.BSO.4.20.9911291514400.6896-100000@mojo.calyx.net> from "Brian S. Julin" at Nov 29, 99 03:27:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I had similar experiences building under 9.01.

> How far does this get you?  About up to here:
> 
> make
> gcc -D__KERNEL__ -I/linux/linux/include -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -mdisable-fpregs -fwritable-strings
>  -pipe -fno-strength-reduce  -c -o init/main.o init/main.c
> as:  @line#614 [err#1052]
>   Directive name not recognized - BALIGNL
> as:  @line#654 [err#1052]
>   Directive name not recognized - BALIGNL

Are you using as from binutils?  You definitely will not have this problem
with the latest binutils cvs source and probably not with the latest
released version 2.9.1.  Build gcc using --with-gnu-as (see INSTALL
directions for hppa).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
