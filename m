Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7C9B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 10:06:42 -0600 (MDT)
Date: Sun, 18 May 2003 09:10:01 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
Message-ID: <20030518161001.GG548@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> bz@apollo:~> ldd /bin/cp
> Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
> Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
> ldd: /lib/ld.so.1 exited with unknown exit code (127)

http://sources.redhat.com/ml/libc-alpha/2003-05/msg00149.html

i just sent this to debian/glibc upstream yesterday.

> I also have other probs with vim and tcpdump and most likely others
> dumping core and producing a do_page_fault() dump with IAOQ: 4xxxxxxxx
> on 2.5.-latest from cvs w/o last single ioctl commit.
> but I also had seen these core dumps on 2.4.18-pa33 after last
> dist-upgrade some days ago ...

this is because of a gcc bug.
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=193207

once gcc-3.2 gets patched and glibc gets recompiled, you'll be ok.
otherwise, consider downgrading to libc6_2.3.1-16 and everything will be
ok.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
