Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA07395
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 19:31:59 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Jan 2001 02:35:14 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA21756;
	Wed, 3 Jan 2001 13:34:04 +1100
Date: Wed, 3 Jan 2001 13:34:04 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
cc: Jeffrey A Law <law@redhat.com>, Paul Bame <bame@fc.hp.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli?
In-Reply-To: <20010103015730.D25349@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0101031327250.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 3 Jan 2001, Matthew Wilcox wrote:

> is there a good reason to keep the millicode calling conventions?

It's faster and doesn't require that gcc reload gp.

-- 
Linuxcare.  Support for the Revolution.
