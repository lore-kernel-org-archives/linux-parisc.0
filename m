Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA13187
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 20:11:33 -0600
To: Pavel Roskin <proski@gnu.org>
Cc: parisc-linux@thepuffingroup.com
Subject: New busybox available was Re: [parisc-linux] Busybox 0.45 released 
In-Reply-To: Message from Pavel Roskin <proski@gnu.org>
   of "Thu, 22 Jun 2000 21:26:35 EDT." <Pine.LNX.4.21.0006222122450.31601-100000@sunapee.transcept.com>
References: <Pine.LNX.4.21.0006222122450.31601-100000@sunapee.transcept.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 20:14:11 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000623021411.73E7637E38@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Pavel Roskin writes...

> Matt,
> 
> Just a postscriptum to save you some time.
> When compiling Busybox disable
> 
> BB_INSMOD (not needed)
> BB_FEATURE_MOUNT_LOOP (not compatible with linux-2.4.x)
> BB_UMOUNT (uses umount syscall, can be fixed)

I changed umount.c to use sys/umount.h instead of using it's own version.

I placed a tarball of busybox-0.45 in,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/busybox-20000622.tgz

I also created a smaller nfsroot using busybox instead of all the big 
versions. It contains the dev, base-files, sash, and busybox tarballs from the 
pehc:.../binaries/userspace directory. It lives at,

ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-small-latest.t
gz

Both were tested briefly. Please report any problems to the list.

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
