Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.monmouth.com (smtp.monmouth.com [209.191.58.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF6284829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Jan 2003 19:31:40 -0700 (MST)
Received: from there (bg-tc-ppp1680.monmouth.com [64.19.130.106])
	by smtp.monmouth.com (8.12.5/8.12.5) with SMTP id h062VT5k090586
	for <parisc-linux@lists.parisc-linux.org>; Sun, 5 Jan 2003 21:31:30 -0500 (EST)
Message-Id: <200301060231.h062VT5k090586@smtp.monmouth.com>
Content-Type: text/plain;
  charset="iso-8859-1"
From: "Vlad D. Markov" <markov@monmouth.com>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 5 Jan 2003 21:31:27 -0500
MIME-Version: 1.0
Subject: [parisc-linux] kernel panic when extracting large tar files
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

When I extract large tar files on my 735/99 (tar --numeric-owner -xzvpf ), 
the kernel panics and I get a core dump.

My kernel is: Linux version 2.4.20-pa18 (root@grumpy) (gcc version 3.0.4) #22 
Fri Dec 27 21:25:37 EST 2002

I saved a capture from minicom and have not upgraded the kernel since. I can 
mail the capture and my System.map separately.

If a new kernel or different version of gcc is needed, please let me know.
