Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id C943D81EA
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 01:47:57 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 0E3791701
	for <parisc-linux@parisc-linux.org>; Tue,  6 Mar 2001 03:47:42 -0500 (EST)
To: parisc-linux@parisc-linux.org
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 01:50:14 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010306085014.D58AB38BD7@carmen.fc.hp.com>
Subject: [parisc-linux] New native gcc debs
List-ID: <linux-parisc.vger.kernel.org>

I have built new hppa native gcc debs based on March 5th pehc cvs and placed 
them at,

ftp://puffin.external.hp.com/pub/parisc/binaries/new-debs/debian/

They are,

gcc-2.97-base_2.97-010203_all.deb
cpp-2.97_2.97-010203_hppa.deb
protoize_2.97-010203_hppa.deb
fixincludes_2.97-010203_hppa.deb
libobjc1_2.97-010203_hppa.deb
g++-2.97_2.97-010203_hppa.deb
libstdc++2.97_2.97-010203_hppa.deb
libstdc++2.97-dev_2.97-010203_hppa.deb
g77-2.97_2.97-010203_hppa.deb
libgcc297_2.97-010203_hppa.deb
gcc-2.97_2.97-010203_hppa.deb
cpp-2.97-doc_2.97-010203_all.deb
g77-2.97-doc_2.97-010203_all.deb
gcc-2.97-doc_2.97-010203_all.deb
gobjc-2.97_2.97-010203_hppa.deb
libstdc++2.97-dbg_2.97-010203_hppa.deb
libstdc++2.97-doc_2.97-010203_all.deb

After installing you'll need to,

- Remove the gcc package since it doesn't conflict on its own
   `dpkg -r gcc`
- Setup symlinks for gcc and cc
   `cd /usr/bin;ln -s gcc-2.97 gcc;ln -s gcc-2.97 cc`

I will fix both of these problems later. I have noticed that quite a few 
packages in Debian that use c++ don't seem to be 2.97(v3) clean yet. So far I 
can't build apt, jade, and ncurses.  I have been able to build quite a few 
other things though and I have placed the debs in the above directory.

Please report any problems you have.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
