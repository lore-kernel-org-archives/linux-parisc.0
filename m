From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/2] Linker script cleanup patches for parisc
Date: Sun, 27 Sep 2009 23:02:11 +0200
Message-ID: <4ABFD2D3.5050606@gmx.de>
References: <1253306078-7066-1-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>
To: Tim Abbott <tabbott@ksplice.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1253306078-7066-1-git-send-email-tabbott@ksplice.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09/18/2009 10:34 PM, Tim Abbott wrote:
> This is an updated version of the patch series I sent on September 6
> cleaning up the parisc architecture's linker scripts.  [....]
> 	-Tim Abbott
>
> Tim Abbott (2):
>    parisc: Clean up linker script using new linker script macros.
>    parisc: Remove useless altinstructions code copied from x86.
>
>   arch/parisc/kernel/vmlinux.lds.S |  104 ++------------------------------------
>   1 files changed, 4 insertions(+), 100 deletions(-)
  
Tim, thanks for your work!

Sadly it broke the parisc build in two places:
a) THREAD_SIZE can't be used in the vmlinux.lds.S file
b) It generates linker errors like "local symbol 0: discarded in section `.exit.text' from kernel/built-in.o".

Attached patch below fixes both issues. Tested with 32- and 64-bit parisc kernel.

Helge

--------
parisc: Fix linker script breakage.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 699cf8e..7e76f03 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -287,6 +287,8 @@ int main(void)
  	DEFINE(ASM_PFN_PTE_SHIFT, PFN_PTE_SHIFT);
  	DEFINE(ASM_PT_INITIAL, PT_INITIAL);
  	BLANK();
+	DEFINE(ASM_THREAD_SIZE, THREAD_SIZE);
+	BLANK();
  	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
  	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
  	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 775be27..8347dfc 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -89,7 +89,7 @@ SECTIONS
  	}
  
  	/* Data */
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, ASM_THREAD_SIZE)
  
  	/* PA-RISC locks requires 16-byte alignment */
  	. = ALIGN(16);
@@ -135,6 +135,16 @@ SECTIONS
  	INIT_TEXT_SECTION(16384)
  	INIT_DATA_SECTION(16)
  
+	/* we have to discard exit text and such at runtime, not link time */
+	.exit.text :
+	{
+		EXIT_TEXT
+	}
+	.exit.data :
+	{
+		EXIT_DATA
+	}
+
  	PERCPU(PAGE_SIZE)
  	. = ALIGN(PAGE_SIZE);
  	__init_end = .;
