Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA19835
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 10:55:37 -0700
Date: Mon, 15 Jan 2001 11:57:06 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100 
In-Reply-To: <200101151729.JAA10108@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101151144470.23087-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 15 Jan 2001, Grant Grundler wrote:

> Greg Ingram wrote:
> > I was trying vmlinux-20001018 from the FTP site.
> 
> Did you read the FAQ? (Hint: question 5)

Yes, but...

> Step 2 says: Use a lifimage (not vmlinux)

Anybody got one?  
 
> Unfortunately, mkp's answer is now horribly stale.
> Claims which are no longer accurate include:
> o HPUX is required to build a lifimage (XC and native builds work on occasion)
> o mongoose (HPUX) boot loader is an option (PALO required)
> o Serial console required (can use STI now)
> o mkp is working on superio ;^)

I don't have an environment to build my own kernel image yet. Obviously I
can't do a native build.  And I've got almost a week of HP/UX experience
now.  :)  What does it take to build a kernel under HP/UX?  I'm guessing
GCC+Binutils+Make as a minimum.  What are my chances with the
cross-compiler?

- Greg
