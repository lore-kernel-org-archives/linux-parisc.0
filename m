Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 001DC482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 15:15:06 -0700 (MST)
Date: Mon, 18 Nov 2002 22:15:52 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211182152.gAILqaHk021705@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211182213160.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 18 Nov 2002, John David Anglin wrote:

> > *grmml* failed again in; this time in parse.o
>
> If the failure was caused by a segmentation fault, restart the build with
> "make bootstrap2" or "make bootstrap3" depending on the stage in which
> it failed and see what happens.

rm -rf'ed the build due to almost no free disk space...

> > ../gcc/configure -v --enable-languages=c,c++,f77,objc --prefix=/usr --infodir=/share/info \
>
> It is not a good idea to replace the default compiler used for building
> the system and glibc.  These pretty much have to be kept in sync.  Set
> --prefix to some other directory.  It is not a bad idea to keep each

*merde* missed it.. copied options from 3.0.4debian /usr/bin/gcc -v

if it compiles it will be no prob to wait another day ;-))

updated my compile.sh ... thanks.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
