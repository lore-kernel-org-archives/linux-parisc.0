Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA22462
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 17:02:10 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 90052E4
	for <parisc-linux@thepuffingroup.com>; Tue, 24 Oct 2000 19:03:29 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 5FE1E38137
	for <parisc-linux@thepuffingroup.com>; Tue, 24 Oct 2000 17:05:19 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 24 Oct 2000 17:05:19 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001024230519.5FE1E38137@carmen.fc.hp.com>
Subject: [parisc-linux] gcc build failing, missing pthread.h
List-ID: <linux-parisc.vger.kernel.org>

In trying to build a Linux/X86 -> Linux/PARISC cross gcc with glibc support 
I'm running into the following error,

/home/al-76/puffin/xc-build/gcc/gcc/g++ -B/home/al-76/puffin/xc-build/gcc/gcc/ 
-nostdinc++ -isystem /home/al-76/puffin/palinux/gcc/libstdc++ -isystem 
/home/al-76/puffin/palinux/gcc/libstdc++/std -isystem 
/home/al-76/puffin/palinux/gcc/libstdc++/stl -isystem 
/home/al-76/puffin/palinux/gcc/libio -isystem /home/al-76/puffin/xc-build/gcc/h
ppa-linux/libio -L/home/al-76/puffin/xc-build/gcc/hppa-linux/libstdc++ 
-B/opt/palinux/hppa-linux/bin/ -B/opt/palinux/hppa-linux/lib/ -isystem 
/opt/palinux/hppa-linux/include -c -g -O2 -fvtable-thunks -D_GNU_SOURCE 
-fno-implicit-templates -I/home/al-76/puffin/palinux/gcc/libstdc++ 
-I/home/al-76/puffin/palinux/gcc/libstdc++/stl -I../libio 
-I/home/al-76/puffin/palinux/gcc/libstdc++/../libio -nostdinc++  
/home/al-76/puffin/palinux/gcc/libstdc++/stdexcepti.cc
In file included from /home/al-76/puffin/palinux/gcc/libstdc++/stl/alloc.h:21,
                 from /home/al-76/puffin/palinux/gcc/libstdc++/std/bastring.h:3
9,
                 from /home/al-76/puffin/palinux/gcc/libstdc++/string:6,
                 from /home/al-76/puffin/palinux/gcc/libstdc++/stdexcept:36,
                 from /home/al-76/puffin/palinux/gcc/libstdc++/stdexcepti.cc:8:
/home/al-76/puffin/palinux/gcc/libstdc++/stl/stl_alloc.h:71:24: pthread.h: No 
such file or directory
make[1]: *** [stdexcepti.o] Error 1
make[1]: Leaving directory `/home/al-76/puffin/xc-build/gcc/hppa-linux/libstdc+
+'

This is using the build-tools/palinux-autobuilder in CVS same as I always do. 
This is the first build I've done since October 16th. Since then David 
Huggins-Daines made a couple commits that may be related,

http://puffin.external.hp.com/mailing-lists/parisc-linux-cvs/2000/10-Oct/0167.h
tml
http://puffin.external.hp.com/mailing-lists/parisc-linux-cvs/2000/10-Oct/0166.h
tml

I have tried configuring gcc with and without --disable-threads and get the 
same result. Where should pthread.h be coming from and why isn't it working 
automagically?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
