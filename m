Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27382482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 16:05:26 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GOB1H101.R4S for
          <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 14:05:25 -0900
Date: Thu, 13 Dec 2001 14:02:52 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Edward Alfert <edward@alfert.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] What keywords should I use to find the answer? 
In-Reply-To: <000f01c18422$0f40bd20$830000c0@ealfert>
Message-ID: <Pine.LNX.4.33.0112131359110.5844-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 13 Dec 2001, Edward Alfert wrote:
> ok...was able to follow all the steps in creating the new kernel including
> make oldconfig
> make dep
> make palo
>
> now what? (this is where the Building the Kernel FAQ ends)
>
> So from this point forward i'm guessing (trial and error)...
>
> I rebooted and it still booted to the old kernel 2.4.9
>
> i then manually moved /root/source/palo/lifimage to
> /boot/vmlinux-2.4.16-pa19
> then created link to it from vmlinux
>
> I then rebooted and i get:
> Opening /vmlinux
> Opening /vmlinux-2.4.16-pa19
> Couldn't grok your kernel executable format
> ERROR: failed to load kernel

Exactly what I had happen. Someone was nice enough to point out to me the
*right* way <g>...

In your linux root (with the Makefile) is vmlinux. Move that to
/boot/vmlinux-xxx, then edit palo.conf (second line has the kernel you're
wanting to boot by default). Then, run palo (gives you a two-line 'before'
and 'after' which should show the new kernel) and reboot.

> Now i know i shouldn't have manually moved the files over and there was a
> correct way of doing this... but i looked in all docs i could find and can't
> find the right way to move a new kernel into place from the new created
> palo/lifimage

Don't think there's any way other than manual - 'make install' isn't
working yet AFAIK.

Recover by using 'boot pri ipl' at the initial boto menu, then change your
kernel name to the last one you used.
