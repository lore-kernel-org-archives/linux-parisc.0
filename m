From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function on hppa
Date: Tue, 22 May 2007 12:20:31 +0200
Message-ID: <4652C3EF.3020905__42952.8366345496$1416624360$gmane$org@aurel32.net>
References: <20070520015215.GA26949@amd64.aurel32.net>	<20070520015653.GA22224@amd64.aurel32.net>
	<119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: libc-ports@sourceware.org,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos O'Donell a écrit :
> On 5/19/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
>> 2007-05-20  Aurelien Jarno  <aurelien@aurel32.net>
>>
>>         * sysdeps/unix/sysv/linux/hppa/bits/atomic.h: check for
>>         -EAGAIN instead of EAGAIN.
>>
>> --- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig       2007-05-20 03:28:39.000000000 +0200
>> +++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h    2007-05-20 03:24:41.000000000 +0200
>> @@ -56,7 +56,7 @@
>>  #define LWS_CAS "0"
>>  /* Note r31 is the link register */
>>  #define LWS_CLOBBER "r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31", "memory"
>> -#define ASM_EAGAIN "11"
>> +#define ASM_EAGAIN "-11"
>>
>>  #if __ASSUME_LWS_CAS
>>  /* The only basic operation needed is compare and exchange.  */
> 
> Aurelian,
> 
> Good catch! I applaud your effort! I'll test the patch this week and
> get it into cvs.
> 
> If the kernel is returning EAGAIN it means there are multiple threads
> calling LWS CAS on addresses whose hash selects the same kernel
> spinlock (there is an array of 16 for minimal scalability). The kernel
> never spins and expects the caller to spin in userpace.
> 
> The verified the original test code I wrote does check for "-11", and
> I did run the kernel tests on an SMP machine with multiple threads, so
> I know that LWS CAS works on SMP.

Well we still have a problem, the failure occurs less often, but still
sometimes. Apparently it is cause by the kernel returning -EDEADLOCK.
How should that be handled? The same way as -EAGAIN?

Cheers,
Aurelien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
