Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59000482A
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 21:49:17 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BJ2XU-0000Tc-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 23:48:44 -0400
Date: Wed, 28 Apr 2004 23:48:44 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040429034844.GC31006@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New glibc cvs patches against 2004-04-28
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


parisc-linux,

Latest upstream glibc patch set:
http://www.parisc-linux.org/~carlos/glibc-hppa-patches-2004-04-28.tar.gz

Applies against glibc cvs head, does the usual thing of providing
linuxthreads, but also enables posix message queues.

c.
