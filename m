Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA06105
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 08:59:20 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 15:00:49 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems with gcc 2.96
References: <Pine.LNX.4.21.0007110027540.12784-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 10:59:35 -0400
In-Reply-To: Alan Modra's message of "Tue, 11 Jul 2000 00:38:58 +1000 (EST)"
Message-ID: <877lauc9pk.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> Yeah, I got enthusiastic about implementing linuxthreads, and put in
> support for parisc style spinlocks using ldcw (Load and Clear Word).
> We need to grab a lock by clearing it so the locks need to be initialised
> to non-zero, which is exactly opposite to other glibc spinlocks.  My
> enthusiasm waned when I hit a missing syscall - forget what it was now.

glibc doesn't really want to compile with linuxthreads for me -
something breaks in the way errno is handled and I get "undefined
reference to errno" when linking.

Jes says we don't really want to mess with that stuff until we have
shared libs working, and I'm inclined to trust him on that :-)

I guess for now we can just ignore libstdc++ and friends...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
