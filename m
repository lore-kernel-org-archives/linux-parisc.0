From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 17:40:25 +0900 (JST)
Message-ID: <20110420174027.4631.A69D9226@jp.fujitsu.com>
References: <20110420161615.462D.A69D9226@jp.fujitsu.com> <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kosaki.motohiro@jp.fujitsu.com, Christoph Lameter <cl@linux.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>,
	Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > btw, x86 don't have an issue. Probably it's a reason why this issue=
 was neglected
> > long time.
> >
> > arch/x86/Kconfig
> > -------------------------------------
> > config ARCH_DISCONTIGMEM_ENABLE
> > =A0 =A0 =A0 =A0def_bool y
> > =A0 =A0 =A0 =A0depends on NUMA && X86_32
>=20
> That part makes me think the best option is to make parisc do
> CONFIG_NUMA as well regardless of the historical intent was.
>=20
>                         Pekka

This?

compile test only.

---
 arch/parisc/Kconfig            |    7 +++++++
 include/asm-generic/topology.h |    4 ----
 include/linux/topology.h       |    2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 69ff049..0bf9ae8 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -229,6 +229,12 @@ config HOTPLUG_CPU
 	default y if SMP
 	select HOTPLUG
=20
+config NUMA
+	bool "NUMA support"
+	help
+	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
+	  Access).
+
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool y
 	depends on 64BIT
@@ -236,6 +242,7 @@ config ARCH_SELECT_MEMORY_MODEL
 config ARCH_DISCONTIGMEM_ENABLE
 	def_bool y
 	depends on 64BIT
+	depends on NUMA
=20
 config ARCH_FLATMEM_ENABLE
 	def_bool y
diff --git a/include/asm-generic/topology.h b/include/asm-generic/topol=
ogy.h
index fc824e2..932567b 100644
--- a/include/asm-generic/topology.h
+++ b/include/asm-generic/topology.h
@@ -27,8 +27,6 @@
 #ifndef _ASM_GENERIC_TOPOLOGY_H
 #define _ASM_GENERIC_TOPOLOGY_H
=20
-#ifndef	CONFIG_NUMA
-
 /* Other architectures wishing to use this simple topology API should =
fill
    in the below functions as appropriate in their own <asm/topology.h>=
 file. */
 #ifndef cpu_to_node
@@ -60,8 +58,6 @@
 				 cpumask_of_node(pcibus_to_node(bus)))
 #endif
=20
-#endif	/* CONFIG_NUMA */
