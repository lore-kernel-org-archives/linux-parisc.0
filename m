Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA27812
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 18:22:19 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by palrel1.hp.com (Postfix) with ESMTP id 93BE1ADE
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 17:24:27 -0800 (PST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id B02B337CA7
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 18:26:19 -0700 (MST)
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Nov 2000 18:26:19 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001118012619.B02B337CA7@carmen.fc.hp.com>
Subject: [parisc-linux] New cross compiler
List-ID: <linux-parisc.vger.kernel.org>

I have posted new i386/linux -> hppa/linux cross tools at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20001117.tar.gz

it includes 32bit and 64bit cross-compilers and a static 32bit glibc 2.2. I 
have also updated the include tarball,

ftp://puffin.external.hp.com/pub/parisc/src/include-20001117.tar.gz

it includes glibc 2.2 headers and the latest kernel headers.

-- 
Matt Taggart
taggart@fc.hp.com
