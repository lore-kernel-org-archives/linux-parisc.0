Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id 00B8A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 23:10:04 -0700 (MST)
Date: 27 Mar 2003 06:10:04 -0000
Message-ID: <20030327061004.19985.qmail@sources.redhat.com>
To: gcc-gnats@gcc.gnu.org
Cc: debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
From: rbradetich@uswest.net
Reply-To: rbradetich@uswest.net
Subject: [parisc-linux] [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203
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

>Category:       c
>Synopsis:       [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203
>Confidential:   no
>Severity:       serious
>Priority:       medium
>Class:          ice-on-legal-code
>Submitter-Id:   net
>Originator:     rbradetich@uswest.net
>Release:        unknown-1.0
>Environment:
System: Linux vega 2.5.65-pa3 #37 Sun Mar 23 17:41:14 MST 2003 parisc unknown unknown GNU/Linux
Architecture: parisc

host: hppa-unknown-linux-gnu
build: hppa-unknown-linux-gnu
target: hppa-unknown-linux-gnu
configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,pascal,objc,ada --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.2 --enable-shared --with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-clocale=gnu --enable-objc-gc hppa-linux
>Description:
u_free.c: In function `free_picture_entry':
u_free.c:16: unrecognizable insn:
(insn 43 42 46 (clobber (reg/i:SI 28 %r28)) -1 (insn_list:REG_DEP_OUTPUT 40 (nil))
    (nil))
u_free.c:16: Internal compiler error in insn_default_length, at insn-attrtab.c:1203
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
>How-To-Repeat:
gcc -O2 -g u_free.i
>Fix:
unknown.
>Unformatted:
----gnatsweb-attachment----
Content-Type: application/octet-stream; name="u_free.i"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="u_free.i"

c3RydWN0IF9waWNzIHsgaW50IHJlZmNvdW50OyB9Owp2b2lkIHVzZShpbnQgeCk7CmludCBmcmVl
X3BpY3R1cmVfZW50cnkoc3RydWN0IF9waWNzICpwaWN0dXJlKSB7CglpZiAocGljdHVyZS0+cmVm
Y291bnQgPT0gMCkgewoJCXVzZShwaWN0dXJlLT5yZWZjb3VudCk7CgkJcmV0dXJuOwoJfQp9Cg==
