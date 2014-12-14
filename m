From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: fix out-of-register compiler error in ldcw inline assembler function
Date: Sun, 14 Dec 2014 10:49:11 -0500
Message-ID: <A73C80F5-1200-437F-9199-2B916E3457B4@bell.net>
References: <20141021194614.GA14418@ls3530.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary=Apple-Mail-10-30804288
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141021194614.GA14418@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-10-30804288
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

On 21-Oct-14, at 3:46 PM, Helge Deller wrote:

> Sometimes we face this compiler error:
>
> arch/parisc/include/asm/ldcw.h:39:2: error: can't find a register in  
> class 'R1_REGS' while reloading 'asm'
> 	__asm__ __volatile__(__LDCW " 0(%2),%0"...
> 	note: in expansion of macro '__ldcw'
> 	error: 'asm' operand has impossible constraints
>
> Dave suggested:
> Likely the problem can be fixed by making __ldcw a static inline  
> function and
> forcing the argument 'a' to a specific register before using in ldcw.
>
> Since it's not easy to reproduce this bug, this patch now tries to  
> still let
> the compiler decide on which register should be used. If it doesn't  
> work, we'll
> have to assign a specific register as suggested by Dave.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: John David Anglin <dave.anglin@bell.net>
>
> diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/ 
> asm/ldcw.h
> index d2d11b7..b951e01 100644
> --- a/arch/parisc/include/asm/ldcw.h
> +++ b/arch/parisc/include/asm/ldcw.h
> @@ -34,12 +34,14 @@
> #endif /*!CONFIG_PA20*/
>
> /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
> -#define __ldcw(a) ({						\
> -	unsigned __ret;						\
> -	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
> -		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
> -	__ret;							\
> -})
> +static inline unsigned int __ldcw(volatile unsigned int *address)
> +{
> +	unsigned int ret;
> +	register volatile unsigned int *a = address;
> +	__asm__ __volatile__(__LDCW " 0(%2),%0"
> +		: "=r" (ret), "+m" (*(a)) : "r" (a));
> +	return ret;
> +}
>
> #ifdef CONFIG_SMP
> # define __lock_aligned  
> __attribute__((__section__(".data..lock_aligned")))
>


Helge, could you test the attached patch.  Updated comment in change  
explains the "memory"
clobber.  It's been lightly tested.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---



--Apple-Mail-10-30804288
Content-Disposition: attachment;
	filename=ldcw.h.d.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="ldcw.h.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index d2d11b7..8121aa6 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -33,11 +33,18 @@
 
 #endif /*!CONFIG_PA20*/
 
-/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
+/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
+   We don't explicitly expose that "*a" may be written as reload
+   fails to find a register in class R1_REGS when "a" needs to be
+   reloaded when generating 64-bit PIC code.  Instead, we clobber
+   memory to indicate to the compiler that the assembly code reads
+   or writes to items other than those listed in the input and output
+   operands.  This may pessimize the code somewhat but __ldcw is
+   usually used within code blocks surrounded by memory barriors.  */
 #define __ldcw(a) ({						\
 	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
-		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
+	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
+		: "=r" (__ret) : "r" (a) : "memory");		\
 	__ret;							\
 })
 

--Apple-Mail-10-30804288
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-10-30804288--
