Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F9C74829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 17:33:18 -0700 (MST)
Date: Sun, 30 Mar 2003 16:31:53 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030331003153.GS11333@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] perl/gcc bug if someone wants to look :)
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

perl-5.8 fails to build on hppa because of a test failure. The problem
can be seen very easily:

tausq@gsyprf11:~/build/perl-5.8.0$ cat t/t.pl
print log "A";
tausq@gsyprf11:~/build/perl-5.8.0$ ./perl t/t.pl
Can't take log of 2.75773e-308 at t/t.pl line 1.

that should have said:
tausq@gsyprf11:~/build/perl-5.8.0$ /usr/bin/perl t/t.pl
Can't take log of 0 at t/t.pl line 1.

interestingly, a debug build of perl (using -g and no -O flags) doesn't
have the same problem, so this looks like some kind of compiler
optimization bug. I've tried this with both 3.2.3 and 3.3... same
problems.

would anyone like to try to look at this some more and see if they can
isolate the C code/a small test case that is causing the problem?

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
