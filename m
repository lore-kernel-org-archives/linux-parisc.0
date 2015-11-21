From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 3/9] parisc: Fix asm/mman.h regarding MAP_HUGETLB and
 MADV_XX flags
Date: Sat, 21 Nov 2015 23:22:53 +0100
Message-ID: <5650EEBD.6000400@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
 <1448055522-11594-4-git-send-email-deller@gmx.de>
 <1448139427.17638.16.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	stable@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448139427.17638.16.camel@decadent.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Ben,

On 21.11.2015 21:57, Ben Hutchings wrote:
> On Fri, 2015-11-20 at 22:38 +0100, Helge Deller wrote:
>> On parisc we have up to now never supported Huge Pages, even glibc did
>> not defined MAP_HUGETLB for parisc. Since the Huge Page support is being
>> added now, clean up existing definitions for MAP_HUGETLB and friends.
>>
>> Drop lots of MADV_xxK_PAGES flags, which were never used and were
>> designed for a patch which was never integrated into the Linux
>> kernel. Instead move other MADV_ flags to make them more compatible to
>> other linux architectures.
> 
> Changing the unimplemented values seems fine, but how can it be OK to
> renumber MAP_GROWSUP, MADV_DONTDUMP and MADV_DODUMP?

MAP_GROWSUP is new.
MAP_STACK changed, but doesn't seeem to be used inside the kernel anyway.
MAP_HUGETLB is new.

MADV_DONTDUMP and MADV_DODUMP changed, but I tend to think that they are
not widely used (if at all on parisc), and even in glibc they are only
accessible if applications included <linux/mman.h>.
So, having the same value for both as all other architectures gives long-term
probably more benefits than keeping the current values.
My testings up to now didn't showed problems, but I'm not religious on it.
If everyone thinks it's better to not change MADV_DONTDUMP and MADV_DODUMP
I will do so.

*BUT*:
This patch was not planned by me to be sent to the stable mailing list *yet*.
Please don't apply it to the stable kernels yet, since it's not upstream yet.
I was planning to push it down with the upstream commit...

(git send-mail fooled me, I just sent to the linux-parisc mailing list, James
and Dave, but I wasn't aware that git-send-mail sent it automatically too stable
as well)
 
