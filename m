Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FAF8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 14:49:36 -0600 (MDT)
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Many experience done on 720, but `init' fails !! 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@dot.at>
   of "Sun, 08 Apr 2001 19:08:11 +0200." <3AD09AFB.EBDFF975@dot.at>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com>
 <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at> <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk>  <3AD09AFB.EBDFF975@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Apr 2001 14:52:08 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010409205209.2FF0437CDB@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christoph Plattner writes...

> SO I build sash, a also build a bash (shared and static !), I build
> fileutils, text-utils, shell-utils, etc, etc.....
> The system boots with bash and I can mount, run programs, etc....

Good.

> The I build "my own" startup stuff. A /sbin/init.d/xxx , etc/rc.d/xxx
> and so on. I also build a sysvinit-2.78 (and 2.77 before), but the
> `init' has it's problems. The error message is:

Make sure you don't have multiple init's. The kernel will look in several 
places and I don't remember what order it looks in. If you only have one then 
that's the only one it can find :)

Are you still having problems with the init in the base tarball? Is it 
important to you to build your own init? If it is reply privately and maybe I 
can help.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
