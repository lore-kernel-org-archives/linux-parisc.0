Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA13649
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 05:46:19 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 12:48:56 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 589CCB005; Wed,  6 Dec 2000 12:44:16 +0000 (GMT)
Date: Wed, 6 Dec 2000 12:44:16 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hppa64 gcc sizeof() bug?
Message-ID: <20001206124416.V7166@linuxcare.com>
References: <20001206115203.Q7166@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001206115203.Q7166@linuxcare.com>; from rhirst@linuxcare.com on Wed, Dec 06, 2000 at 11:52:03AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 06, 2000 at 11:52:03AM +0000, Richard Hirst wrote:
> Hi Alan,
>   The following shows the compiler getting confused over the size
> of a struct.  This is with a gcc/binutils built since the last
> fix you did for me.

As Alan has kindly pointed out to me, I goofed.  In my defence, I
did copy the garbage code from the sparc64 port ;)

Richard