Helge

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  arch/parisc/include/uapi/asm/mman.h | 29 ++++++++++-------------------
>>  1 file changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
>> index 294d251..9ac77f1 100644
>> --- a/arch/parisc/include/uapi/asm/mman.h
>> +++ b/arch/parisc/include/uapi/asm/mman.h
>> @@ -19,11 +19,12 @@
>>  #define MAP_EXECUTABLE> 	> 0x1000> 	> 	> /* mark it as an executable */
>>  #define MAP_LOCKED> 	> 0x2000> 	> 	> /* pages are locked */
>>  #define MAP_NORESERVE> 	> 0x4000> 	> 	> /* don't check for reservations */
>> -#define MAP_GROWSDOWN> 	> 0x8000> 	> 	> /* stack-like segment */
>> +#define MAP_GROWSDOWN> 	> 0x8000> 	> 	> /* x86 stack-like segment */
>>  #define MAP_POPULATE> 	> 0x10000> 	> 	> /* populate (prefault) pagetables */
>>  #define MAP_NONBLOCK> 	> 0x20000> 	> 	> /* do not block on IO */
>> -#define MAP_STACK> 	> 0x40000> 	> 	> /* give out an address that is best suited for process/thread stacks */
>> -#define MAP_HUGETLB> 	> 0x80000> 	> 	> /* create a huge page mapping */
>> +#define MAP_HUGETLB> 	> 0x40000> 	> 	> /* create a huge page mapping */
>> +#define MAP_GROWSUP> 	> 0x80000> 	> 	> /* parisc stack-like segment */
>> +#define MAP_STACK> 	> MAP_GROWSUP> 	> /* give out an address that is best suited for process/thread stacks */
>>  
>>  #define MS_SYNC> 	> 	> 1> 	> 	> /* synchronous memory sync */
>>  #define MS_ASYNC> 	> 2> 	> 	> /* sync memory asynchronously */
>> @@ -46,25 +47,15 @@
>>  #define MADV_DONTFORK> 	> 10> 	> 	> /* don't inherit across fork */
>>  #define MADV_DOFORK> 	> 11> 	> 	> /* do inherit across fork */
>>  
>> -/* The range 12-64 is reserved for page size specification. */
>> -#define MADV_4K_PAGES   12              /* Use 4K pages  */
>> -#define MADV_16K_PAGES  14              /* Use 16K pages */
>> -#define MADV_64K_PAGES  16              /* Use 64K pages */
>> -#define MADV_256K_PAGES 18              /* Use 256K pages */
>> -#define MADV_1M_PAGES   20              /* Use 1 Megabyte pages */
>> -#define MADV_4M_PAGES   22              /* Use 4 Megabyte pages */
>> -#define MADV_16M_PAGES  24              /* Use 16 Megabyte pages */
>> -#define MADV_64M_PAGES  26              /* Use 64 Megabyte pages */
>> +#define MADV_MERGEABLE   12> 	> 	> /* KSM may merge identical pages */
>> +#define MADV_UNMERGEABLE 13> 	> 	> /* KSM may not merge identical pages */
>>  
>> -#define MADV_MERGEABLE   65> 	> 	> /* KSM may merge identical pages */
>> -#define MADV_UNMERGEABLE 66> 	> 	> /* KSM may not merge identical pages */
>> +#define MADV_HUGEPAGE> 	> 14> 	> 	> /* Worth backing with hugepages */
>> +#define MADV_NOHUGEPAGE> 	> 15> 	> 	> /* Not worth backing with hugepages */
>>  
>> -#define MADV_HUGEPAGE> 	> 67> 	> 	> /* Worth backing with hugepages */
>> -#define MADV_NOHUGEPAGE> 	> 68> 	> 	> /* Not worth backing with hugepages */
>> -
>> -#define MADV_DONTDUMP   69> 	> 	> /* Explicity exclude from the core dump,
>> +#define MADV_DONTDUMP   16> 	> 	> /* Explicity exclude from the core dump,
>>  > 	> 	> 	> 	> 	>    overrides the coredump filter bits */
>> -#define MADV_DODUMP> 	> 70> 	> 	> /* Clear the MADV_NODUMP flag */
>> +#define MADV_DODUMP> 	> 17> 	> 	> /* Clear the MADV_NODUMP flag */
>>  
>>  /* compatibility flags */
>>  #define MAP_FILE> 	> 0

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWUO69AAoJEKGDlV8wpRJBs5YP/3UzD7XA3kfkxKbvUCddjBt8
4UI4xzo7HyVKc2C6IRCihIWqb6KbSw+6dgqVNIPqZIOfeiueHYAz92X36mJB4c/B
xXmoUK2W6aKNDIXI4pmzZ//7MRvblSLQTjtSKb2z9sKe2SffJjra8khQGQCKcZcm
/xRYgzwMFw37YaGQnYABlciCHOEdAoN7vN5NhUXbxUHFdDIYxM+wXm0BzBudKvPT
/dMnGIvRnS4XCminK+wCXPQMR4E6MMBr3+UsRZm8G7/r7VmqKXg2BRbTQfeMV5a7
s3+1tw5p0a6DzrTngSDZK/udHnzvd16Beugha1lIKVBinYfG9nyu6ZI0y0kMank5
571swgUzRjxWLWRsSPbowO4gZJCWSS4mFC4RnziW5nzFzzXMC9tD2Osp9EL8yev3
NLPoxr1YcajS4CcOMpyS00rq1VBjKdwqAxDCXsLDEj7YFv7wSHkW8+BK4TfkuHYk
v7tV3NxLZdbr0IPEliiegf/+XnBVSmyTVk7kSV+NOub8X1RfL6MO8jcDV44yd5OZ
rgE8lkmEMh00cSU35YP1+MhuRDujRVQhIj2Xk36eO1R3a6pDb3y8B3w35KxxCobz
Onxa2KNSn6u7DEBOSDIGc9yxxjYR5M+Fnqs6wPCpGndbwaumOFB3VAR3Pfi/J/z5
dgwjngMT7PlZzry3K6jE
=s6EG
-----END PGP SIGNATURE-----
