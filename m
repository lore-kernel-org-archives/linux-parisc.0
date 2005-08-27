From: Vesa Ruokonen <vesa.ruokonen@gmail.com>
Subject: Re: [parisc-linux] HP9000, K Class - K420 ->boots linux?
Date: Sat, 27 Aug 2005 20:03:00 +0300
Message-ID: <92dc102905082710036bd21cb3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> How does parisc-linux go with the K420
> these days?  Will it boot?

It works here on K380, 3 CPU's, but not as easily as on newer hw.
Debian (Sarge 3.1r0a) netinst loads the kernel, but fails too soon (no
multiuser and no console I recall).
Gentoo has fully working livecd, which boots on K class too. Someone
recommended to use the last image from 2004. So I would recommend
playing with Gentoo for now.

But there's a new problem with latest kernels too. 2.6.12.2-pa2 runs
fine with SMP enabled. But any 2.6.13-rc kernel with SMP dies silently
right after probe for console (ttyB0). When new (.13-rc) kernel is
built without SMP support, it works fine. Any ideas what could be
problem here?
--=20
Vesa
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
