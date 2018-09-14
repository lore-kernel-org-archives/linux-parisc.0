From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 14/30] memblock: add align parameter to memblock_alloc_node()
Date: Fri, 14 Sep 2018 15:10:29 +0300
Message-ID: <1536927045-23536-15-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mips@linux-mips.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Russell King <linux@armlinux.org.uk>, Rich Felker <dalias@libc.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 linux-alpha@vge
To: linux-mm@kvack.org
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org

With the align parameter memblock_alloc_node() can be used as drop in
replacement for alloc_bootmem_pages_node() and __alloc_bootmem_node(),
which is done in the following patches.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 include/linux/bootmem.h | 4 ++--
 mm/sparse.c             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/bootmem.h b/include/linux/bootmem.h
index 7d91f0f..3896af2 100644
--- a/include/linux/bootmem.h
+++ b/include/linux/bootmem.h
@@ -157,9 +157,9 @@ static inline void * __init memblock_alloc_from_nopanic(
 }
 
 static inline void * __init memblock_alloc_node(
-						phys_addr_t size, int nid)
+		phys_addr_t size, phys_addr_t align, int nid)
 {
-	return memblock_alloc_try_nid(size, 0, BOOTMEM_LOW_LIMIT,
+	return memblock_alloc_try_nid(size, align, BOOTMEM_LOW_LIMIT,
 					    BOOTMEM_ALLOC_ACCESSIBLE, nid);
 }
 
diff --git a/mm/sparse.c b/mm/sparse.c
index 04e97af..509828f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -68,7 +68,7 @@ static noinline struct mem_section __ref *sparse_index_alloc(int nid)
 	if (slab_is_available())
 		section = kzalloc_node(array_size, GFP_KERNEL, nid);
 	else
-		section = memblock_alloc_node(array_size, nid);
+		section = memblock_alloc_node(array_size, 0, nid);
 
 	return section;
 }
-- 
2.7.4
