Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34754482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 07:53:35 -0600 (MDT)
Date: Thu, 30 May 2002 08:52:49 -0500
Message-Id: <200205300852.AA3463709158@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Java and SSH
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

and I assume that jikes not working is the same reason that
the kaffe stuff is "lame"?

It would be a shame to have to go back to HP-UX... Our company
is amazingingy enough is happy for once to get on the bleading edge.

-Marc

---------- Original Message ----------------------------------
From: Matthew Wilcox <willy@debian.org>
Date:  Thu, 30 May 2002 12:55:30 +0100

>On Thu, May 30, 2002 at 12:23:49AM -0500, marc  wrote:
>> seki:/etc/apt# apt-get install kaffe
>> Reading Package Lists... Done
>> Building Dependency Tree... Done
>> Package kaffe has no available version, but exists in the database.
>> This typically means that the package was mentioned in a dependency and
>> never uploaded, has been obsoleted or is not available with the contents
>> of sources.list
>> E: Package kaffe has no installation candidate
>
>looks like no-one's managed to get kaffe built on hppa.  gcj doesn't seem
>to be available for hppa either.  In fact, kaffe is only available for
>alpha, arm, i386, m68k, powerpc, sparc (ie hppa, ia64, mips, mipsel &
>s390 haven't managed to get it working yet).  gcj seems to be available
>on everything but hppa, mips & mipsel.  I don't know how much effort is
>involved in making these things work.
>
>-- 
>Revolutions do not require corporate support.
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
