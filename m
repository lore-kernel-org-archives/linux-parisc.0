Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA24840
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 10:56:17 -0600
Message-Id: <199906181656.JAA12339@cllmail.cup.hp.com>
Subject: Re: [parisc-linux] A quick update
Date: Fri, 18 Jun 1999 09:58:18 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
        "Alex deVries" <adevries@thepuffingroup.com>
cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>The -N places the $DATA$ section after
>the $CODE$ section in low memory.  The +n option that was being used
>in the Makefile has the $DATA$ section in the 0x40000000 quadrant.  
>This is wrong for the kernel.

The opposite of -N is -n, not +n. The +n option tells the linker to 
search archive libraries iteratively, which I believe is needed for the 
Linux kernel.

The -N option tells the linker to build a "non-shareable" executable, so 
it puts text and data together in one segment. The -n option is the 
default, where shareable text is placed in the first quadrant and data is 
placed in the second quadrant.


Cary Coutant
Hewlett-Packard Co.
Application Delivery Lab
