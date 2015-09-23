From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and PA8900 CPUs
Date: Tue, 22 Sep 2015 20:12:23 -0400
Message-ID: <17069A9B-BA68-4BDA-9342-83E33A22D547@bell.net>
References: <20150902162000.GC2444@ls3530.box> <1441287043.2235.6.camel@HansenPartnership.com> <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de> <56017FB3.5050709@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56017FB3.5050709@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-22, at 12:20 PM, Helge Deller wrote:

> On 05.09.2015 23:30, Helge Deller wrote:
>> Hi James,
>> ...
>> I haven't done any performance measurements yet, but your patch looks
>> absolutely correct.
>> ...
> 
> Hello everyone,
> 
> I did some timing tests with the various patches for
> a) atomic_hash patches:
>        https://patchwork.kernel.org/patch/7116811/
> b) alignment of LWS locks:
>        https://patchwork.kernel.org/patch/7137931/
> 
> The testcase I used is basically the following:
> - It starts 32 threads.
> - We have 16 atomic ints organized in an array.
> - The first thread increments NITERS times the first atomic int.
> - The second thread decrements NITERS times the first atomic int.
> - The third/fourth thread increments/decrements the second atomic int, and so on...
> - So, we have 32 threads, of which 16 increments and 16 decrements 16 different atomic ints.
> - All threads run in parallel on a 4-way SMP PA8700 rp5470 machine.
> - I used the "time" command to measure the timings.
> - I did not stopped other services on the machine, but ran each test a few times and the timing results did not show significant variation between each run.
> - All timings were done on a vanilla kernel 4.2 with only the mentioned patch applied.
> 
> The code is a modified testcase from the libatomic-ops debian package:
> 
> AO_t counter_array[16] = { 0, };
> #define NITERS 1000000
> 
> void * add1sub1_thr(void * id)
> {
>  int me = (int)(AO_PTRDIFF_T)id;
>  AO_t *counter;
>  int i;
> 
>  counter = &counter_array[me >> 1];
>  for (i = 0; i < NITERS; ++i)
>    if ((me & 1) != 0) {
>      (void)AO_fetch_and_sub1(counter);
>    } else {
>      (void)AO_fetch_and_add1(counter);
>    }
>  return 0;
> ...
> run_parallel(32, add1sub1_thr)
> ...
> 
> 

Does libatomic-ops now use the GCC sync builtins and the LWS calls?

> 
> The baseline for all results is the timing with a vanilla kernel 4.2:
> real    0m13.596s
> user    0m18.152s
> sys     0m35.752s
> 
> 
> The next results are with the atomic_hash (a) patch applied:
> For ATOMIC_HASH_SIZE = 4. 
> real    0m21.892s 
> user    0m27.492s
> sys     0m59.704s
> 
> For ATOMIC_HASH_SIZE = 64.
> real    0m20.604s
> user    0m24.832s
> sys     0m56.552s
> 

I'm not sure why the atomic_hash patch would directly affect performance of this test as I
don't think the patch affects the LWS locks.

I question the the atomic hash changes as the original defines are taken directly from generic code.
Optimally, we want one spinlock per cacheline.  Why do we care about the size of atomic_t?

The above indicate the change is detrimental.

Dave
--
John David Anglin	dave.anglin@bell.net



