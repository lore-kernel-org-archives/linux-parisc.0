Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23948
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 11:04:08 -0700
Sender: drepper@cygnus.com
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SEGV signal handling bug (dynamic linking)
References: <20001117153954.H32715@linuxcare.com>
	<m3hf5634qx.fsf@otr.mynet.cygnus.com>
	<20001117173818.I32715@linuxcare.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 17 Nov 2000 10:06:21 -0800
In-Reply-To: Richard Hirst's message of "Fri, 17 Nov 2000 17:38:18 +0000"
Message-ID: <m3y9yi1nj6.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

> Yeh, but it works on m68k and i386, and works on hppa if statically
> linked.  And the code is in an example on the mprotect man page on
> my Mandrake7 box.

Then shoot the guy who wrote the man page.  It's wrong and will never
reliably work.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
