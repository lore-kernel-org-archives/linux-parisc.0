Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9C3A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 12:26:46 -0700 (MST)
Date: Sat, 9 Nov 2002 14:26:52 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "b.gunreben" <b.gunreben@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nanosleep
Message-ID: <20021109192651.GC15380@systemhalted>
References: <200211081116.gA8BGuX28978@mailgate5.cinetic.de> <20021108161225.GD2402@systemhalted> <3DCCC839.EFC91019@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DCCC839.EFC91019@web.de>
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

> > glibc 2.3.1 from debian CVS or upstream?
> 
> This is upstream with hppa patches from the debian tree. 

That's currently broke, and I've been slotting in my time to fix this.
Currently rebuilding glibc :}
 
> The report was probably bad. In the mail thread I mentioned in my
> previous mail, the nanosleep in the kernel was fixed because of
> threading problems. If I understand it correctly, threading will always
> have problems without a realy working nanosleep.
 
Yes. You'll see it's use sprinkled in linuxthreads/* and in particular 
spinlock.c

c.
