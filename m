Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 459C24841
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Nov 2003 15:29:59 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AHsda-0000NY-JJ; Thu, 06 Nov 2003 22:29:58 +0000
Date: Thu, 6 Nov 2003 22:29:58 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
Message-ID: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk>
References: <3FA95BBA.7080705@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3FA95BBA.7080705@hrzpub.tu-darmstadt.de>
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

On Wed, Nov 05, 2003 at 09:21:14PM +0100, Ruediger Scholz wrote:
> it's me again. I repartioned a IBM-hd with 4330 MB but when running 
> fdisk with 2.6.0-test8-pa4, fdisk  told me:
> 
> --------><------------
> gandalf:~# fdisk /dev/sdb
> 
> Befehl (m für Hilfe): p
> 
> Platte /dev/sdb: 40 MByte, 40239104 Byte

Oh oh.  We have an interesting problem here.

> Platte /dev/sdb: 4335 MByte, 4335206400 Byte

4335206400 - 4294967296 = 40239104

So we've lost the top 32 bits of the value.  Can you run it under strace
and tell me what ioctls fdisk is calling?  I bet it's calling BLKGETSIZE64
and our put_user() is broken.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
