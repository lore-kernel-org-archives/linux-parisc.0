Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1348F4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 07:57:13 -0600 (MDT)
Date: Thu, 29 Aug 2002 15:56:29 +0200
Message-ID: <3D53B3B70000883F@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
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

Hi Carlos,

>
>Joel,
>
>> I need to go back to kernel 2.4.18-pa61 and evms-1.0.1 (see problem in
>ml:
>> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-August/017368.html
>> with last 1.1.0 evsm release)
>
>Why do you need to regress versions?
Because:
"To investigate in more details the 'unalign access' problem I met with
evms,
I need first to upgrade to evms-1.1.0 with kernel 2.4.19.

After this upgrade, all evms tools failled and I got folowing kernel message
at the console:
kernel BUG at blkpg.c:252!
evms: ldev_mgr: error(-28): creating logical disk for device(8,0)."

The willy answer:
"Aw, crap.  It now seems to be `legal' to put_user a 64-bit argument on
a
32-bit system.  Someone needs to fix this in include/asm-parisc/uaccess.h"

But I am not able ($&##?? asm) to do.

>
>> Kernel build and operate correctly. I so recompile tools with -ggdb gcc
>> option. Then I use ddd to try to debug problem.
>
>What did you recompile with "-g"?

All evms tools and libs (from tarball the 'configure' the -g is a default,
I just add gdb)

>
>> So I first run without break and got from console:
>> evms_vgscan(7998): unaligned access to 0x0002aaae at ip=0x4020a0e3
>
>The unaligned handler took care of it, everything should still
>be okay.
>
>> Accepted but when 'continue' is launch:
>> warning: Cannot insert breakpoint 2:
>> Cannot access memory at address 0x4020a0e3
>> What do I wrong or what should I better do?
>
>AFAIK we are using software breakpoints in gdb, which means that
>at certain times we _can't_ insert a breakpoint.
>
>I'm still unclear about the issues here. What's wrong with evms?
>It dies from a SIGBUS (unaligned handler failed)? SIGSEGV?
>Operates incorrectly?

First of all I would like to be sure it is absolutley harmless.
Secondly it also seems (to be verify [*]) to awfully slowing down evms management
tools.
Thanks for your attention,
    Joel

PS: [*] another lvm tool is the Sistina release which did not present this
kind of 'unaligne access' and has a behaviour nearly the same as on my i386
box on which I also test the two tools.
