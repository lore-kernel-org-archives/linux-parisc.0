From: Meelis Roos <mroos@linux.ee>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 23:12:38 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1612052309450.4997@math.ut.ee>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi> <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > Do I read it correctly that it creates PROT_NONE mapping on file opened
> > > O_RDWR, then tries to create a PROT_READ|PROT_WRITE mapping from the
> > > same file at fixed location and fails?
> > >
> > > Why should it fail - because the fixed location is not suitable?
> > This is known longstanding issue:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=19838
> But why has it come back?  What kernel and glibc versions are you using?  This

sys-libs/glibc-2.22-r4 on Gentoo, for May  2  2016 (the default for 
hppa on Gentoo).

> patch was supposed
> to have fixed issue:
> http://marc.info/?l=git-commits-head&m=138617700412279&w=2
> 
> I think the local-shmlba.diff patch was removed but I can't check at the
> moment.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=725508

Should have been upstreamed in 2014?

-- 
Meelis Roos (mroos@linux.ee)
