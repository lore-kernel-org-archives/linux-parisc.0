Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 456E34A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 21:56:24 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA01138;
	Mon, 12 Mar 2001 15:55:51 +1100
Date: Mon, 12 Mar 2001 15:55:51 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
In-Reply-To: <d3y9ub6222.fsf@lxplus015.cern.ch>
Message-ID: <Pine.LNX.4.21.0103121551380.23407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 12 Mar 2001, Jes Sorensen wrote:

> pt-initfini.c was added to glibc-2.2.2 recently, you need it to build
> a working LinuxThreads library now. Unless someone has synced the
> parisc tree recently it shouldn't be an issue, as long as noone tries
> to compile the Cygnus tree for parisc.

Yeah, I figured Randolph was probably not compiling pehc glibc.  When we
do the next merge, we'll need to add an hppa-linux specific version of
pt-initfini.c

Alan
-- 
Linuxcare
