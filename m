Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDD314841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Jun 2002 09:36:53 -0600 (MDT)
Date: Mon, 24 Jun 2002 08:39:59 -0700
From: Randolph Chung <tausq@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h
Message-ID: <20020624153959.GH812@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20020624150031.4DA034837@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020624150031.4DA034837@dsl2.external.hp.com>
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

> I'm trying to build tulip-diag.c from scyld.com and am getting the
> following error msg:
> gsyprf11:~# gcc -O tulip-diag.c -o tulip-diag
> tulip-diag.c:58:20: sys/io.h: No such file or directory
> tulip-diag.c:1347:24: warning: multi-line string literals are deprecated
> 
> On ia64, sys/io.h comes from
> gsyprf3:~# dpkg -S sys/io.h
> libc6.1-dev: /usr/include/sys/io.h
> 
> But we don't have the equivalent for parisc (hppa).
> Ideas?

ISTR this has to do with the fact that we do not want to/cannot expose 
the {in,out}[bwl] primitives to userspace. Is the tulip-diag program
trying to write to port space directly?

FWIW we have the same problems with things like sane. 

ia64 seems to have some wrappers in glibc to do port io....

randolph
