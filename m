Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38466482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 08:59:11 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m152wYH-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 08:57:25 -0600 (MDT)
Message-Id: <m152wYH-001VltC@bame.riverrock.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org,
	bame@www.riverrock.org
Subject: Re: [parisc-linux] Re: hppa64 cross compiler debs available 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Thu, 24 May 2001 11:38:40 BST." <20010524113840.V8736@linuxcare.com>
References: <20010523231045.0DF9037CA8@carmen.fc.hp.com>  
 <20010524113840.V8736@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 May 2001 08:57:25 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 
> They depend on libc 2.2.3, so if I want to use them for building
> the 64 bit kernel-images for boot-floppies to use, I need 2.2.3 on my
> build system.  That probably means I need 2.2.3 on the root.bin.
> 
> Should I go down that road, or are we sticking with 2.2.1 for
> initial install images?

I recommend sticking with 2.2.1 for the root.bin and maybe base system.  The
apt-get somebody uses for grabbing the xc debs could depend on 2.2.3 and as
will many things before too long.

	-P
