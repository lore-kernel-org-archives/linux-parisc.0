Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from openbsd1.buttafuoco.net (3ff839a7.dsl.flashcom.net [63.248.57.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id C61934A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 06:51:51 -0700 (MST)
Date: Thu, 22 Feb 2001 08:51:39 -0500 (EST)
Message-Id: <200102221351.f1MDpdN07297@openbsd1.buttafuoco.net>
From: "Jim Buttafuoco" <jim@tylerdrive.org>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>,
	PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Booting nfsroot-20001009.tar.gz
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

I had the same problem.  I noticed that the loopback network was not
getting setup.  After I fixed this the boot worked find.



> I got linux-20010216.tar.gz and the kernel is not crashing. I've run
> into into a boot problem. Ive added the nfsroot directory in the
> /etc/fstab file. With options 'default', the init process stops when
> trying to start 'portmapper', it just sits there, hitting CTRL-C
> continues the boot process. If I add the option 'nolock' the
portmapper
> will be skipped.
> 
> Next, the init process will stop or hang when trying to start 'nscd', 
> CTRL-C won't break it. I disabled that script also, and finally got
the
> whole boot to finish.
> 
> There are other programs that don't work either, 'tar' will just sit
> there, as well as 'dpkg'.
> 
> Any suggestions? Thanks.
> 
> -- 
>      Rafael
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
> 
