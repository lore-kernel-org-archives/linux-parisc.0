Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6E534829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 09:26:38 -0700 (MST)
Date: Tue, 26 Nov 2002 08:29:38 -0800
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021126162938.GX21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DAAAD46000048D6@ocpmta1.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DAAAD46000048D6@ocpmta1.be.tiscali.com>
Subject: [parisc-linux] Re: uaccess ya patch
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

> Much more for info, here is another way I found to implement __put_?_asm64.

Joel, the __*_bad stuff is fine, but why do you want to rewrite the
asm64 functions as macros? you are also not doing it correctly:

> +#define __put_user_asm64(x, ptr)		\
> +	__asm__ __volatile__ (			\
> +		"\n1:\tstw\t%2,0(%%sr3,%1)\n"	\
> +		"2:\tstw\t%R2,4(%%sr3,%1)\n"	\
                  ^^^ this will cause very bad things to happen.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
