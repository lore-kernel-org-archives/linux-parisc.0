Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C04E482E
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 13:54:28 -0600 (MDT)
Date: Fri, 12 Jul 2002 12:59:23 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
Message-ID: <20020712195923.GC8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020712165616.GA8724@tausq.org> <200207121752.g6CHqvRY018027@hiauly1.hia.nrc.ca> <20020712193842.GB8724@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020712193842.GB8724@tausq.org>
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

> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c: At top level:
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:56: error: size of array `reg' is too la
> rge
> /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:62: internal compiler error: internal er
> ror: Segmentation fault

something basic seems to be broken:
tausq@a500:~/build/gcc-3.2$ cat t.c
void *foo[2];

tausq@a500:~/build/gcc-3.2$ /home/tausq/build/gcc-3.2/gcc/xgcc -B/home/tausq/build/gcc-3.2/gcc/ -B/home/tausq/opt/gnu/hppa64-linux/bin/ -B/home/tausq/opt/gnu/hppa64-linux/lib/ -c t.c
t.c:1: error: size of array `foo' is too large
t.c:1: error: storage size of `foo' isn't known

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
