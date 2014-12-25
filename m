From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 0/6] kbuild: refactor Makefiles related with cc-version
Date: Thu, 25 Dec 2014 14:31:22 +0900
Message-ID: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>,
	Michal Marek <mmarek@suse.cz>,
	Masahiro Yamada <yamada.m@jp.panasonic.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"H. Peter Anvin" <hpa@linux.intel.com>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Robert Richter <rrichter@cavium.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andi Kleen <ak@linux.intel.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Paul Mackerras <paulus@samba.org>,
	Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
To: linux-kbuild@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org




Masahiro Yamada (6):
  kbuild: fix cc-ifversion macro
  kbuild: do not add $(call ...) to invoke cc-version or cc-fullversion
  kbuild,gcov: remove unnecessary workaround
  kbuild,gcov: simplify kernel/gcov/Makefile
  kbuild: allow cc-ifversion to have the argument for false condition
  kbuild,gcov: simplify kernel/gcov/Makefile more

 Documentation/kbuild/makefiles.txt |  9 +++++----
 arch/parisc/Makefile               |  2 +-
 arch/powerpc/Makefile              |  6 +++---
 arch/x86/Makefile.um               |  2 +-
 kernel/gcov/Makefile               | 36 +++++-------------------------------
 scripts/Kbuild.include             |  7 ++-----
 6 files changed, 17 insertions(+), 45 deletions(-)

-- 
1.9.1
