Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5B0504840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 13:45:06 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Subject: Re: [parisc-linux] strange GNU ld / libgcc_s.so problems
Date: Mon, 15 Dec 2003 21:42:21 +0100
References: <200312142312.hBENCSHO002332@hiauly1.hia.nrc.ca>
In-Reply-To: <200312142312.hBENCSHO002332@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312152142.21505.deller@gmx.de>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 15 December 2003 00:12, John David Anglin wrote:
> > > -lgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> > > usr/lib/libgcc_s.so)
> 
> Debian builds GCC using sjlj exceptions.  This can happen if you use
> GCC built using dwarf2 exception support (the default).

Hi Dave,

I'm only using debian's official binaries thru "apt-get update" - including gcc/g++:

c3000:/var/cache/apt/archives# dpkg -l | grep gcc
ii  gcc            3.3.1-2        The GNU C compiler.
pi  gcc-3.2-base   3.2.3-8        The GNU Compiler Collection (base package)
ii  gcc-3.3        3.3.2-4        The GNU C compiler
ii  gcc-3.3-base   3.3.2-4        The GNU Compiler Collection (base package)
ii  gcc-hppa64     3.0-0pre010427 Cross gcc for hppa64
ii  libgcc1        3.3.2-4        GCC support library
