Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA29225
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 09:28:43 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id E846416C2
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 08:28:50 -0800 (PST)
Message-Id: <200011221627.IAA21459@milano.cup.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Crash dump module 
In-reply-to: Your message of "Wed, 22 Nov 2000 15:14:18 PST."
             <3A1BD4BA.B771D3BE@admin.france.hp.com>
Date: Wed, 22 Nov 2000 08:27:22 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bruno Vidal wrote:
> 	Hi
> Good news, I've finished to recompile the entire chain on hpux 11.00 64bits.
> I've recompile my own kernel and booted a small 712/60. It work pretty well.
> Now I'm going to start the work about crash dump. So, In my mind, I'll start
> from the linux/kernel/panic.c function and I'll add a function dumpsys.c
> in the linux/arch/paric directory -> is it okay for you ?

YES!

> It will depend on the CONFIG_PARISC var
> (or do you prefer adding a CONFIG_DUMPSYS var ?)

As Randolph pointed out CONFIG_PARISC is deprecated.
Use "ifdef __hppa__" for changes in *common* (ie not arch/parisc)
files. They should not be needed for anything in arch/parisc
or linux/include/asm-parisc.

Adding a CONFIG_DUMPSYS is a good idea.
Look in linux/arch/parisc/config.in, linux/arch/parisc/defconfig, 
and the various Makefiles for how CONFIG_* flags work.

thanks Bruno!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
