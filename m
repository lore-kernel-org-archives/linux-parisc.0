Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA11908
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 18:45:43 -0600
To: Pavel Roskin <proski@gnu.org>
Cc: parisc-linux@thepuffingroup.com, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] Busybox 0.45 released 
In-Reply-To: Message from Pavel Roskin <proski@gnu.org>
   of "Thu, 22 Jun 2000 20:03:50 EDT." <Pine.LNX.4.21.0006221948010.14277-100000@sunapee.transcept.com>
References: <Pine.LNX.4.21.0006221948010.14277-100000@sunapee.transcept.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 18:48:22 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000623004822.949A537E22@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Pavel Roskin writes...

> Hello!
> 
> I think that some of you may be interested that Busybox 0.45 has been
> released. This version fixes too many bugs to list here.

Yes! The list thanks you.

> I tried the busybox binary from the "gonzo" filesystem. There is a problem
> with "init" when it's a symlink to busybox - it complains about
> insufficient memory (today's kernel from CVS). This is almost certainly a
> kernel problem.

Yes, busybox has helped find several kernel/toolchain problems so far. For now 
I just use sash as my init.

> I would like to see the binary of busybox on the ftp server.

Earlier today I spent some time cleaning up the pehc:/pub/parisc/binaries 
directory. I put tarballs of all of the userspace apps(including busybox-0.43) 
that I've compiled in,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/

I will build a new busybox ASAP. I also put a tarball of the latest 
cross-toolchain for x86 in,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tgz

This toolchain is a couple weeks old but works pretty well. It will be updated 
within the next few days.

Consider this an announcement :) I'll try to put pointers on the website soon.

> By the way,
> it would be nice to update the precompiled kernel - the latest kernel on
> ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/ is dated by
> February 18, 2000.

Yes it would be nice. If someone else doesn't beat me to it I'll drop a new 
kernel in there tommorrow.

Thanks again,

-- 
Matt Taggart
taggart@fc.hp.com
