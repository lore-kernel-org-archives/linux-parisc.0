From: Ryan Bradetich <rbradetich@uswest.net>
Subject: [parisc-linux] /lib/ld.so.1 (glibc) issues on parisc-linux 2.5 kernel??
Date: 20 Mar 2003 21:18:46 -0700
Message-ID: <1048220325.15076.160.camel__42081.9034371108$1416622313$gmane$org@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: libc-alpha@sources.redhat.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello libc hackers,

I am investigating a problem that occurs between ld.so.1
and the kernel on the 2.4 (w/o the added hack to fix this) and 2.5 
kernels. The problem manifested itself when I tried to run the ltp
tests, and is shown below:


rbrad@vega:~$ /lib/ld.so.1 --verify /bin/sh
Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion
`_rtld_local._dl_rtld_map.l_libname' failed!


The system is running Debian Linux with this version of glibc:
ii  libc6          2.3.1-14       GNU C Library: Shared libraries and


The complete email thread on the parisc-linux list is located at:

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-March/019460.html




I have basically tracked this mis-match down to this problem:

With this statement in the kernel (fs/binfmt_elf.c:create_elf_tables())

	NEW_AUX_ENT(AT_ENTRY, exec->e_entry);

The user_entry and ENTRY_POINTS are:

	user_entry: 41001fb4
	ENTRY_POINT: 41027082


With this statement not present, and the interpreter_type == 0 (No
Interpreter) .. the user_entry and ENTRY_POINT match.  [Note: The
assert goes away at this point].

	user_entry: 41027082
	ENTRY_POINT: 41027082


So at this point, I am not sure if the kernel is setting the
exec->e_entry incorrectly, or if the ENTRY_POINT needs to be adjusted
in glibc for the hppa platform.


Carlos O'Donell suggested I forward this message to this list for
additional advice.  Please cc me on any replies since I am not
subscribed to this list.

Thanks,

- Ryan


-- 
Ryan Bradetich <rbradetich@uswest.net>
