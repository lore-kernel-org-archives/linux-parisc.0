Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C38C487F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 14:52:26 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by interzone.ucc.ie (8.9.3/8.9.3) with ESMTP id VAA28360
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 21:52:27 +0100 (BST)
Date: Fri, 21 Jun 2002 21:52:20 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0206212130310.4556-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] PA8000 modutils problems
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

Hi, I have some problems in compiling the latest kernels;

I tried pa35 (32bit), which caused unaligned address traps during boot
(IIRC it was e2fsck).
I rebooted with pa20, which worked (but has the known IO problems,
i.e. copying a full CD to hard disk with lock up the machine).
Later I tried compiling pa39 (32bit), but depmod reported
"unhandled relocation of type 74" for each function in each module.
Compiling 64bit with the (quite old) unofficial debs worked however,
but there are some "unresolved symbols" in a few (=4) modules,
each time the symbol is "__xchg64". I'm quite sure that in former times
all modules worked. Since these modules are not important to me
(smbfs and some ipv6 netfilter modules) there is no hurry ;)

I always compiled for the "PA8000" processor type; I know there were some
issues with the PA8000 optimization and modutils, but remeber that these
were fixed. Is this a regression ?

So far I'm running a 64bit kernel (because it's the only way it works),
but I want to stick to a 32bit kernel, because they may be more stable.

However I didn't try selecting any other CPU type (was just too lazy);
though there is a good chance that this would solve the modules problem.

BTW, I'm running debian/sid, updated yesterday.

One more question: is it a good idea to compile with gcc-3.1,
e.g. make CC=gcc-3.1 HOSTCC=gcc-3.1 vmlinux ?
Does gcc-3.1 generate better code (better optimized, fewer bugs?) or
should I stick to gcc-3.0 since this is the "recommended" compiler
(or at least the one the kernel developers use and know)

thanks in advance, max
--
I am the "ILOVEGNU" signature virus. Just copy me to your signature.
This email was infected under the terms of the GNU General Public License.
