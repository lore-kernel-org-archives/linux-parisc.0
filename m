Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA26480
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 06:36:38 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39924D81.A570C814@uswest.net>
Date: Thu, 10 Aug 2000 00:36:49 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: David Huggins-Daines <dhd@linuxcare.com>
CC: Tara Dear <tdear@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] recipe
References: <39864BF4.4FD098D0@linuxcare.com> <3990EB35.D33C40BF@uswest.net> <87n1imo77k.fsf@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David,

Thanks for the glibc fix.  That solved the problem.  I have
successfully built all the tools using the recipe.

- Ryan

David Huggins-Daines wrote:

> Ryan Bradetich <rbradetich@uswest.net> writes:
>
> > Unfortunately, the current glibc cvs source will not build for me
>
> > ../sysdeps/unix/sysv/linux/sigaction.c: In function `__sigaction':
> > ../sysdeps/unix/sysv/linux/sigaction.c:77: structure has no member named
> > `sa_restorer'
>
> Urgh.  This is my fault.  Sorry, I forgot to actually test that patch
> to glibc it seems.  Fixing it now.
>
> --
> dhd@linuxcare.com, http://www.linuxcare.com/
> Linuxcare. Support for the revolution.
