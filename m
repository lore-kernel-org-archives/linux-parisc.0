From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/2] Linker script cleanup patches for parisc
Date: Mon, 28 Sep 2009 00:39:47 +0200
Message-ID: <4ABFE9B3.8000000@gmx.de>
References: <1253306078-7066-1-git-send-email-tabbott@ksplice.com> <4ABFD2D3.5050606@gmx.de> <alpine.DEB.1.10.0909271719570.14151@dr-wily.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>
To: Tim Abbott <tabbott@ksplice.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0909271719570.14151@dr-wily.mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09/27/2009 11:25 PM, Tim Abbott wrote:
> On Sun, 27 Sep 2009, Helge Deller wrote:
>
>>   Tim, thanks for your work!
>>
>> Sadly it broke the parisc build in two places:
>> a) THREAD_SIZE can't be used in the vmlinux.lds.S file
>> b) It generates linker errors like "local symbol 0: discarded in section
>> `.exit.text' from kernel/built-in.o".
>
> Sorry about that -- I should have tried harder to get someone to test this
> one, since parisc is one of the architectures for which I don't have a
> cross-compiler.

No problem. It was on my todo-list to test your patch, but then it
already got merged :-)

>> Attached patch below fixes both issues. Tested with 32- and 64-bit parisc
>> kernel.
>
> The .exit.text change looks fine.

Good.

> [...]
> Rather than adding a new definition in asm-offsets.c, I think it'll be
> better to do something like the following to make the normal THREAD_SIZE
> definition available in the linker script and other assembly files:
>
> 	-Tim Abbott
>
> parisc: Make THREAD_SIZE available to assembly files and linker scripts.
>
> Signed-off-by: Tim Abbott<tabbott@ksplice.com>

Yes, much better.
Acked-by: Helge Deller <deller@gmx.de>

But with this change, the vmlinux.lds.S file needs to include
the <asm/thread_info.h> file as well. I've added the adjusted patch
to vmlinux.lds.S below.

> ---
>   arch/parisc/include/asm/thread_info.h |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
> index ac775a7..51bca20 100644
> --- a/arch/parisc/include/asm/thread_info.h
> +++ b/arch/parisc/include/asm/thread_info.h
> @@ -32,6 +32,11 @@ struct thread_info {
>   #define init_thread_info        (init_thread_union.thread_info)
>   #define init_stack              (init_thread_union.stack)
>
> +/* how to get the thread information struct from C */
> +#define current_thread_info()	((struct thread_info *)mfctl(30))
> +
> +#endif /* !__ASSEMBLY */
> +
>   /* thread information allocation */
>
>   #define THREAD_SIZE_ORDER            2
> @@ -40,11 +45,6 @@ struct thread_info {
>   #define THREAD_SIZE             (PAGE_SIZE<<  THREAD_SIZE_ORDER)
>   #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
>
> -/* how to get the thread information struct from C */
> -#define current_thread_info()	((struct thread_info *)mfctl(30))
> -
> -#endif /* !__ASSEMBLY */
> -
>   #define PREEMPT_ACTIVE_BIT	28
>   #define PREEMPT_ACTIVE		(1<<  PREEMPT_ACTIVE_BIT)
>

Adjusted patch to vmlinux.lds.S:

parisc: Fix linker script breakage.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 775be27..7fc2c3d 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -28,6 +28,7 @@
  #include <asm/cache.h>
  #include <asm/page.h>
  #include <asm/asm-offsets.h>
+#include <asm/thread_info.h>
  	
  /* ld script to make hppa Linux kernel */
  #ifndef CONFIG_64BIT
@@ -135,6 +136,16 @@ SECTIONS
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
