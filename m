Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA19681
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 16:29:29 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Aug 2000 16:29:46 -0000
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
References: <200008121607.MAA08061@hiauly1.hia.nrc.ca>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Aug 2000 12:29:31 -0400
In-Reply-To: "John David Anglin"'s message of "Sat, 12 Aug 2000 12:07:56 -0400 (EDT)"
Message-ID: <87itt6moic.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:

> The HP linker `-O' option eliminates unnecessary ADDIL instructions

Yes, currently our code generation is absolute crap, because we are
using ADDIL+LDO sequences for absolutely every DP or DLT
relative/indirect access.

Other BFD and GCC targets have optimizations to use 'short' data, bss,
got, and sometimes plt sections when possible.  Long term I would
really like to implement this for hppa-linux.

I'm not at all sure how this is done though - can anyone point me to
some code or documentation that explains it?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
