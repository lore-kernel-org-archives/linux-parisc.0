Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4F7E482C
	for <parisc-linux@parisc-linux.org>; Tue,  4 Dec 2001 21:18:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16BTWH-0004Hf-00
	for parisc-linux@parisc-linux.org; Wed, 05 Dec 2001 04:18:53 +0000
Date: Wed, 5 Dec 2001 04:18:53 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011205041853.C12186@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ntpdate broken
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

ntpdate isn't working on paer.  from the strace:

socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
fcntl(4, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
rt_sigaction(SIGALRM, {0x287a2, [], 0}, {SIG_DFL}, 8) = 0
setitimer(ITIMER_REAL, {it_interval={0, 200000}, it_value={0, 100000}}, NULL) = 0
setpriority(PRIO_PROCESS, 0, -12)       = 0
poll([{fd=4, events=POLLIN}], 1, 60000) = 0
poll( <unfinished ...>

anyone want to spend some time debugging this?  i'd bug the debian
maintainer, but i hear he's not very sympathetic towards hppa.

-- 
Revolutions do not require corporate support.
