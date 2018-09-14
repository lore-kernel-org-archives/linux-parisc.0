From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 12/30] memblock: replace alloc_bootmem_low with
 memblock_alloc_low
Date: Fri, 14 Sep 2018 15:10:27 +0300
Message-ID: <1536927045-23536-13-git-send-email-rppt@linux.vnet.ibm.com>
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

The alloc_bootmem_low(size) allocates low memory with default alignement
and can be replcaed by memblock_alloc_low(size, 0)

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 arch/arm64/kernel/setup.c     | 2 +-
 arch/unicore32/kernel/setup.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 5b4fac4..cf7a7b7 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -213,7 +213,7 @@ static void __init request_standard_resources(void)
 	kernel_data.end     = __pa_symbol(_end - 1);
 
 	for_each_memblock(memory, region) {
-		res = alloc_bootmem_low(sizeof(*res));
+		res = memblock_alloc_low(sizeof(*res), 0);
 		if (memblock_is_nomap(region)) {
 			res->name  = "reserved";
 			res->flags = IORESOURCE_MEM;
diff --git a/arch/unicore32/kernel/setup.c b/arch/unicore32/kernel/setup.c
index c2bffa5..9f163f9 100644
--- a/arch/unicore32/kernel/setup.c
+++ b/arch/unicore32/kernel/setup.c
@@ -207,7 +207,7 @@ request_standard_resources(struct meminfo *mi)
 		if (mi->bank[i].size == 0)
 			continue;
 
-		res = alloc_bootmem_low(sizeof(*res));
+		res = memblock_alloc_low(sizeof(*res), 0);
 		res->name  = "System RAM";
 		res->start = mi->bank[i].start;
 		res->end   = mi->bank[i].start + mi->bank[i].size - 1;
-- 
2.7.4
