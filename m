Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4EC99482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 12:22:02 -0700 (MST)
To: Lennert Buytenhek <buytenh@gnu.org>
Cc: parisc-linux@lists.parisc-linux.org
Date: Wed, 02 Jan 2002 11:21:57 -0800
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <20020102192157.6F97940AB@dhcp66.cup.hp.com>
Subject: [parisc-linux] [PATCH][RFC][CFT] remove global errno from the kernel, make _sysca (fwd)
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

Lennert,
I'm one of the maintainers.
I've cc'd the proper parisc kernel list.

thanks,
grant

------- Forwarded Message

From: Lennert Buytenhek <buytenh@gnu.org>
To: linux-arm-kernel@lists.arm.linux.org.uk,
	dev-etrax@axis.com, linux-ia64@linuxia64.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@oss.sgi.com,
	linux-390@vm.marist.edu,
	sparclinux@vger.kernel.org,
	ultralinux@vger.kernel.org
Subject: [PATCH][RFC][CFT] remove global errno from the kernel, make _syscallX kernel-only

(Apologies for the massive cross-post, but this is a matter that concerns
all architectures.  For archs that don't have a maintainer listed in
MAINTAINERS I grabbed a random email address from arch/$arch/kernel/*.
If you're not the person to answer this for your $arch, please forward
to an appropriate person/list.)


Hi,

As I mentioned in my email to l-k with subject '[PATCH][RFC] global
errno considered harmful' earlier today, having a global errno in the
kernel doesn't really make sense.

Referenced patch [1] deletes all mention of a global errno from the
kernel, fixes up a very small number of callers that were depending on
it, and fixes up the syscall helpers in include/asm-$arch/unistd.h not
to write an error code to errno in case of error anymore.

This subtly breaks userspace code that uses these helpers, but the general
consensus seems to be that userspace code shouldn't be touching these in
the first place.  Patch [2] fixes up asm-$arch/unistd.h to only define
_syscallX in case __KERNEL_SYSCALLS__ is defined, to try and actively
break userspace (ab)users of this code (thanks to Ralf Baechle for
suggesting I should do something along these lines).

What I would like to know from each architecture team:
- - What is your arch's policy on userspace usage of asm/unistd.h, and
  consequently, what is your opinion on the goal these patches
  aim for?
- - Are the changes I made in [1] and [2] for your $arch technically
  correct?
Please CC me on replies as I'm not on any of the lists posted to.

My intention is to push these to Linus for 2.5 if everyone agrees.
They're probably too intrusive for 2.4 (although I'd love people
to convince me otherwise).


cheers,
Lennert

[1] http://www.math.leidenuniv.nl/~buytenh/errno_ectomy-1.diff
[2] http://www.math.leidenuniv.nl/~buytenh/errno_ectomy-1-to-2.diff

_______________________________________________
Linux-IA64 mailing list
Linux-IA64@linuxia64.org
http://lists.linuxia64.org/lists/listinfo/linux-ia64


------- End of Forwarded Message
