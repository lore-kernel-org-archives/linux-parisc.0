Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (A6e48.pppool.de [213.6.110.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF895482B
	for <parisc-linux@parisc-linux.org>; Sun,  4 Nov 2001 11:41:41 -0700 (MST)
Date: Sun, 4 Nov 2001 19:32:27 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Message-ID: <20011104193227.A1105@solo.franken.de>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>; from kennywest1@hotmail.com on Fri, Nov 02, 2001 at 12:17:07PM +0100
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Nov 02, 2001 at 12:17:07PM +0100, kenneth westelinck wrote:
> So I downloaded the tar.gz archive, unpacked it and ran "./configure". My
> workstation appeared to pass all tests and I was ready to run a "make". In
> the first attached file (make.log.std) you can find the output of this
> command. Investigating the cause of the error brought me to the file
> "prcpucfg.h". "Unknown CPU architecture" the error says. Indeed, while
> browsing through that file I couldn't find anything near a "PARISC"
> architecture.

get the debian source package it contains some my first set of necessary
patches to compile mozilla under Linux/parisc. You will probably face
some binutils/gcc/glibc problems, which might even will give you
compile/link problems, but it's a better start than the plain tar.gz
file.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
