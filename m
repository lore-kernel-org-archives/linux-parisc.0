Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04958
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 08:16:31 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 14:17:55 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems with gcc 2.96
References: <20000709150024.A16294@vodka.thepuffingroup.com> <Pine.LNX.4.21.0007100959080.684-100000@front.linuxcare.com.au> <20000710082844.C16294@vodka.thepuffingroup.com> <87snticcfz.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 10:16:41 -0400
In-Reply-To: David Huggins-Daines's message of "10 Jul 2000 10:00:32 -0400"
Message-ID: <87lmzacbp2.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> I've already told willy this, but this is due to the C++ support.
> Configure with --enable-languages=c for the time being until it's sorted.

Ah, sorry, it happens if you configure glibc without linuxthreads
support (because, then, you have no spinlocks, obviously).  It seems
that we've already got the appropriate locking primitives
there... trying it now.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
