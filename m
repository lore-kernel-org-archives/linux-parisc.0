Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 763774829
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 13:17:05 -0600 (MDT)
Message-ID: <3D9F49FD.2040703@freebel.net>
Date: Sat, 05 Oct 2002 20:22:21 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Need help to improve uaccess.h patch
References: <3D8EED0B00001557@ocpmta5.be.tiscali.com> <20021004160833.GB5602@tausq.org>
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

Randolph Chung wrote:
> Note: i haven't tested the patch, just some first-pass comments:
> 
> 
>> #else
>> #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>> #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
>>@@ -68,27 +73,28 @@
>> ({                                                      \
>> 	register long __gu_err __asm__ ("r8") = 0;      \
>> 	register long __gu_val __asm__ ("r9") = 0;      \
>>+                                                        \
>>+        unsigned int __tmp = 0;                         \
>> 							\
>> 	if (segment_eq(get_fs(),KERNEL_DS)) {           \
>> 	    switch (sizeof(*(ptr))) {                   \
>>-	    case 1: __get_kernel_asm("ldb",ptr); break; \
>>-	    case 2: __get_kernel_asm("ldh",ptr); break; \
>>-	    case 4: __get_kernel_asm("ldw",ptr); break; \
>>-	    case 8: LDD_KERNEL(ptr); break;		\
>>+	    case 1: __get_kernel_asm("ldb",x, ptr); break; \
>>+	    case 2: __get_kernel_asm("ldh",x, ptr); break; \
>>+	    case 4: __get_kernel_asm("ldw",x, ptr); break; \
>>+	    case 8: LDD_KERNEL(x, ptr); break;		\
>> 	    default: BUG(); break;                      \
>> 	    }                                           \
>> 	}                                               \
>> 	else {                                          \
>> 	    switch (sizeof(*(ptr))) {                   \
>>-	    case 1: __get_user_asm("ldb",ptr); break;   \
>>-	    case 2: __get_user_asm("ldh",ptr); break;   \
>>-	    case 4: __get_user_asm("ldw",ptr); break;   \
>>-	    case 8: LDD_USER(ptr);  break;		\
>>+	    case 1: __get_user_asm("ldb",x, ptr); break;   \
>>+	    case 2: __get_user_asm("ldh",x, ptr); break;   \
>>+	    case 4: __get_user_asm("ldw",x, ptr); break;   \
>>+	    case 8: LDD_USER(x, ptr);  break;		\
>> 	    default: BUG(); break;                      \
>> 	    }                                           \
>> 	}                                               \
>> 							\
>>-	(x) = (__typeof__(*(ptr))) __gu_val;            \
>> 	__gu_err;                                       \
>> })
> 
> 
> why did you push the cast into the asm functions?
> 
Not actualy in the asm but well in the std #define __get_user_asm just 
after asm, because with gcc-3.0.4 I do not find any way to access (in 
__asm extension) the two integer part of a long long (which C allow). So 
I try (as better as I can) to use ptr and this cast does not seems 
anymore usefull in 64bit parts.

[Well, in mips 32 bits uaccess.h, I see that some prefix as D, M, L can 
be used to do this access. But if I test those one (example %D1) with 
hppa, gcc asks me send a bug report. I think that I would have to do it 
to improve gcc-3.3?]

