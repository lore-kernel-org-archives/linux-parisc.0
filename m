Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D5734879
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 04:21:23 -0700 (MST)
Message-ID: <3FB0C646.102@tiscali.be>
Date: Tue, 11 Nov 2003 11:21:42 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Randolph Chung <tausq@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be> <3FAE4639.6030200@tiscali.be> <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk> <3FAE8EA4.3050208@tiscali.be> <20031110044556.GB16478@colo.lackof.org> <20031110050732.GZ28967@tausq.org> <3FAFDA75.7000906@tiscali.be>
In-Reply-To: <3FAFDA75.7000906@tiscali.be>
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


Joel Soete wrote:
> 
> 
>>
>> %R2 is not *wrong* -- it points to the right side of argument register 
>> 2 (jda explained this in an earlier thread), but I am not 100% sure 
>> %R2 will do the right thing for a 32-bit build though -- if you are 
>> running on a pa1.1 machine and the register is only 32-bit, does %R2 
>> automatically do the right thing with 64-bit arguments?  I guess it's 
>> easy enough to tell by looking at the code gcc generates...
>>
> 
> Good idea and just for curiosity (i don't want to insist to maintain 
> some line of code which soon or later would have to be change ), I can 
> try to find back a test case I used to prepare. (Just be patient)
> 
So here is my test-case:
---------><---------
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define KERNEL_DS       ((mm_segment_t){0})
#define USER_DS         ((mm_segment_t){1})

#define segment_eq(a,b) ((a).seg == (b).seg)

#define get_ds()        (KERNEL_DS)
#define get_fs()        (current->addr_limit)
#define set_fs(x)       (current->addr_limit = (x))

#define put_user __put_user

#define STD_USER(x, ptr)  __put_user_asm_64(x, ptr)

#define __put_user(x,ptr)                                       \
({                                                              \
         register long __pu_err __asm__ ("r8") = 0;              \
                                                                 \
             switch (sizeof(*(ptr))) {                           \
             case 1: __put_user_asm("stb",x,ptr); break;         \
             case 2: __put_user_asm("sth",x,ptr); break;         \
             case 4: __put_user_asm("stw",x,ptr); break;         \
             case 8: STD_USER(x,ptr); break;         \
             default: printf("Bug"); break;                              \
             }                                                   \
                                                                 \
         __pu_err;                                               \
})

/*
  * The "__put_user/kernel_asm()" macros tell gcc they read from memory
  * instead of writing. This is because they do not write to any memory
  * gcc knows about, so there are no aliasing issues.
  */

#define __put_user_asm(stx,x,ptr)                           \
         __asm__ __volatile__ (                              \
                 "\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
                 "2:\n"                                      \
                 "\t.section __ex_table,\"a\"\n"             \
                  "\t.word\t1b\n"                            \
                  "\t.word\t(2b-1b)+1\n"                     \
                  "\t.previous"                              \
                 : "=r"(__pu_err)                            \
                 : "r"(ptr), "r"(x), "0"(__pu_err))

#define __put_user_asm_64(x, ptr)                      \
         __asm__ __volatile__ (                              \
                 "\n1:\tstw\t%2,0(%%sr3,%1)\n"           \
                 "2:\tstw\t%R2,4(%%sr3,%1)\n"           \
                 "3:\n"                                      \
                 "\t.section __ex_table,\"a\"\n"             \
                  "\t.word\t1b\n"                            \
                  "\t.word\t(3b-1b)+1\n"                     \
                  "\t.word\t2b\n"                            \
                  "\t.word\t(3b-2b)+1\n"                     \
                  "\t.previous"                              \
                 : "=r"(__pu_err)                            \
                 : "r"(ptr), "r"(x), "0"(__pu_err))

typedef unsigned long long u64;
typedef u_int8_t  BOOLEAN;

typedef struct
{
     unsigned char b7, b6, b5, b4, b3, b2, b1, b0;
}
EightBytes;

int main(int argc, char * * argv, char * * env) {

     unsigned long long TU64;
     unsigned long long * PTU64=(unsigned long long *) 
malloc(sizeof(unsigned long long));
     int err;

     union
     {
         unsigned long long U64;
         EightBytes B8;
     }
     Uu64;

     Uu64.U64 = 0xf7f6f5f4f3f2f1f0LL;
     TU64 = Uu64.U64;

     err = put_user(TU64, PTU64);

     printf("TestU64 is of len: %u\n", sizeof(Uu64.U64));
     printf("Address of TestU64: %p\n", &TU64);

     printf("Value of Uu64.U64: %0Lx\n", Uu64.U64);

     printf("Value of Uu64.U64l: %0x\n", (unsigned int) Uu64.U64 );

     printf("Value of Uu64.U64h: %0x\n", (unsigned int) (Uu64.U64 >> 32) );

     printf("Value of Uu64.U64b0: %0x\n", (unsigned char) Uu64.B8.b0 );

     printf("Address of Uu64.U64: %p\n", &(Uu64.U64));
     printf("Address of Uu64.U64b7: %p\n", &(Uu64.B8.b7));
     printf("Address of Uu64.U64b0: %p\n", &(Uu64.B8.b0));

     printf("PTU64 is of len: %u\n", sizeof(*PTU64));
     printf("Address of PTU64: %p\n", PTU64);
     printf("Value of PTU64: %0Lx\n", *PTU64);

     return err;
}
---------><---------

And the generated code by gcc 3.3.2:
[...]
main:
         .PROC
         .CALLINFO FRAME=128,CALLS,SAVE_RP,SAVE_SP,ENTRY_GR=4
         .ENTRY
         stw %r2,-20(%r30)
         copy %r3,%r1
         copy %r30,%r3
         stwm %r1,128(%r30)
         stw %r8,32(%r3)
         stw %r26,-36(%r3)
         stw %r25,-40(%r3)
         stw %r24,-44(%r3)
         ldi 8,%r26
         bl malloc,%r2
         nop
         copy %r28,%r19
         stw %r19,16(%r3)
         ldil L'-202182160,%r20
         ldil L'-134810124,%r19
         ldo R'-134810124(%r19),%r19
         ldo R'-202182160(%r20),%r20
         stw %r19,24(%r3)
         stw %r20,28(%r3)
         ldw 24(%r3),%r19
         ldw 28(%r3),%r20
         stw %r19,8(%r3)
         stw %r20,12(%r3)
         ldi 0,%r8
         ldw 16(%r3),%r21
         ldw 8(%r3),%r19
         ldw 12(%r3),%r20
#APP

1:      stw     %r19,0(%sr3,%r21)
2:      stw     %r20,4(%sr3,%r21)
3:
         .section __ex_table,"a"
         .word   1b
         .word   (3b-1b)+1
         .word   2b
         .word   (3b-2b)+1
         .previous
#NO_APP
         stw %r8,20(%r3)
         ldil LR'.LC1,%r19
         ldo RR'.LC1(%r19),%r26
         ldi 8,%r25
         bl printf,%r2
         nop
         ldil LR'.LC2,%r19
[...]

Please let me know if I miss something ;)

Cheers,
	Joel
