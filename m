Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93232482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 14:06:18 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7BA51B00C; Mon, 19 Nov 2001 21:08:11 +0000 (GMT)
Date: Mon, 19 Nov 2001 21:08:11 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: bdale@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20011119210811.E11431@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa kernel-headers.deb and offset.h
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

Hi Bdale,
  Our kernel-headers debs are missing asm/offset.h, which is created
late on in a kernel build.  I only just noticed, when I tried to build
gdb.  I'm guessing that deb is created without doing a full kernel build,
so the file isn't created.  Note offset.h is different for 32 and 64 bit
kernels, and we want a 32 bit version in the kernel-headers deb.

Maybe the kernel should build offset.h as part of make dep, or something.

Also...
glibc build should use kernel-headers, but I guess libc6-dev_2.2.4-6
was built using some local kernel tree for the headers, and has picked
up a 64 bit offset.h.  so, anyone trying to build gdb will have to
replace their offset.h.

Richard
