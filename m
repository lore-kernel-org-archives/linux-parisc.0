Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-07.iinet.net.au [203.59.3.39])
	by dsl2.external.hp.com (Postfix) with SMTP id 665AF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 01:01:37 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id PAA00662
	for parisc-linux@lists.parisc-linux.org; Thu, 30 Aug 2001 15:01:29 +0800
Date: Thu, 30 Aug 2001 15:01:27 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [newbie] gcc/glibc problems
Message-ID: <20010830150125.D16220@neep.com.au>
References: <sb8df3d6.032@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sb8df3d6.032@ms-zrt1>; from Jurriaan.Kalkman@zrt.nl on Thu, Aug 30, 2001 at 08:02:20AM +0200
List-ID: <linux-parisc.vger.kernel.org>

Quoth Jurriaan Kalkman:
> >do you have libc6-dev installed?
>
> Hmm, I'd have to check that - but shouldn't that be a dependency, if
> it's needed for even the simplest use of gcc?

Interestingly, no.  Use of gcc does not necessitate use of the libc 2.2
headers.  While I suppose it would be very unusual to not use the
installed libc they've not made it such that you are forced to.

> I'm sorry if this goes off-topic here, I'll try not to bother this
> list with debian questions.

There's the debian-hppa list too.  =)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
