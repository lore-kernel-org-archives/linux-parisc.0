Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id NAA19551
	for <hppa-linux@sod.res.cmu.edu>; Fri, 26 Mar 1999 13:33:53 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id KAA10633
	for <hppa-linux@thepuffingroup.com>; Fri, 26 Mar 1999 10:33:14 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F97SVM00.PKK for <hppa-linux@thepuffingroup.com>; Fri, 26 Mar
          1999 10:33:22 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FBD2E7.D7399CA2@netscape.com>
Date: Fri, 26 Mar 1999 13:33:11 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] progress
List-ID: <linux-parisc.vger.kernel.org>

[shaver@loonie linux] gmake CROSS_COMPILE=hppa-linux- vmlinux
[...]
make[1]: Leaving directory `/builds2/parisc-linux/linux/arch/parisc/lib'
hppa-linux-ld -m hppaelf -e stext arch/parisc/kernel/head.o
arch/parisc/kernel/init_task.o init/main.o init/version.o \
        --start-group \
        arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a drivers/misc/misc.a
drivers/net/net.a drivers/video/video.a \
        /builds2/parisc-linux/linux/arch/parisc/lib/lib.a
/builds2/parisc-linux/linux/lib/lib.a
/builds2/parisc-linux/linux/arch/parisc/lib/lib.a \
        --end-group \
        -o vmlinux
hppa-linux-ld: can not size stub section: Bad value
hppa-linux-ld: warning: cannot find entry symbol stext; defaulting to
00002000
gmake: *** [vmlinux] Segmentation fault (core dumped)
gmake: *** Deleting file `vmlinux'
[shaver@loonie linux]

I think Nat has a fix for that, but I'll have to find it and respin the
cross-compiler before I can do anything more.

Mike

-- 
167319.81 72598.35
