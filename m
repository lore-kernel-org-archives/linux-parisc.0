Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06775
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 18:54:28 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 3 Jan 2001 01:57:49 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14DdBC-0007qf-00; Wed, 03 Jan 2001 01:57:30 +0000
Date: Wed, 3 Jan 2001 01:57:30 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Jeffrey A Law <law@redhat.com>, Paul Bame <bame@fc.hp.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli?
Message-ID: <20010103015730.D25349@parcelfarce.linux.theplanet.co.uk>
References: <27911.978466673@upchuck> <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101031235310.24351-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Jan 03, 2001 at 12:46:52PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 03, 2001 at 12:46:52PM +1100, Alan Modra wrote:
> The real reason that we currently need separate millicode routines for
> each shared lib is that linkage to millicode functions is different than
> for normal functions.  In particular, you don't want to load r19 (32 bit

is there a good reason to keep the millicode calling conventions?

-- 
Revolutions do not require corporate support.
