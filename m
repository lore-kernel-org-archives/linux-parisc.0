From: Meelis Roos <mroos@linux.ee>
Subject: mmap problem in localedef
Date: Mon, 5 Dec 2016 13:36:17 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I noticed that locale-gen fails to work on my gentoo. Before reporting 
to getnoo I tried to understand whether there is something specific to 
parisc and here is the relevant part of strace from localedef 
invocation:

1761  open("//usr/lib/locale/locale-archive.yvHI9a", O_RDWR|O_CREAT|O_EXCL, 0600) = 3
1761  write(3, "\336\2\1\t\0\0\0\0\0\0\0008\0\0\0\0\0\0\3\213\0\0*\274\0\0\0\0\0\0\35L"..., 56) = 56
1761  ftruncate64(3, 103860)            = 0
1761  mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0xd79bd000
1761  mmap2(0xd7c00000, 103860, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)
1761  unlink("//usr/lib/locale/locale-archive.yvHI9a") = 0
1761  write(2, "cannot map archive header", 25) = 25
1761  write(2, ": Invalid argument", 18) = 18
1761  write(2, "\n", 1)                 = 1
1761  exit_group(1)                     = ?

Do I read it correctly that it creates PROT_NONE mapping on file opened 
O_RDWR, then tries to create a PROT_READ|PROT_WRITE mapping from the 
same file at fixed location and fails?

Why should it fail - because the fixed location is not suitable?

-- 
Meelis Roos (mroos@linux.ee)
