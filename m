Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC83B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 07:06:33 -0600 (MDT)
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f9ID4jc09173
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 16:04:45 +0300 (EET DST)
Date: Thu, 18 Oct 2001 16:05:04 +0300
From: Jesus Climent <climent@stybba.ntc.nokia.com>
To: ext Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian package automake broken ?
Message-ID: <20011018160504.C7545@pumuki.ntc.nokia.com>
References: <20011018125654.Q8089@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20011018125654.Q8089@hp.is>; from ra@hp.is on Thu, Oct 18, 2001 at 15:56:54 +0300
List-ID: <linux-parisc.vger.kernel.org>

On 2001.10.18 15:56 ext Richard Allen wrote:
> After upgrading lots of packages on my C360 (including automake) I 
> get the following errors when compiling things:
> 
> config.status: creating xa_ext.h
> config.status: creating db_config.h
> + make
> cd . && aclocal
> cd . && automake --foreign --include-deps Makefile
> automake: configure.in: required file `./depcomp' not found
> make: *** [Makefile.in] Error 1
> 
> 
> This particular package always made it through configure but had
> runtime issues I was hoping to blame the gcc toolchain og glibc 
> for.   Now that we have new versions of both, this happens :)

is automake. It is reported in Debian Weekly report. Automake 1.5 somehow breaks
things.

Jesse
