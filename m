Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17F72482B
	for <parisc-linux@parisc-linux.org>; Tue, 25 Sep 2001 17:42:28 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f8PNgP518270
	for parisc-linux@parisc-linux.org; Tue, 25 Sep 2001 23:42:25 GMT
Date: Tue, 25 Sep 2001 23:42:25 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@parisc-linux.org
Message-ID: <20010925234225.A18261@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Trace/breakpoint trap
List-ID: <linux-parisc.vger.kernel.org>

Here's a wild one:

bofh:~/rpm-4.0.3/rpmdb# make
Trace/breakpoint trap
bofh:~/rpm-4.0.3/rpmdb# echo $?
133
bofh:~/rpm-4.0.3/rpmdb#

Nothing is wrong there.  Moving that directory over ti a i686 system gives no
problems.

Whats wrong ?

bofh:~# uname -a
Linux bofh 2.4.9-pa24 #2 Fri Sep 21 20:40:31 UTC 2001 parisc unknown
bofh:~# gcc --version
3.0.2

It's apt-get updated to the max.




-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
