Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4903B487C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 00:20:55 -0700 (MST)
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1047919859.14507.21.camel@beavis.ybsoft.com>
References: <1047917954.14507.15.camel@beavis.ybsoft.com>
	 <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk>
	 <1047919859.14507.21.camel@beavis.ybsoft.com>
Content-Type: text/plain
Message-Id: <1047972053.19011.14.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 18 Mar 2003 00:20:54 -0700
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

I have spend some more time tracking this problem down.

I have found the offending line in the kernel that causes
this problem, the rest of the RGH_FIX can be eliminated.

The symptom is with this line: 
	NEW_AUX_ENT(AT_ENTRY, exec->e_entry);

in fs/binfmt_elf.c:create_elf_tables().

If the that line is executed when the 
interpreter_type == INTERPRETER_NONE, the error shows up when
/lib/ld.so.1 is executed.  This line is fine when when the
interpreter_type == INTERPRTER_ELF ... which explains why
the system runs normally, and the error only manifests itself
when /lib/ld.so.1 is executed by hand.  (the /lib/ld.so.1 library 
does not set a PT_INTERP, so the interpreter is not set, where as
if a binary is executed, the interpreter is set to ELF).


The assert caused by /lib/ld.so.1 is caused by this line
in rtld.c:

	assert (GL(dl_rtld_map).l_libname); /* How else did we get here?  */

This assert is in the else clause of this if statement:


  if (! GL(dl_rtld_map).l_libname && GL(dl_rtld_map).l_name)


The whole purpose of this if statment, according to the comments,
is to deal with this senario, where the library was invoked directly,
and the PT_INTERP was not set.


I am rebuilding glibc from source on my C200 now (i.e. this will
probably take a while :)) and I will continue debugging. I just wanted
to give a status update in case someone else has an idea, or was working
on it.

Thanks,

- Ryan


-- 
Ryan Bradetich <rbradetich@uswest.net>
