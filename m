Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA06079
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 04:25:06 -0600
Message-ID: <39324625.977B5A74@storm.ca>
Date: Mon, 29 May 2000 06:27:49 -0400
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
To: "Peter A. Peterson II" <pedro@flynn.zork.net>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
References: <20000529024931.B11779@flynn.zork.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Peter A. Peterson II" wrote:
> 
> I'm awaiting the day when I can fool around with Linux on my E-45, but
> in the meantime, I'm trying to use it's tape drive to back up my
> traditional Linux boxen via piping a tarball through ssh.  However, ssh
> needs a random generator (like /dev/urandom/) and I don't know what an
> HP-UX equivalent might be, or how to go about installing one.
> 
Since you want to use it for crypto, this is a fairly difficult
problem. The numbers don't just need to have a nice distribution;
they have to be highly unpredictable, even to the cleverest, most
persistent and best-equipped opponent you might encounter.

The standard reference is RFC 1750.

A page with quite a lot of discussion of Linux /dev/random is at:
http://www.openpgp.net/random/index.html
There's a bunch more in Linux kernel mailing list archives.

Bruce Schneier and a few others have done quite a bit of research on
weaknesses of random number generators and  designed a generator called
Yarrow. Source (Windows only last I looked) is freely available from
counterpane.com.
