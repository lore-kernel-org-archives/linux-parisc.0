Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F69A4840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Nov 2003 16:50:39 -0700 (MST)
Message-ID: <3FC930CD.9070105@tiscali.be>
Date: Sat, 29 Nov 2003 23:50:37 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better
 with gcc
References: <200311261654.hAQGsUCa011684@hiauly1.hia.nrc.ca>
In-Reply-To: <200311261654.hAQGsUCa011684@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


John David Anglin wrote:
>>+/* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
>>+   and GCC only guarantees 8-byte alignment for stack locals, we can't
>>+   be assured of 16-byte alignment for atomic lock data even if we
>>+   specify "__attribute ((aligned(16)))" in the type declaration.  So,
>>+   we use a struct containing an array of four ints for the atomic lock
>>+   type and dynamically select the 16-byte aligned int from the array
>>+   for the semaphore.  */
>>+#define __PA_LDCW_ALIGNMENT 16
>>+#define __ldcw_align(a) ({ \
>>+  unsigned long __ret = (unsigned long) a;                     		\
>>+  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT - 1); \
>>+  (unsigned int *) __ret;                                               \
>>+})
> 
> 
> Change cast to "volatile unsigned int *".
> 
> 
>> typedef struct {
>>-	volatile unsigned int __attribute__((aligned(16))) lock;
>>+	volatile unsigned int lock[4];
>> } spinlock_t;
>> #endif
> 
> 
> Is the struct necessary?  For example,
> 
hmm i supposed that came from 2.4 struct:
typedef struct {
#ifdef CONFIG_PA20
	volatile unsigned int lock;
#else
	volatile unsigned int __attribute__((aligned(16))) lock;
#endif
#ifdef CONFIG_DEBUG_SPINLOCK
	volatile unsigned long owner_pc;
	volatile unsigned long owner_cpu;
#endif
} spinlock_t;

But I don't know yet if CONFIG_DEBUG_SPINLOCK is still foreseen for 2.6

Thanks,
	Joel
