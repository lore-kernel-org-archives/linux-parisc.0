Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48F034840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 12:53:44 -0700 (MST)
Message-Id: <200310261953.h9QJrgex028823@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
To: randolph@tausq.org
Date: Sun, 26 Oct 2003 14:53:41 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031026191804.GM24406@tausq.org> from "Randolph Chung" at Oct 26, 2003 11:18:04 am
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

> [...]
> ble 0x100(%sr2, %r0)    /* call nanosleep */
> ldi 0xa2,%r20
>     ldo 64(%sp),%sp
>     ble 0x100(%sr2, %r0)
>     ldi 0,%r20
>     b,l .+8, %r21
>     [...]
>     bv %r0(%r20)
>     ldo -64(%sp),%sp
> ldi -1000,r1
> [...]
> 
> (indented part added by the kernel)
> 
> so it should be invisible to the syscall wrapper/application.
> 
> or am i missing something? :-)

You probably have to be careful here with respect to signals, etc.
Technically, the frame marker is supposed to move when a dynamic
stack allocation is done.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
