Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87F9A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 10:36:04 -0600 (MDT)
Message-ID: <3D95E9B7.2080209@freebel.net>
Date: Sat, 28 Sep 2002 17:41:11 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] How to obtain a core dump
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

Testing evms 1.1.0, I got a segfault with evmsgui on hppa but I do not 
obtain any core dump to analyse by back trace in gdb the origine of this 
  problem (the ncurses tool do present this default).

Is someonr can explain me what should I do to obtain a core dump when 
this kind of problem occurs?

Thanks in advance,
	Joel
