Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BBFF4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 01:15:53 -0700 (MST)
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1047972053.19011.14.camel@beavis.ybsoft.com>
References: <1047917954.14507.15.camel@beavis.ybsoft.com>
	 <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk>
	 <1047919859.14507.21.camel@beavis.ybsoft.com>
	 <1047972053.19011.14.camel@beavis.ybsoft.com>
Content-Type: text/plain
Message-Id: <1048148150.19036.11.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 20 Mar 2003 01:15:51 -0700
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

Continuing to track this problem down, I have found the
following:

The Problem appears to be that when the 

	NEW_AUX_ENT(AT_ENTRY, exec->e_entry)

is called, it puts in the wrong entry point.

The reason I believe the error manifests itself is because
of this if statment:

  if (*user_entry == (ElfW(Addr)) ENTRY_POINT)

I have tracked down values of the user_entry and ENTRY_POINT:

	user_entry: 41001fb4
	ENTRY_POINT: 41027082

Since they are different, the if statement fails... My belief
is they should be the same when /lib/ld.so.1 is called because
of the following comment inside this if statement:


      /* Ho ho.  We are not the program interpreter!  We are the program
         itself!  This means someone ran ld.so as a command.  Well, that
         might be convenient to do sometimes.  We support it by
         interpreting the args like this:
                                                                                
         ld.so PROGRAM ARGS...
 
         The first argument is the name of a file containing an ELF
         executable we will load and run with the following arguments.
         To simplify life here, PROGRAM is searched for using the
         normal rules for shared objects, rather than $PATH or anything
         like that.  We just load it and use its entry point; we don't
         pay attention to its PT_INTERP command (we are the interpreter
         ourselves).  This is an easy way to test a new ld.so before
         installing it.  */



to me there looks like two things that could be wrong:

1.  The exec->e_entry needs to be fixed in the kernel, so it matches
    the _start of the library.

2.  The ENTRY_POINT needs to be changed in glibc for parisc-linux.


ia64 seems to be the only arch that changes the value of ENTRY_POINT,
so this doesn't seem likely...

./glibc-2.3.1/sysdeps/generic/entry.h:#define ENTRY_POINT _start
./glibc-2.3.1/sysdeps/ia64/elf/entry.h:#define ENTRY_POINT (((long int
*) _start)[0])



I am planning to pursue option 1 unless someone thinks option 2 is the
correct option to pursue.


Thanks,

- Ryan


-- 
Ryan Bradetich <rbradetich@uswest.net>
