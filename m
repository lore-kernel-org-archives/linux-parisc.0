Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA29013
	for <parisc-linux@puffin.external.hp.com>; Wed, 14 Jun 2000 08:24:29 -0600
Message-Id: <200006141425.KAA26058@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Recipe question
To: catfish@alltel.net (T. Martin)
Date: Wed, 14 Jun 2000 10:25:07 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.10006132357470.6974-100000@jesse.crash.lan> from "T. Martin" at Jun 14, 2000 00:00:04 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>  I'm trying to build the things according to the recipe but theres only
> one question so far. 
>  Whats the best way to install egcs without screwing up the gcc I have
> already installed? 

Use "--prefix=something" to set the installation base directory.  Do this
for both binutils and gcc.

Use "configure --help" to see all build options.  Sometimes subdirectories
have different options.

>  egcs builds clean so should I have reseverations about overwriting my
> current gcc?

Yes.  Keep your current gcc.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
