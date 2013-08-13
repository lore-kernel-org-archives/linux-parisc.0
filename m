From: Jeroen Roovers <jer@gentoo.org>
Subject: fanotify_mark()
Date: Tue, 13 Aug 2013 15:49:58 +0200
Message-ID: <20130813154958.7514d525@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/suDRCDq20p3sK_9GVh4_jcQ"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/suDRCDq20p3sK_9GVh4_jcQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Trying out systemd I found that libc 2.17 does not build
fanotify_mark() support[1]. When I got it to do that (see attached
patch, which is probably incorrect), calls to fanotify_mark() still
failed on a C8000 (64-bit kernel). I am sure I am missing something
obvious.


Kind regards,
     jer


[1] https://bugs.gentoo.org/show_bug.cgi?id=480268
--MP_/suDRCDq20p3sK_9GVh4_jcQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=glibc-2.17-hppa-fanotify_mark.patch

--- a/ports/sysdeps/unix/sysv/linux/hppa/syscalls.list
+++ b/ports/sysdeps/unix/sysv/linux/hppa/syscalls.list
@@ -36,3 +36,4 @@
 setrlimit	-	setrlimit	i:ip	__setrlimit	setrlimit	
 getrlimit	-	getrlimit	i:ip	__getrlimit	getrlimit	
 prlimit64	EXTRA	prlimit64	i:iipp	__prlimit64	prlimit64@@GLIBC_2.17
+fanotify_mark	EXTRA	fanotify_mark	i:iiiis	__fanotify_mark fanotify_mark@@GLIBC_2.17

--MP_/suDRCDq20p3sK_9GVh4_jcQ--
