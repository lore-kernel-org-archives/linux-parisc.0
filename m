Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63F16482C
	for <parisc-linux@parisc-linux.org>; Thu, 30 May 2002 11:51:51 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g4UHpmFN003169
	for <parisc-linux@parisc-linux.org>; Thu, 30 May 2002 13:51:49 -0400 (EDT)
Message-Id: <200205301751.g4UHpl5f003168@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
To: joel.soete@freebel.net
Date: Thu, 30 May 2002 13:51:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1022779379.3cf65ff37afdc@webmail.tiscalinet.be> from "joel.soete@freebel.net" at May 30, 2002 07:22:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> In file included from ../include/pthread.h:1,
>                  from ../linuxthreads/sysdeps/pthread/bits/libc-lock.h:23,
>                  from ../sysdeps/generic/ldsodefs.h:34,
>                  from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
>                  from ../sysdeps/unix/sysv/linux/init-first.c:32:
> ../linuxthreads/sysdeps/pthread/pthread.h:163: parse error before "__thread"

See <http://gcc.gnu.org/ml/gcc-patches/2002-05/msg01780.html> for fix.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
