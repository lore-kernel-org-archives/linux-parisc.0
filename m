Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E666E4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:07:25 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 716F7298043
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:07:25 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 26688-01 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 24 Nov 2003 00:07:24 -0700 (MST)
Date: Mon, 24 Nov 2003 00:07:24 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031124070724.GB26585@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa64-linux-ld segfault
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

Trying to build 64-bit 2.6.0-test10 on a500...I'm getting:

grundler <537>make
make[1]: `arch/parisc/kernel/asm-offsets.s' is up to date.
  CHK     include/asm-parisc/offsets.h
  CHK     include/linux/compile.h
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
/usr/bin/hppa64-linux-ld: line 4:  9184 Segmentation fault      /opt/palinux/bin/$prog $*
make: *** [.tmp_vmlinux1] Error 139
grundler <538>

It likely I'm not be the only person running into this.
And not sure why I'm suddenly seeing this problem though...

thanks,
grant
