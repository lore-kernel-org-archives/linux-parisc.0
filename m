Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA28597
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Aug 2000 14:11:17 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 9 Aug 2000 14:11:22 -0000
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Tara Dear <tdear@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] recipe
References: <39864BF4.4FD098D0@linuxcare.com> <3990EB35.D33C40BF@uswest.net>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 09 Aug 2000 10:11:11 -0400
In-Reply-To: Ryan Bradetich's message of "Tue, 08 Aug 2000 23:25:09 -0600"
Message-ID: <87n1imo77k.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich <rbradetich@uswest.net> writes:

> Unfortunately, the current glibc cvs source will not build for me

> ../sysdeps/unix/sysv/linux/sigaction.c: In function `__sigaction':
> ../sysdeps/unix/sysv/linux/sigaction.c:77: structure has no member named
> `sa_restorer'

Urgh.  This is my fault.  Sorry, I forgot to actually test that patch
to glibc it seems.  Fixing it now.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
