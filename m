Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DCEF482A
	for <parisc-linux@parisc-linux.org>; Wed, 20 Mar 2002 15:16:56 -0700 (MST)
Date: Wed, 20 Mar 2002 22:16:46 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] SMP support 
In-Reply-To: <20020306010541.A8BB84853@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0203202209250.5453-100000@sal.ucc.ie>
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

On Tue, 5 Mar 2002, Grant Grundler wrote:

> Jeremy Drake wrote:

[...]

> > Also, I am unable to build any kernels myself.  I get a bunch of depmod
> > errors, like these
> >
> > depmod: Unhandled relocation of type 74 for printk_Rsmp_dd132261
> > depmod: Unhandled relocation of type 74 for usb_deregister_Rsmp_c6f994d5
>
> I've seen this when CONFIG_PA20 is enabled but CONFIG_PARISC64 is not.
> Don't know if that's your problem, but it's worth checking.
>
> You don't need to enable CONFIG_PA20 in order to run a 32-bit kernel
> on any system that will support 32-bit kernels (A500/L-class only
> support 64-bit kernel).

I can confirm this. I recompiled (3 times) linux-2.4.18-pa5, and I was
just able to compile a static kernel without error message.
The message will occur if you compile a kernel with modules. It's the
depmod command in "make modules_install" that causes the trouble.

But obviously the modules are created and installed. If you do a
simple "depmod -a" (without any additional arguments as in
"make modules_install"), it doesn't complain.
And it also seems that the modules work (haven't tested this too much)!

greetings max
