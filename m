From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C11 atomics on parisc are broken on gcc-7 and gcc-8
Date: Tue, 18 Sep 2018 19:13:14 -0400
Message-ID: <1a7f70f6-1a33-6cce-1c21-e83f3b65982a@bell.net>
References: <alpine.LRH.2.02.1809181805210.29259@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org
To: Mikulas Patocka <mpatocka@redhat.com>, linux-parisc@vger.kernel.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <alpine.LRH.2.02.1809181805210.29259@file01.intranet.prod.int.rdu2.redhat.com>
Resent-Message-ID: <KO-6HboQAnN.A.FrF.caYobB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/1a7f70f6-1a33-6cce-1c21-e83f3b65982a@bell.net

Hi Mikulas,

You are correct.  The problem is my fault.  I changed gcc when it was 
realized that PA 2.0
executes loads and stores out of order.  I need to add back some code 
that was there before.

Debian has picked up the recent gcc update.

We need to use compare and swap for atomic writes since they can be used 
with the synthesized
compare and swap operation.

Thanks,
Dave

On 2018-09-18 6:43 PM, Mikulas Patocka wrote:
> Hi
>
> I have noticed that C11 atomics are broken on gcc-7 and gcc-8 on parisc.
>
> When writing an atomic variable, gcc-6 and before calls the library
> function __sync_val_compare_and_swap_4. That calls the kernel and takes
> the lock. There's no problem.
>
> gcc-7 and gcc-8 don't call it, they just directly write the atomic
> variable, optionally with the "sync" instructions before or after
> (depending on the memory model).
>
> Now the problem is - suppose that an atomic write races with atomic
> exchange on the same variable. Either the write wins the race (in that
> case the exchange operation should return the value that was written by
> the write) or the exchange wins the race (in that case the value that was
> written by the write should permanently stay in the variable). On parisc,
> the written value is lost, because the write doesn't take the lock.
>
>
> Initially, val == 1
>
> Thread 1 (excuting atomic_exchange_explicit(&val, 3, memory_order_relaxed))
> read the variable from userspace (reads 1)
> call __sync_val_compare_and_swap_4
> call the kernel
> take the lock
> read the variable inside the kernel (reads 1), so it is going to proceed with the write
>
> Thread 2 (executing atomic_store_explicit(&val, 2, memory_order_relaxed))
> write the variable with 2
>
> Thread 1 (continuing)
> write the variable with 3
> drop the lock
> exit the kernel
> exit __sync_val_compare_and_swap_4
>
> --- the value "2" that was written by thread 2 is lost.
>
>
> The bug can be tested with this program. When compiled with gcc-7 or
> gcc-8, it fails with "(after 4726 loops): atomics are broken, val = 3,
> xchg returned 1". With gcc-6 or gcc-5 it works.
>
> What's strange is that this bug only happens with the gcc-7 and gcc-8 from
> debian ports, when I compiled gcc 7.3.0 on my own, it properly generates
> the call to __sync_val_compare_and_swap_4. Did someone patch the gcc in
> Debian? Or is it caused by some configure parameter?
>
> Mikulas
>
>
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <pthread.h>
> #include <stdatomic.h>
>
> static pthread_barrier_t barrier;
>
> static atomic_int val;
>
> static void *thread(void *p)
> {
> 	int r;
> 	struct random_data rnd;
> 	char rnd_buf[256];
> 	volatile int32_t w;
>
> 	rnd.state = NULL;
> 	if (initstate_r(2, rnd_buf, sizeof rnd_buf, &rnd)) perror("initstate_r"), exit(1);
>
> 	while (1) {
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
>
> 		if (random_r(&rnd, (int32_t *)&w)) perror("random_r");
> 		w &= 0xfff;
> 		while (w--) ;
>
> 		atomic_store_explicit(&val, 2, memory_order_relaxed);
>
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
>
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
> 	}
> }
>
> int main(void)
> {
> 	int r, x;
> 	pthread_t t;
> 	struct random_data rnd;
> 	char rnd_buf[256];
> 	volatile int32_t w;
> 	int loops = 0;
>
> 	rnd.state = NULL;
> 	if (initstate_r(1, rnd_buf, sizeof rnd_buf, &rnd)) perror("initstate_r"), exit(1);
>
> 	r = pthread_barrier_init(&barrier, NULL, 2);
> 	if (r) fprintf(stderr, "pthread_barrier_init: %s\n", strerror(r)), exit(1);
> 	r = pthread_create(&t, NULL, thread, NULL);
> 	if (r) fprintf(stderr, "pthread_create: %s\n", strerror(r)), exit(1);
>
> 	while (1) {
> 		atomic_init(&val, 1);
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
>
> 		if (random_r(&rnd, (int32_t *)&w)) perror("random_r");
> 		w &= 0xfff;
> 		while (w--) ;
>
> 		x = atomic_exchange_explicit(&val, 3, memory_order_relaxed);
>
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
>
> 		if (!(
> 			(x == 2 && atomic_load_explicit(&val, memory_order_relaxed) == 3) ||
> 			(x == 1 && atomic_load_explicit(&val, memory_order_relaxed) == 2)
> 		   )) {
> 			fprintf(stderr, "(after %d loops): atomics are broken, val = %d, xchg returned %d\n", loops, atomic_load_explicit(&val, memory_order_relaxed), x);
> 			exit(1);
> 		}
>
> 		r = pthread_barrier_wait(&barrier);
> 		if (r > 0) fprintf(stderr, "pthread_barrier_wait: %s\n", strerror(r)), exit(1);
>
> 		loops++;
>
> 		if (!(loops % 1000))
> 			fprintf(stderr, "%d\r", loops);
> 	}
> }
>
