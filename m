Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01407
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 16:02:59 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 23 Jan 2001 23:06:42 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6C3A7B005; Tue, 23 Jan 2001 22:56:55 +0000 (GMT)
Date: Tue, 23 Jan 2001 22:56:55 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Josiah Carlson <jcarlson@macalester.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crt1.o
Message-ID: <20010123225654.B3571@linuxcare.com>
References: <3A6E07B41A5.2E2CJCARLSON@smtp.macalester.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A6E07B41A5.2E2CJCARLSON@smtp.macalester.edu>; from jcarlson@macalester.edu on Tue, Jan 23, 2001 at 04:37:40PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 23, 2001 at 04:37:40PM -0600, Josiah Carlson wrote:
> To summarize my current installation:
> .5 image copied onto hard drive
> base.tgz installed
> nfsroot from 10-05-2000
> ftp.deb (works great BTW)
> 
> >From here I've tried to configure MPICH for compilation...though I keep
> getting a crt1.o not found error, even though it exists in /usr/lib.

The quote below is from last October - don't know if it will help
you.

Richard


> > 10:~# make mlock 
> > cc     mlock.c   -o mlock
> > /usr/bin/ld: cannot open crt1.o: No such file or directory
> > collect2: ld returned 1 exit status
> > make: *** [mlock] Error 1
> > 
> > 
> 
> According to Bdale, the fix is:
> 
> ln -s /usr/lib /usr/hppa-linux/lib
> 
> randolph
