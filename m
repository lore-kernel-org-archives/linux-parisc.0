Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA30545
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 14:18:39 -0700
Message-Id: <200101042122.NAA27934@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Date: Thu, 4 Jan 2001 13:20:04 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Grant Grundler" <grundler@cup.hp.com>
Cc: <law@redhat.com>, "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
        "Alan Modra" <alan@linuxcare.com.au>, <bame@fc.hp.com>,
        <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>Where does support for HPUX built apps fit into the picture?
>
>I thought a long term goal is to support HPUX built apps to run under
>parisc-linux. Eg it would be really cool if we could run the HPUX
>X11 server...

If they're built on HP-UX, they will already have been linked with the 
HP-UX millicode library.

-cary
