Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF50C488E
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 09:52:12 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <1026748321.3d32efa170ebe@webmail.tiscalinet.be>
Date: Mon, 15 Jul 2002 17:52:01 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, randolph@tausq.org,
	parisc-linux@parisc-linux.org
References: <200207151524.g6FFOqqE023640@hiauly1.hia.nrc.ca>
In-Reply-To: <200207151524.g6FFOqqE023640@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > (I just note on the sti console)
> > sshd (pid 322): illegal instruction (code 8)
> > ...
> > kernel panic...
> 
> This is just a guess but I will wager that this problem is related
> to the problems with expect, the cc1plus crash and the mmap issues
> noted
> elsewhere with SMP kernels.  There seem to be circumstances where the
> kernel crashes when a user application traps unexpectedly.
> 
> Joel, you should be able to run sshd under gdb and find what the
> cause of the illegal instruction is.  It should not be a problem
> to download and build 3.4p1 with gcc 3.2 from <http://www.openssh.org>.
> Build at -O1 with debugging enabled.  There are examples on their
> mail list on how to run sshd in debug mode.  If the situation is
> similar to the cc1plus crash, gdb will prevent the system from
> crashing when the fault occurs.
> 
Ok Dave,

I will have a look.

Thanks a lot,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
