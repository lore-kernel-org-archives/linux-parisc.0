Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1541E4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 12:13:59 -0700 (MST)
Date: Sun, 26 Oct 2003 11:18:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Message-ID: <20031026191804.GM24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030812060244.GE21328@tausq.org> <20031026073751.GH24406@tausq.org> <20031026164926.GE26587@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031026164926.GE26587@systemhalted>
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

> I don't see why #0 can't be used here. Then again, why can't you code
> the syscall number directly into the hex? Are you expecting it to
> change? :)

no, i can (will) just encode it into the hex.... 

> Adding stack here can be detremental to the userspace program. It's not
> expecting you to have a stack, and it expects the syscall to live within 
> its calling frame. When we setup the signal return trampoline we don't
> mess with the stack either :) Though this context is different.

userspace should not see this stack...

let's say your syscall sequence looks like this:

[...]
ble 0x100(%sr2, %r0)    /* call nanosleep */
ldi 0xa2,%r20
ldi -1000,r1
[...]

normally when you return from the kernel, you return at the second ldi
insn. In this case, you jump to a trampoline that happens to sit on your
stack, so the insn sequence becomes essentially

[...]
ble 0x100(%sr2, %r0)    /* call nanosleep */
ldi 0xa2,%r20
    ldo 64(%sp),%sp
    ble 0x100(%sr2, %r0)
    ldi 0,%r20
    b,l .+8, %r21
    [...]
    bv %r0(%r20)
    ldo -64(%sp),%sp
ldi -1000,r1
[...]

(indented part added by the kernel)

so it should be invisible to the syscall wrapper/application.

or am i missing something? :-)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
