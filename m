Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D000D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Jun 2002 17:16:21 -0600 (MDT)
Date: Sun, 2 Jun 2002 19:16:02 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John Newbigin <jnewbigin@it.swin.edu.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI problem on 715/50 with new kernels
Message-ID: <20020602191602.A1819@systemhalted>
References: <Pine.LNX.4.44.0206021923310.11687-100000@mars.it.swin.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0206021923310.11687-100000@mars.it.swin.edu.au>; from jnewbigin@it.swin.edu.au on Sun, Jun 02, 2002 at 07:30:55PM +1000
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

> I have an Appolo 715/50 with debian installed on it.  I have upgraded to 
> the 2.4.18 kernel but when the kernel boots, the STI display goes blank.  
> Everything works except I can't see the image.  When I press reset, the 
> firmware comes up and I can see the output from the linux kernel on the 
> screen still.
> 
> If someone can help it would be much appreciated.  The 2.4.9 kernel has 
> some kind of problem with the framebuffer so I can't run X.
> 
> John.
>

I would recommend getting the latest kernel source from 
cvs.paris-linux.org and compiling a new kernel with STI 
fbdev enabled. 

http://cvs.parisc-linux.org/

Make sure that the following is in your ~/.cvsrc
cvs -z3 -q
diff -uNp
update -Pd
remove -f

And then...

export  CVSROOT=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs  
cvs co linux palo
cd linux
make oldconfig 
make menuconfig (enable fbdev and all the goodies you need)
... munge ./palo/Makefile for any custom parameters to your kernel
make dep
make palo

Then boot ./palo/lifimage :)

c.
