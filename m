Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A374483E
	for <parisc-linux@parisc-linux.org>; Tue, 25 Feb 2003 11:32:33 -0700 (MST)
Date: Tue, 25 Feb 2003 19:32:24 +0100
Message-ID: <3E5A232800000729@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>To: "Matthew Wilcox" <willy@debian.org>
>Cc: parisc-linux@parisc-linux.org
>Date: Tue, 25 Feb 2003 18:00:42 +0100
>
>
>>
>>>-- Original Message --
>>>From: Matthew Wilcox <willy@debian.org>
>>>To: Joel Soete <jsoe0708@tiscali.be>
>>>Cc: parisc-linux@parisc-linux.org
>>>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>>>Date: Mon, 24 Feb 2003 17:50:13 +0000
>>>
>>>
>>>On Mon, Feb 24, 2003 at 06:42:39PM +0100, Joel Soete wrote:
>>>> sched.c:93: initializer element is not constant
>>>> sched.c:93: (near initialization for `tasklist_lock')
>>>> sched.c:93: initializer element is not constant
>>>[...]
>>>> which is precompile as:
>>>> rwlock_t tasklist_lock __attribute__((__aligned__(64))) = (rwlock_t)
>{
>>>(spinlock_t)
>>>> {1}, 0 };
>>>>
>>>> What's wrong?
>>>
>>>looks like gcc broke this again.  for the moment, you can try taking
>>>out the casts.
>As struct spinlock_t is defined like:
>
>typedef struct {
>#ifdef CONFIG_PA20
>        volatile unsigned int lock;
>#else
>        volatile unsigned int __attribute__((aligned(16))) lock;
>#endif
>#ifdef CONFIG_DEBUG_SPINLOCK
>        volatile unsigned long owner_pc;
>        volatile unsigned long owner_cpu;
>#endif
>} spinlock_t;
>
>I take care to unset CONFIG_DEBUG_SPINLOCK (make menu) and so change in
sched.c
>
>#define RW_LOCK_UNLOCKED (rwlock_t) { { 1 } , 0 }
>
>The good news was that I reach to compile the kernel :)
>The bad one was that this kernel failled to boot :(
>
>(As this N stand in a computer room, it is not easy to access the console
>to grab more info :( , sorry)
>
>Well, doesn't matter, I am already enough happy to be able to boot and
work
>with a N (even in up).
>
>Thanks again for advises,
>    Joel
>
>>>
>>Yes :((
>>
>>This errors also occurs with 32bits gcc-3.2 as well as for gcc-3.3 (gcc-snapshot)
>>(but was not with gcc-3.0)
>>
>>Thanks,
>>    Joel
>>
>>PS: daya think a bg is required?
>>

Very strange ???

folowing test case:
#include <stdio.h>

typedef struct {
        volatile unsigned int lock;
        volatile unsigned long owner_pc;
        volatile unsigned long owner_cpu;
} spinlock_t;

#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }

typedef struct {
        spinlock_t lock;
        volatile int counter;
} rwlock_t;

#define RW_LOCK_UNLOCKED (rwlock_t) { SPIN_LOCK_UNLOCKED, 0 }

int main(int argc, char * * argv, char * * env) {

    spinlock_t MySpinLock __attribute__((__aligned__(64))) =SPIN_LOCK_UNLOCKED;
    rwlock_t MyRWLock __attribute__((__aligned__(64))) = RW_LOCK_UNLOCKED;

    printf("MySpinLock->lock: %d\n", MySpinLock.lock);

    printf("MySpinLock->owner_pc: %d\n", MySpinLock.owner_pc);

    printf("MySpinLock->owner_cpu: %d\n", MySpinLock.owner_cpu);

    printf("MyRWLock->lock->lock: %d\n", MyRWLock.lock.lock);

    printf("MyRWLock->lock->owner_pc: %d\n", MyRWLock.lock.owner_pc);

    printf("MyRWLock->lock->owner_cpu: %d\n", MyRWLock.lock.owner_cpu);

    printf("MyRWLock->counter: %d\n", MyRWLock.counter);

    return 0;
}

with same options as for the kernel:
hppa64-linux-gcc -E -D__KERNEL__ -I/usr/include -I/usr/src/linux-2.4.20-pa27-64/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000
  -nostdinc -I /usr/lib/gcc-lib/hppa64-linux/3.2.3/include -DKBUILD_BASENAME=sched
 -fno-omit-frame-pointer -c -o TCast.o TCast.c

precompiles:
    spinlock_t MySpinLock __attribute__((__aligned__(64))) =(spinlock_t)
{ 1 };
    rwlock_t MyRWLock __attribute__((__aligned__(64))) = (rwlock_t) { (spinlock_t)
{ 1 }, 0 };

Excepted variable names, it seems to be very similar to the kernel src sched
which was:
# 92 "sched.c"
spinlock_t runqueue_lock __attribute__((__aligned__(64))) = (spinlock_t)
{ 1 };
rwlock_t tasklist_lock __attribute__((__aligned__(64))) = (rwlock_t) { (spinlock_t)
{ 1 }, 0 };


Never the less this testcase doesn't reproduce the mentionned pb?
Could it be that true is elsewhere?

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
