Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA14339
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Jun 2000 09:45:39 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 15:46:52 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userland test failure
References: <Pine.LNX.4.21.0006291440280.27908-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 29 Jun 2000 11:46:20 -0400
In-Reply-To: Alan Modra's message of "Thu, 29 Jun 2000 14:44:30 +1000 (EST)"
Message-ID: <874s6csd6b.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> -fPIC and -shared are not supported at the moment, even with the newer
> binutils-2.10 module available from puffin CVS.  With binutils-2.10,
> you'll get a different error if you compile with -fPIC, something like:
> "cannot handle relocation R_PARISC_DLTIND21L for .LC0 at 0x28 in .text"

Would I be correct in assuming that the GCC portion of supporting
-fPIC is more or less done, it's just that the linker can't handle the
relocations generated?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
