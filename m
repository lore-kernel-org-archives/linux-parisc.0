Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AE9B4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Mar 2003 23:25:21 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16005.15216.140200.591414@gargle.gargle.HOWL>
Date: Sat, 29 Mar 2003 07:21:36 +0100
To: rbradetich@uswest.net
Cc: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030327061004.19985.qmail@sources.redhat.com>
References: <20030327061004.19985.qmail@sources.redhat.com>
Subject: [parisc-linux] PR10237 [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203
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

rbradetich@uswest.net writes:
> u_free.c: In function `free_picture_entry':
> u_free.c:16: unrecognizable insn:
> (insn 43 42 46 (clobber (reg/i:SI 28 %r28)) -1 (insn_list:REG_DEP_OUTPUT 40 (nil))
>     (nil))
> u_free.c:16: Internal compiler error in insn_default_length, at insn-attrtab.c:1203
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
> >How-To-Repeat:
> gcc -O2 -g u_free.i

Fixed in 3.3 CVS 20030318
