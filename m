Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70B3B483E
	for <parisc-linux@parisc-linux.org>; Wed, 26 Feb 2003 11:31:15 -0700 (MST)
Date: Wed, 26 Feb 2003 19:31:05 +0100
Message-ID: <3E5BA2910000087F@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
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

Hi Dave,

>-- Original Message --
>Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
>To: jsoe0708@tiscali.be (Joel Soete)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: willy@debian.org, parisc-linux@parisc-linux.org
>Date: Tue, 25 Feb 2003 13:50:04 -0500 (EST)
>
>
>> int main(int argc, char * * argv, char * * env) {
>>
>>     spinlock_t MySpinLock __attribute__((__aligned__(64))) =SPIN_LOCK_UNLOCKED;
>>     rwlock_t MyRWLock __attribute__((__aligned__(64))) = RW_LOCK_UNLOCKED;
>
>This does not work.  The aligned attribute doesn't work for automatic
>variables and never has.  Structures allocated on the stack are allocated
>with alignment BIGGEST_ALIGNMENT.  This should be a FAQ.
>
>BIGGEST_ALIGNMENT is 128 bits on the 64-bit ports.  It is 64 on the 32-bit
>port.  It is 128 in debian gcc 3.0.4 but this broke the hpux ABI regarding
>the placement of long doubles in structures.  Thus, this change was
>reverted the GCC CVS source.
>
>Spinlocks on PA 2.0 machines don't need special alignment, although you
>may want to keep them in separate cache lines.
>

Sorry in advance if I missunderstood.

Ok, ow the test case which actually reproduce the problem is:
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

spinlock_t MySpinLock __attribute__((__aligned__(64))) =SPIN_LOCK_UNLOCKED;
rwlock_t MyRWLock __attribute__((__aligned__(64))) = RW_LOCK_UNLOCKED;

int main(int argc, char * * argv, char * * env) {

    printf("MySpinLock->lock: %d\n", MySpinLock.lock);

    printf("MySpinLock->owner_pc: %d\n", MySpinLock.owner_pc);

    printf("MySpinLock->owner_cpu: %d\n", MySpinLock.owner_cpu);

    printf("MyRWLock->lock->lock: %d\n", MyRWLock.lock.lock);

    printf("MyRWLock->lock->owner_pc: %d\n", MyRWLock.lock.owner_pc);

    printf("MyRWLock->lock->owner_cpu: %d\n", MyRWLock.lock.owner_cpu);

    printf("MyRWLock->counter: %d\n", MyRWLock.counter);

    return 0;
}

Would I have to open a bug report near gcc with this one?


>Dave
>--
>J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
>National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
>_______________________________________________

Thanks again,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
