Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from aistrend.allinterior.com (aistrend.allinterior.com [209.194.65.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3FCE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 14:57:46 -0700 (MST)
Received: from ealfert (ais1.allinterior.com [209.194.65.122] (may be forged))
	by aistrend.allinterior.com (8.11.1/8.11.1) with SMTP id fBDLtJv09405
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 16:55:19 -0500 (EST)
Message-ID: <000f01c18422$0f40bd20$830000c0@ealfert>
From: "Edward Alfert" <edward@alfert.com>
To: <parisc-linux@lists.parisc-linux.org>
References: <001101c183db$4be88290$0201a8c0@w2kpro> <E16EWsG-0000Ah-00@linuxlab.wdf.sap-ag.de>  <001e01c183f3$de0537a0$830000c0@ealfert>  <E16EYqV-0005jC-00@noam.fc.hp.com>
Subject: Re: [parisc-linux] What keywords should I use to find the answer? 
Date: Thu, 13 Dec 2001 17:03:55 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

ok...was able to follow all the steps in creating the new kernel including
make oldconfig
make dep
make palo

now what? (this is where the Building the Kernel FAQ ends)

So from this point forward i'm guessing (trial and error)...

I rebooted and it still booted to the old kernel 2.4.9

i then manually moved /root/source/palo/lifimage to
/boot/vmlinux-2.4.16-pa19
then created link to it from vmlinux

I then rebooted and i get:
Opening /vmlinux
Opening /vmlinux-2.4.16-pa19
Couldn't grok your kernel executable format
ERROR: failed to load kernel

Now i know i shouldn't have manually moved the files over and there was a
correct way of doing this... but i looked in all docs i could find and can't
find the right way to move a new kernel into place from the new created
palo/lifimage

1) what is the right way?
2) how do i recover? do i interrup the boot process... interact with IPL and
pass some parameter to boot from the old kernel (that i left behind at
/boot/vmlinux-2.4.9)?

Thanks for all the previous help... i'm close but yet so far....

----- Original Message -----
From: "Paul Bame" <bame@fc.hp.com>
To: "Edward Alfert" <edward@alfert.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Thursday, December 13, 2001 11:36 AM
Subject: Re: [parisc-linux] What keywords should I use to find the answer?


> =
> = Why is the linux* files empty?  did i do something wrong?
> =
>
> Bug in the script which creates them.  Should be a new tarball in
> under an hour from now.
>
> -P
>
