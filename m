Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA08262
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 09:33:06 -0600
Date: Mon, 29 May 2000 10:33:28 -0500
From: "Peter A. Peterson II" <pedro@flynn.zork.net>
To: Sandy Harris <sandy@storm.ca>
Cc: "Peter A. Peterson II" <pedro@flynn.zork.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
Message-ID: <20000529103328.C11779@flynn.zork.net>
References: <20000529024931.B11779@flynn.zork.net> <39324625.977B5A74@storm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39324625.977B5A74@storm.ca>; from sandy@storm.ca on Mon, May 29, 2000 at 06:27:49AM -0400
Sender: "Peter A. Peterson II" <pedro@flynn.northpark.edu>
List-ID: <linux-parisc.vger.kernel.org>

Quoting Sandy Harris:
> "Peter A. Peterson II" wrote:
> Since you want to use it for crypto, this is a fairly difficult
> problem. The numbers don't just need to have a nice distribution;
> they have to be highly unpredictable, even to the cleverest, most
> persistent and best-equipped opponent you might encounter.

This is quite true... but for now, I'd settle on making ssh work,
since there is nothing of great value on the HP box, I'm just looking
for a way to kludge ssh into working.

> 
> The standard reference is RFC 1750.
> 
> A page with quite a lot of discussion of Linux /dev/random is at:
> http://www.openpgp.net/random/index.html
> There's a bunch more in Linux kernel mailing list archives.
> 
> Bruce Schneier and a few others have done quite a bit of research on
> weaknesses of random number generators and  designed a generator called
> Yarrow. Source (Windows only last I looked) is freely available from
> counterpane.com.

I will look into this -- thanks.

pedro

-- 
-----------------------------------------------
      "She's laughin in her sleeve, boys;
   I can feel it in my bones."  -- Tom Waits
-----------------------------------------------
