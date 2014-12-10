From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix out-of-register compiler error in ldcw inline
 assembler function
Date: Thu, 11 Dec 2014 00:08:04 +0100
Message-ID: <5488D254.7010401@gmx.de>
References: <20141021194614.GA14418@ls3530.box> <BLU436-SMTP234E0B9D24642C60497B1EB97940@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090501040908050703000208"
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP234E0B9D24642C60497B1EB97940@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------090501040908050703000208
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2014 10:01 PM, John David Anglin wrote:
> On 10/21/2014 3:46 PM, Helge Deller wrote:
>>   /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
>> -#define __ldcw(a) ({                        \
>> -    unsigned __ret;                        \
>> -    __asm__ __volatile__(__LDCW " 0(%2),%0"            \
>> -        : "=r" (__ret), "+m" (*(a)) : "r" (a));        \
>> -    __ret;                            \
>> -})
>> +static inline unsigned int __ldcw(volatile unsigned int *address)
>> +{
>> +    unsigned int ret;
>> +    register volatile unsigned int *a = address;
>> +    __asm__ __volatile__(__LDCW " 0(%2),%0"
>> +        : "=r" (ret), "+m" (*(a)) : "r" (a));
>> +    return ret;
>> +}
> You could keep the old macro version for 32-bit builds as the problem shouldn't occur there.

Attached is an updated patch/work-around which just reuses the existing register.
I don't like this patch much, but it's better than nothing for now.

Helge
  


--------------090501040908050703000208
Content-Type: text/x-patch;
 name="ldcw2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ldcw2.patch"

diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index d2d11b7..989595d 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -1,6 +1,8 @@
 #ifndef __PARISC_LDCW_H
 #define __PARISC_LDCW_H
 
+#include <linux/compiler.h>
+
 #ifndef CONFIG_PA20
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
    and GCC only guarantees 8-byte alignment for stack locals, we can't
@@ -34,12 +36,22 @@
 #endif /*!CONFIG_PA20*/
 
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
-#define __ldcw(a) ({						\
-	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
-		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
-	__ret;							\
-})
+static inline unsigned int __ldcw(volatile unsigned int *address)
+{
+#if GCC_VERSION >= 40900
+	/* work around gcc-4.9 bug:
+	 * error: can't find a register in class 'R1_REGS' while reloading 'asm'
+	 */
+	__asm__ __volatile__(__LDCW " 0(%0),%0"
+		: "=r" (address), "+m" (*(address)) : "0" (address));
+	return (unsigned long) address;
+#else
+	unsigned int val;
+	__asm__ __volatile__(__LDCW " 0(%2),%0"
+		: "=r" (val), "+m" (*(address)) : "r" (address));
+	return val;
+#endif
+}
 
 #ifdef CONFIG_SMP
 # define __lock_aligned __attribute__((__section__(".data..lock_aligned")))

--------------090501040908050703000208--
