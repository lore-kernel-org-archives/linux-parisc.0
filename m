Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA15914
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 18:30:35 -0600
Message-ID: <00dc01beb6c6$3fec8e80$6e7a0e0f@rr701542.cup.hp.com>
From: "Richard J. Rauenzahn" <rrauenza@cup.hp.com>
To: "Steven Pritchard" <steve@osiris.silug.org>,
        <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] HP-UX 11.0 binaries
Date: Mon, 14 Jun 1999 17:30:19 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

>Probably the quickest way to install any of the above is to gunzip the
>file, then do "swinstall -v -s foo-xxx.depot foo".  (I'll try to type
>up some more detailed instructions, plus some instructions for
>creating the packages, later in the week.)


The easiest is probably ...

    $ swinstall -v -s /path/foo.depot \*

Be sure to start the depot path with a path starting with / or SDUX gets
confused -- it will think you're trying to access a remote depot.

Thanks for packaging those up!

Rich
