Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27017482B
	for <parisc-linux@parisc-linux.org>; Thu,  2 May 2002 11:35:12 -0600 (MDT)
Date: Thu, 2 May 2002 18:15:05 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] wishlist projects, looking for volunteers
Message-ID: <20020502171505.GQ1617@sleepie.demon.co.uk>
References: <20020430062137.GF30370@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020430062137.GF30370@tausq.org>
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

Hi Randolph,

On Mon, Apr 29, 2002 at 11:21:37PM -0700, Randolph Chung wrote:
> ltrace
> - this is a function-call level tracer (as opposed to strace, which is
>   more on the syscall level). The current ltrace source has some
>   assumptions about ELF relocation layout that doesn't work on hppa. It
>   shouldn't be *hard* to fix this if you understand how pa relocation
>   stubs are generated...

Had a bit of a look at this; basically it wants to set breakpoints on
all the stubs for library calls from the target program.  On i386 that's
easy, as the reloc gives you an entry in the .plt, which is an indirect
jmp - so it just sets a breakpoint on that jmp.  The fact that the
loaction it indirects through initially points at the dynamic linker
code, and then is later fixed up to point to the library directly is
irrelevant.

On parisc, our .plt entry is just a function address plus data pointer
pair.  Where the mainline code calls a library function there is a
call to a stub that reads the .plt entry and jumps to the location it
references.  Initially that .plt entry will point at the dynamic linker
code, before being fixed up to reference the library function.

So, ideally we want to set a breakpoint on the stub that references the
.plt entry, but I don't see how we can locate that.  We only have a
reference to the .plt entry address, right?

(a) have I got that basically right?, and
(b) did you have any ideas on how we might make ltrace work?

Cheers,
  Richard
