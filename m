From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] PR10237 [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203
Date: Sat, 29 Mar 2003 07:21:36 +0100
Message-ID: <16005.15216.140200.591414__15374.5276308202$1416622340$gmane$org@gargle.gargle.HOWL>
References: <20030327061004.19985.qmail@sources.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: gcc-gnats@gcc.gnu.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: rbradetich@uswest.net
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030327061004.19985.qmail@sources.redhat.com>
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
