Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A19D483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 11:59:51 -0600 (MDT)
Message-ID: <3F6DE716.4030104@tiscali.be>
Date: Sun, 21 Sep 2003 17:59:50 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] warning: long unsigned int format, time_t arg
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

Hi all,

during compiling 2.6.0-test5-pa6 with gcc-3.3, i noticed some warning of 
type:
[snip]
  CC      fs/exec.o
fs/exec.c: In function `format_corename':
fs/exec.c:1219: warning: long unsigned int format, time_t arg (arg 4)
[snip]

for which I would suggest the following patch:
hpalin:/Debian-apt/SRC/linux-2.6.0-test5-pa6/fs# diff -Nau exec.c.Orig 
exec.c.new
--- exec.c.Orig    2003-09-10 18:18:40.000000000 +0200
+++ exec.c.new    2003-09-16 23:55:12.000000000 +0200
@@ -1216,7 +1216,7 @@
                 struct timeval tv;
                 do_gettimeofday(&tv);
                 rc = snprintf(out_ptr, out_end - out_ptr,
-                          "%lu", tv.tv_sec);
+                          "%lu", (unsigned long int)tv.tv_sec);
                 if (rc > out_end - out_ptr)
                     goto out;
                 out_ptr += rc;

I would like your opinion before submiting (hmm to Andrew I presume?)

Thanks in advance,
    Joel
