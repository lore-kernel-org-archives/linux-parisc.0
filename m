Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15721
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 13:32:49 -0700
Message-Id: <200011282033.PAA28280@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Include trouble
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 28 Nov 2000 15:33:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@noam.fc.hp.com, alan@linuxcare.com.au, marteaut@esiee.fr,
        parisc-linux@thepuffingroup.com
In-Reply-To: <200011282024.PAA28233@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 28, 2000 03:24:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Maybe it isn't that bad because I noticed at least one port used unsigned
> long long for off_t.

Take that back.  It was __kernel_loff_t.  Just go with

typedef unsigned int	__kernel_size_t;
typedef long            __kernel_off_t;
#ifdef __GNUC__
typedef long long	__kernel_loff_t;
#endif

for the 32 bit port.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
