Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61B38488E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 13:25:52 -0700 (MST)
Date: Tue, 18 Mar 2003 12:21:04 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: b.gunreben@web.de, jsoe0708@tiscali.be, willy@debian.org,
	doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030318202104.GV26139@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030318190220.GT26139@tausq.org> <200303181916.h2IJGM7R016380@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303181916.h2IJGM7R016380@hiauly1.hia.nrc.ca>
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

> I believe that we were talking about a problem in in glibc's use
> of __canonicalize_funcptr_for_compare with a gcc 3.3 compiled kernel.

Quoting an earlier mail:
> IAOQ = 10351b7c
> Func: __canonicalize_funcptr_for_compare, Off: 38, Addr: 0x10351b7c
> 10351b70:       2a 6b 50 00     addil 56800,r19,%r1
> 10351b74:       48 21 0c a8     ldw 654(r1),r1
> 10351b78:       d4 60 1c 1e     depwi 0,31,2,r3
> 10351b7c:       0c 60 10 94     ldw 0(sr0,r3),r20
>
> GR0 = 00000000
>
> GR1 = 103eee50
> Func: _GLOBAL_OFFSET_TABLE_, Off: 0, Addr: 0x103eee50
>
> GR2 = 101342f8
> Func: do_sigaction, Off: a8, Addr: 0x101342f8

these are definitely kernel addresses....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
