Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2339E4833
	for <parisc-linux@lists.parisc-linux.org>; Sun,  7 Jul 2002 18:11:42 -0600 (MDT)
Date: Sun, 7 Jul 2002 20:11:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: sven schnelle <schnelle@kabelleipzig.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb include files
Message-ID: <20020708001146.GA3685@systemhalted>
References: <3D27D979.8050100@kabelleipzig.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D27D979.8050100@kabelleipzig.de>
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

> 
> hello,
> 
> Im writing on a floppy driver for my 712 and want to use kdb,
> 
> but when i try to compile the kernel with it, i get errors:
> 
> kdb/break.h: No such file or directory
> kdb/kgdb_types.h: No such file or directory
> kdb/kgdb_machine.h: No such file or directory
> kdb/trap.h: No such file or directory
> 
> does anybody know where i can get this files ?.
> 
> bye
>     sven

If you haven't already done so, I would recommend getting 
a kdb patched source tree from cvs.parisc-linux.org

There is a 'kdb_v21' branch for the 'linux' tree.

cvs co -rkdb_v21 linux

Please take a look at:
http://cvs.parisc-linux.org

Note: That I'm currently working on kdb's stability...
so you might not get something that is as happy as you
expect from other platofrms.

c.

p.s. Remember to get use the recommended .cvsrc! :)
