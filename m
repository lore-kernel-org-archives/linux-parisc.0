Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA09947
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 12:23:42 -0600
Date: Mon, 29 May 2000 13:23:52 -0500
From: "Peter A. Peterson II" <pedro@flynn.zork.net>
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
Message-ID: <20000529132352.D11779@flynn.zork.net>
References: <20000529024931.B11779@flynn.zork.net> <39324625.977B5A74@storm.ca> <20000529103328.C11779@flynn.zork.net> <20000530005500.A28121@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000530005500.A28121@neep.com.au>; from andrew@neep.com.au on Tue, May 30, 2000 at 12:55:03AM +0800
Sender: "Peter A. Peterson II" <pedro@flynn.northpark.edu>
List-ID: <linux-parisc.vger.kernel.org>

Quoting Andrew Shugg:
> You might like to consider using OpenSSH if you don't have any joy with ssh.
> 
> OpenSSH can be compiled[1] without a /dev/*random device by using egd[2], the
> Entropy Gathering Daemon.  OpenSSH also requires installation of zlib and
> openssl though (which is just a bit more effort, but oh well).  I've not used
> egd so can't comment on it, but it's probably worth a go.

I was incorrectly specific. I installed openssh, zlib, and ssleay
already, and in the configure process for openssh it crapped out 
looking for /dev/urandom and/or egd. I think i'll look into egd. 

Thanks all.

pedro

-- 
-----------------------------------------------
      "She's laughin in her sleeve, boys;
   I can feel it in my bones."  -- Tom Waits
-----------------------------------------------
