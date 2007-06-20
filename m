From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Unaligned handler broken (kernel BUG at
	mm/mmap.c:1991!)
Date: Wed, 20 Jun 2007 09:43:55 +0200
Message-ID: <JJXC57$BE11CF18636E43122DF924D0D989E207__28456.920621875$1416624398$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>

> Hi Joel,
> 
> Von: "Joel Soete" <soete.joel@scarlet.be>
> > Did your system actually crashed?
> 
> No it didn't.
>  
> > I run your test case and read well same messages on console but my b1=
80
> > runing also 2.6.22-rc5-pa1 (a merge of mine obviously) was still 
> > alive after this run???
> 
> Yes.
> 
> > Even thought I don't know what to thought about ultimate message:
> > "Fixing ... but reboot is needed!"
> 
> Yeah. There is some major bug though : "kernel BUG at mm/mmap.c:1991!"
>  
> > A critical pb would launch a LPMC or a panic?
> 
> That's the worst thing which can happen.
> 
> > Should I actualy reboot it (as it's still alive)?
> 
> I have no idea. Probably the best is to reboot.
> 
Yes I think so too (leds on b180 were flashing badly?)

Thx,
    Joel

> Helge
> -- 
> Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt?
> Der kanns mit allen: http://www.gmx.net/de/go/multimessenger
> 
> =0A---=0Ahttp://www.scarlet.be/
