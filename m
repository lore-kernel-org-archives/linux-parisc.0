Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D0EE483C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 16:02:43 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel8.hp.com (Postfix) with ESMTP id 2428AA008AB
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 17:59:13 -0500 (EST)
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error. 
In-Reply-To: Message from Gururaj Ananthateerta <gururaj@cup.hp.com>
   of "Tue, 12 Mar 2002 14:45:52 PST." <3C8E8520.EC6877E3@cup.hp.com>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk>  <3C8E8520.EC6877E3@cup.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 15:58:58 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020312225858.A979E38556@carmen.fc.hp.com>
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

Gururaj Ananthateerta writes...

> Apologies folks.
> helped a lot. I cud figure out that my kernel was  a32-bit
> i got htis hppa-linux-gcc and compiled  a 64-bit kernel.

You need hppa64-linux-gcc to build a 64 bit kernel. You can get compilers 
from the ftp.parisc-linux.org site.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
