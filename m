From: John Marvin <jsm@udlkern.fc.hp.com>
Subject: [parisc-linux] Re: glibc 2.3.2-9 for hppa - "when hell freezes over" release
Date: Mon, 20 Oct 2003 02:00:45 -0600 (MDT)
Message-ID: <200310200800.h9K80jQ20069__34476.6649221585$1416622893$gmane$org@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-glibc@lists.debian.org, jbailey@nisa.net, lamont@hp.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > - Looking into mlockall failures.
>
> Passes QA on a 2.4 kernel (posix testsuite). 2.6 seems broken, though
> that is unrelated to glibc.

Yes, this is a known problem. We've seen it on ia64 also. I believe
the fix is in Linus's tree, but I'm not sure if it made it into test8
or not.

John Marvin
jsm@fc.hp.com