> 
>>-#define __get_user_asm(ldx,ptr)                         \
>>+#define __get_kernel_asm_64(x, ptr)                         \
>>+        __asm__ ("\n\tldw\t4(%1),%3\n"                      \
>>+                 "1:\tstw\t%3,4(%2)\n"                      \
>>+                 "\tldw\t0(%1),%3\n"                        \
>>+                 "2:\tstw\t%3,0(%2)\n"                      \
>>+                "3:\n"                                      \
>>+                "\t.section __ex_table,\"a\"\n"             \
>>+                 "\t.word\t1b\n"                            \
>>+                 "\t.word\t(3b-1b)+1\n"                     \
>>+                 "\t.word\t2b\n"                            \
>>+                 "\t.word\t(3b-2b)+1\n"                     \
> 
> 
> what's with the +1?

That is my main doubt :(
In this uaccess.h, I read (but i am not quit sure to have understand all 
  fine aspect) that we have to 'jump' after the erronious code (for me 
3b-[12]b + 1 ? am i wrong? ). And understand +3 in get_user_asm because 
we would have to jump after the cast "(x) = (__typeof__(*(ptr))) 
__gu_val;". Is it wrong?

> 
> 
>> #define __put_user(x,ptr)                                       \
>> ({								\
>> 	register long __pu_err __asm__ ("r8") = 0;		\
>>+        unsigned long long X = (unsigned long long) x;          \
> 
> 
> why do you need this cast?

I need in fact to assigned x to X because I encounter put_user(0,PTR) 
(which became later .. (&0)... which is wrong). And the cast is just to 
avoid anoying warning if x is not a long long.

> 
> 
>>+        unsigned long long * __tmp = 0;                         \
> 
> 
> if __tmp is only used in the STD macro, you should eiter pass it to the
> macro or define it inside that macro.
> 
> 
>> 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
>> 	    switch (sizeof(*(ptr))) {                           \
>> 	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
>> 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
>> 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
>>-	    case 8: STD_KERNEL(x,ptr); break;			\
>>+	    case 8: STD_KERNEL(X,ptr); break;			\
>> 	    default: BUG(); break;                              \
>> 	    }                                                   \
>> 	}                                                       \
>>@@ -152,7 +193,7 @@
>> 	    case 1: __put_user_asm("stb",x,ptr); break;         \
>> 	    case 2: __put_user_asm("sth",x,ptr); break;         \
>> 	    case 4: __put_user_asm("stw",x,ptr); break;         \
>>-	    case 8: STD_USER(x,ptr); break;			\
>>+	    case 8: STD_USER(X,ptr); break;			\
>> 	    default: BUG(); break;                              \
>> 	    }                                                   \
>> 	}                                                       \
>>@@ -200,6 +241,22 @@
>> 		: "=r"(__pu_err)                            \
>> 		: "r"(ptr), "r"(x), "0"(__pu_err))
>> 
>>+#define __put_kernel_asm_64(X, ptr)                           \
>>+	__asm__ __volatile__ (                              \
>>+		"\n\tldw\t0(%2),%3\n"                       \
>>+		"1:\tstw\t%3,0(%1)\n"                 \
>>+		"\tldw\t4(%2),%3\n"		            \
>>+		"2:\tstw\t%3,4(%1)\n"                 \
>>+		"3:\n"					    \
>>+		"\t.section __ex_table,\"a\"\n"             \
>>+		 "\t.word\t1b\n"                            \
>>+		 "\t.word\t(3b-1b)+1\n"                     \
>>+		 "\t.word\t2b\n"                            \
>>+		 "\t.word\t(3b-2b)+1\n"                     \
> 
> 
> as above, why +1?

As early mentionned I do not well understand the original +1 (or +3) in 
the original put_user (get_user) and use what I think to have understand 
  (which seems to be wrong :( )

> 
> 
>>+		 "\t.previous"                              \
>>+		: "=r"(__pu_err)                            \
>>+		: "r"(ptr), "r"(&(X)), "r"(__tmp), "0"(__pu_err))
>>+
>> #define __put_user_asm(stx,x,ptr)                           \
>> 	__asm__ __volatile__ (                              \
>> 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
>>@@ -210,6 +267,23 @@
>> 		 "\t.previous"                              \
>> 		: "=r"(__pu_err)                            \
>> 		: "r"(ptr), "r"(x), "0"(__pu_err))
>>+
>>+#define __put_user_asm_64(X, ptr)                           \
>>+	__asm__ __volatile__ (                              \
>>+		"\n\tldw\t0(%2),%3\n"                       \
>>+		"1:\tstw\t%3,0(%%sr3,%1)\n"                 \
>>+		"\tldw\t4(%2),%3\n"		            \
>>+		"2:\tstw\t%3,4(%%sr3,%1)\n"                 \
>>+		"3:\n"					    \
>>+		"\t.section __ex_table,\"a\"\n"             \
>>+		 "\t.word\t1b\n"                            \
>>+		 "\t.word\t(3b-1b)+1\n"                     \
>>+		 "\t.word\t2b\n"                            \
>>+		 "\t.word\t(3b-2b)+1\n"                     \
> 
> 
> ditto, this probably should be +3 to indicate a userspace address.

Ok (I do not have the oppotunity to test this patch in wrong conditions 
ie segv :(, I would so much), I have to analyse in more details 
exception table handler to try to better understand this.

> 
> your code also creates an artifact that may or may not be ok -- if you
> do a 64-bit put_user or get_user on a 32-bit aligned address, this will
> work with a 32-bit kernel but will trap on a 64-bit kernel. i guess
> that's ok, but just something to keep in mind.

IMHO the absolute solution would be, to have in 32bits a pseudo ldd asm 
extension which do the actual 64bits processor ldd job. Don't you think so?

[as %D1, I also test ldd with a gcc 32bits but it also ask me to send a 
bug report. What do you thing? would I have to report this one (I doubt 
: it is not an actual pa1.1 code but more a dream of mine)?]

Thanks a lot for your kind attention and relevant remarks,

	Joel
