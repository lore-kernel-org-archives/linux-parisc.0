Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id E14074829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 10:38:06 -0600 (MDT)
Date: Mon, 2 Sep 2002 18:31:15 +0200
Message-ID: <3D3815BD0000A8AE@ocpmta5.be.tiscali.com>
In-Reply-To: <20020902152137.GG25710@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>> I would like to use gcc-3.2 to compile the latest cvs kernel. HOWTO do
>this?
>
>edit the toplevel kernel Makefile and change the HOSTCC and CC lines 
>so that HOSTCC=gcc-3.2 and CC=$(CROSS_COMPILE)gcc-3.2
>

Oops the 32bits kernel which I obtain, boot well on my b2k but ip connection
problem is always there: the system seems to loop somewhere with ssh (heart
bit seems life and no more response neither at serial console, neither at
ssh prompt) and telnet causes an HPMC (bus timeout?)

I try find information on howto run sshd with gdb on the server (MARC ml
archives) but do not found any relevant info. And i don't know if Bruno LKCD
would help if near to be ready.

What can I do?

Joel

PS: this problem was not with gcc-3.2 (now snapshot 3.3) and it is a long
time I play with gcc snapshot to compare.
