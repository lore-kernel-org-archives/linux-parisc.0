Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4674F483E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Nov 2003 01:15:20 -0700 (MST)
Date: Sun, 2 Nov 2003 00:19:55 -0800
From: Randolph Chung <tausq@debian.org>
To: debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org,
	sablevm-developer@lists.sourceforge.net
Cc: debian-java@lists.debian.org
Message-ID: <20031102081955.GV28967@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sablevm on hppa
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

Well, it started innocently enough on irc...

<tausq> an aside: what's needed to get it to work on hppa? just ffi?
<gadek> tausq: I belive so (unless we hit some bug ;-)
* tausq might give it a try sometime
<gadek> tausq: you're welcome. I am here most of the time so I should be able
          to help/participate in realtime.
<gadek> tausq: if you have libffi ready - we should have it working in less
          than an hour.
<tausq> hmmmm :-)
* gadek/#debian-devel would say 20 minutes depending on how fast one can type
          ;-)
<tausq> he got it down to only 5 fails in the ffi testsuite
<tausq> ok, let's try... ;-)
<gadek> tausq: seriously? now? [would be cool!]

and 25 minutes later, we have it working! (well, HelloWorld works, and
gadek's btf tests work when sablevm is compiled with O0)

Many thanks to gadek for his help. I'm sure it won't be nearly as easy
otherwise :) Unfortunately there is still some work to do before this
can really make it officially into upstream/debian.... foremost is
getting ffi submitted upstream and getting proper atomic ops support.
Hopefully those issues will be resolved soon. 

stay tuned,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
