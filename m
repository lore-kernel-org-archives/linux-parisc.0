Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01ADF482D
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 00:42:47 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17RSEQ-0001Jc-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 08 Jul 2002 07:42:46 +0100
Date: Mon, 8 Jul 2002 07:42:46 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb include files
Message-ID: <20020708064246.GC815@tykepenguin.com>
References: <3D27D979.8050100@kabelleipzig.de> <20020708001146.GA3685@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020708001146.GA3685@systemhalted>
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

On Sun, Jul 07, 2002 at 08:11:47PM -0400, Carlos O'Donell wrote:
> > 
> > hello,
> > 
> > Im writing on a floppy driver for my 712 and want to use kdb,
> > 
> > but when i try to compile the kernel with it, i get errors:
> > 
> > kdb/break.h: No such file or directory
> > kdb/kgdb_types.h: No such file or directory
> > kdb/kgdb_machine.h: No such file or directory
> > kdb/trap.h: No such file or directory
> > 
> > does anybody know where i can get this files ?.
> > 
> > bye
> >     sven
> 
> If you haven't already done so, I would recommend getting 
> a kdb patched source tree from cvs.parisc-linux.org
> 
> There is a 'kdb_v21' branch for the 'linux' tree.
> 
> cvs co -rkdb_v21 linux
> 
> Please take a look at:
> http://cvs.parisc-linux.org
> 
> Note: That I'm currently working on kdb's stability...
> so you might not get something that is as happy as you
> expect from other platofrms.

It's a little confusing that there's mention of KDB in the
non-KDB enabled kernel. Under General Options it says 
"Kernel Debugger support" which seems (to me) to have the
sole function of generating the above messages :)

patrick
