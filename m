Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC22D482A
	for <parisc-linux@parisc-linux.org>; Tue, 10 Apr 2001 00:58:55 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AD2AF1C.916FDCC2@alcatel.at>
Date: Tue, 10 Apr 2001 08:58:36 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building GDB - how exactly ?
References: <Pine.LNX.4.21.0104101003570.7474-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Thank you very much !

I have especially problems with the gdbserver !
I need it.

With friendly regards
	Christoph Plattner


Alan Modra wrote:
> 
> On Mon, 9 Apr 2001, Christoph Plattner wrote:
> 
> > What are the correct steps to build a working GDB for
> >
> > 1. HOST = i385-linux, TARGET = hppa-linux + gdbserver !
> >       (without server already success, but I am not shure, to have
> >        done it correctly)
> 
> I haven't been building gdb for remote debugging, so I'm not sure how it
> will go.  Should work, I think.
> 
> > 2. Native HPPA-LINUX gdb
> 
> I use the following to build a native gdb using a cross compiler from
> x86-linux
> 
> /src/parisc/gdb/configure --build=i686-linux --host=hppa-linux
> --target=hppa-linux --prefix=/usr --disable-shared --disable-nls
> 
> and the following to build natively
> 
> /src/parisc/gdb/configure --prefix=/usr --build=hppa-linux
> --host=hppa-linux --target=hppa-linux --disable-nls
> 
> It's critical that you have up to date kernel header files available from
> /usr/include/linux and /usr/include/asm, **for a 32 bit kernel**
> regardless of whether you're running a 32 bit or 64 bit kernel.  This will
> probably change soon as the ptrace interface is likely to change.
> 
> --
> Alan Modra
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux


-----------------------------------------------------------------
private:        christoph.plattner@dot.at
company:        christoph.plattner@alcatel.at
