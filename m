Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from trained-monkey.org (trained-monkey.org [209.217.122.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1624D4848
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 10:18:35 -0600 (MDT)
To: Randolph Chung <tausq@debian.org>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h
References: <20020624150031.4DA034837@dsl2.external.hp.com> <20020624153959.GH812@tausq.org>
From: Jes Sorensen <jes@trained-monkey.org>
Date: 25 Jun 2002 12:18:31 -0400
In-Reply-To: Randolph Chung's message of "Mon, 24 Jun 2002 08:39:59 -0700"
Message-ID: <m3fzzbmiw8.fsf@trained-monkey.org>
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

>>>>> "Randolph" == Randolph Chung <tausq@debian.org> writes:

>> I'm trying to build tulip-diag.c from scyld.com and am getting the
>> following error msg: gsyprf11:~# gcc -O tulip-diag.c -o tulip-diag
>> tulip-diag.c:58:20: sys/io.h: No such file or directory
>> tulip-diag.c:1347:24: warning: multi-line string literals are
>> deprecated
>> 
>> On ia64, sys/io.h comes from gsyprf3:~# dpkg -S sys/io.h
>> libc6.1-dev: /usr/include/sys/io.h
>> 
>> But we don't have the equivalent for parisc (hppa).  Ideas?

Randolph> ISTR this has to do with the fact that we do not want
Randolph> to/cannot expose the {in,out}[bwl] primitives to
Randolph> userspace. Is the tulip-diag program trying to write to port
Randolph> space directly?

You really should support it similar to what we do on
ia64. Ie. there's a Linux API here that allows you to map 'I/O' ports
and access them. Basing the code on what's in the ia64 glibc tree
would make it quite easy to get it up and running.

Jes
