Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA21773
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 09:54:18 -0600
Message-Id: <199910221553.LAA01916@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] rbooting an 735?
To: bame@debian.fc.hp.com (Paul Bame)
Date: Fri, 22 Oct 1999 11:53:51 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: simen-tt@online.no, parisc-linux@thepuffingroup.com
In-Reply-To: <199910221503.JAA22360@debian.fc.hp.com> from "Paul Bame" at Oct 22, 99 09:03:57 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> = Is anybody rbooting an 735?

I am not rbooting but recent kernels that I have built up to
yesterday hang with no console output after the ipl boot message
I couldn't define CONFIG_IODC_CONSOLE with yesterday's sources
because the procedure iodc_con_init is not defined anywhere.
There also needs to be definitions for inb, outb, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
