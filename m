Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5342E4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 14:35:07 -0600 (MDT)
Message-ID: <3D825B1E.3090701@freebel.net>
Date: Fri, 13 Sep 2002 21:39:42 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: [Fwd: Re: [parisc-linux] Inline Assembly Help request]
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Paul Bame wrote:
 > As jda mentioned, the ex_table stuff is a bit complex.  You can find out
 > how the x86 exception table works in linux/Documentation/exception.txt
 > but parisc is a little different.
 > I leave it to you to locate the relevent
 > exception handler somewhere in arch/parisc/kernel/  A thorough 
understanding
 > of the exception handler method is necessary to understand and/or change
 > the code you are working with.
 >
is it do_page_fault (in fault.c) which use  search_exception_table(...)?

Thanks,
	Joel


PS: Do you have an idea how may I figure out in which registers are
stored the two parts of a 64bits int (always contigus) or would it be
better to work with x address (in put_user_asm("stw",x,ptr)).

I also presume that there is noe way for gas to simulate (some kind of
macro ) std and ldd from pa2 onto pa1. It would be too easy :)?
