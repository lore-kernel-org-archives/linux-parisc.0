Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tigger.pacehouse.com (adsl-63-202-82-115.dsl.snfc21.pacbell.net [63.202.82.115])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CD65483F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 21:13:00 -0700 (MST)
Received: from localhost (jepace@localhost)
	by tigger.pacehouse.com (8.11.6/8.11.6) with ESMTP id g2J4Cwr25696
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 20:12:58 -0800 (PST)
	(envelope-from jepace@pobox.com)
Date: Mon, 18 Mar 2002 20:12:58 -0800 (PST)
From: "James E. Pace" <jepace@pobox.com>
Reply-To: "James E. Pace" <jepace@pobox.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020318200919.L25440-100000@tigger.pacehouse.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] simple_strtol?
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

Hi.

I'm trying to get FiST
(http://www.cs.columbia.edu/~ezk/research/fist/) working on my 712.
I've got kernel version 2.4.17 [ uname -a = Linux rabbit 2.4.17 #2 Sat
Mar 16 08:27:47 PST 2002 parisc unknown ].

I'm able to compile a kernel module that includes simple_strtol, but
when I insmod it, I get :

+ insmod ./rot13fs.o
./rot13fs.o: unresolved symbol simple_strtol
./rot13fs.o:
Hint: You are trying to load a module without a GPL compatible license
      and it has unresolved symbols.  Contact the module supplier for
      assistance, only they can help you.


What am I doing wrong?

Thanks,

James

This letter brought to you by: *************************************
** "They that can give up       James E. Pace <jepace@pobox.com>  **
**  essential liberty to        http://www.PaceHouse.com/         **
**  obtain a little temporary                                     **
**  safety deserve neither liberty nor safety." - B. Franklin     **
********************************************************************
