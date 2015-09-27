From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and PA8900 CPUs
Date: Sun, 27 Sep 2015 12:27:18 -0400
Message-ID: <65929045-FF25-4BFB-BA89-F07A47328F1F@bell.net>
References: <20150902162000.GC2444@ls3530.box> <1441287043.2235.6.camel@HansenPartnership.com> <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de> <56017FB3.5050709@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-33--939912884
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56017FB3.5050709@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-33--939912884
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2015-09-22, at 12:20 PM, Helge Deller wrote:

> On 05.09.2015 23:30, Helge Deller wrote:
>> Hi James,
>> ...
>> I haven't done any performance measurements yet, but your patch looks
>> absolutely correct.
>> ...
>=20
> Hello everyone,
>=20
> I did some timing tests with the various patches for
> a) atomic_hash patches:
>        https://patchwork.kernel.org/patch/7116811/
> b) alignment of LWS locks:
>        https://patchwork.kernel.org/patch/7137931/
>=20
> The testcase I used is basically the following:
> - It starts 32 threads.
> - We have 16 atomic ints organized in an array.
> - The first thread increments NITERS times the first atomic int.
> - The second thread decrements NITERS times the first atomic int.
> - The third/fourth thread increments/decrements the second atomic int, =
and so on...
> - So, we have 32 threads, of which 16 increments and 16 decrements 16 =
different atomic ints.
> - All threads run in parallel on a 4-way SMP PA8700 rp5470 machine.
> - I used the "time" command to measure the timings.
> - I did not stopped other services on the machine, but ran each test a =
few times and the timing results did not show significant variation =
between each run.
> - All timings were done on a vanilla kernel 4.2 with only the =
mentioned patch applied.
>=20
> The code is a modified testcase from the libatomic-ops debian package:
>=20
> AO_t counter_array[16] =3D { 0, };
> #define NITERS 1000000
>=20
> void * add1sub1_thr(void * id)
> {
>  int me =3D (int)(AO_PTRDIFF_T)id;
>  AO_t *counter;
>  int i;
>=20
>  counter =3D &counter_array[me >> 1];
>  for (i =3D 0; i < NITERS; ++i)
>    if ((me & 1) !=3D 0) {
>      (void)AO_fetch_and_sub1(counter);
>    } else {
>      (void)AO_fetch_and_add1(counter);
>    }
>  return 0;
> ...
> run_parallel(32, add1sub1_thr)
> ...
>=20
>=20
>=20
> The baseline for all results is the timing with a vanilla kernel 4.2:
> real    0m13.596s
> user    0m18.152s
> sys     0m35.752s
>=20
>=20
> The next results are with the atomic_hash (a) patch applied:
> For ATOMIC_HASH_SIZE =3D 4.=20
> real    0m21.892s=20
> user    0m27.492s
> sys     0m59.704s
>=20
> For ATOMIC_HASH_SIZE =3D 64.
> real    0m20.604s
> user    0m24.832s
> sys     0m56.552s
>=20
>=20
> Next I applied the LWS locks patch (b):
> XXXXXXXXXXXXXXXXXXXX    LWS_LOCK_ALIGN_BITS =3D 4
> real    0m13.660s
> user    0m18.592s
> sys     0m35.236s
>=20
> XXXXXXXXXXXXXXXXXXXX    LWS_LOCK_ALIGN_BITS  =3D L1_CACHE_SHIFT
> real    0m11.992s=20
> user    0m19.064s
> sys     0m28.476s
>=20
>=20
>=20
> Then I applied both patches (a and b):
> ATOMIC_HASH_SIZE =3D 64,  LWS_LOCK_ALIGN_BITS =3D 4
> ATOMIC_HASH_SIZE =3D 64,  LWS_LOCK_ALIGN_BITS =3D 4
> real    0m13.232s
> user    0m17.704s
> sys     0m33.884s
>=20
> ATOMIC_HASH_SIZE =3D 64,  LWS_LOCK_ALIGN_BITS =3D L1_CACHE_SHIFT
> real    0m12.300s
> user    0m20.268s
> sys     0m28.424s
>=20
> ATOMIC_HASH_SIZE =3D 4,   LWS_LOCK_ALIGN_BITS =3D 4
> real    0m13.181s
> user    0m17.584s
> sys     0m34.800s
>=20
> ATOMIC_HASH_SIZE =3D 4,   LWS_LOCK_ALIGN_BITS =3D L1_CACHE_SHIFT
> real    0m11.692s
> user    0m18.232s
> sys     0m27.072s
>=20
>=20
> In summary I'm astonished about those results.
> Especially from patch (a) I would have expected (when applied =
stand-alone) the same or better performance, because it makes the =
spinlocks more fine-grained.
> But a performance drop of 50% is strange.
>=20
> Patch (b) stand-alone does significantly increases performance (~20%), =
and together with patch (a) it even adds a few more percent performance =
increase on top.
>=20
> Given the numbers above I currently would suggest to apply both =
patches (with ATOMIC_HASH_SIZE =3D 4 and LWS_LOCK_ALIGN_BITS =3D =
L1_CACHE_SHIFT).
>=20
> Thoughts?


Hi Helge,

Attached is a revised patch "a" to try to improve performance of =
atomic_t variables.  If you get a chance, could
you see how it performs.

As noted in previous mail, I believe the L1 cache size is 16 bytes for =
all PA-RISC systems.  This change pads
the arch_spinlock_t type on PA2.0 to 16 bytes, so it is the same as =
PA1.x.  As a result, the spinlocks in
__atomic_hash are now on separate L1 cache lines.

I also bumped up ATOMIC_HASH_SIZE to give us 64 locks and changed =
ATOMIC_HASH_SIZE to divide
by SMP_CACHE_BYTES.  SMP_CACHE_BYTES should be maximum alignment used by =
kernel.  This is an
attempt to ensure the hash indexes are evenly distributed.

Testing v4.2.1+ on rp3440 with gcc build.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-33--939912884
Content-Disposition: attachment;
	filename=atomic-spin.d.txt
Content-Type: text/plain;
	name="atomic-spin.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/atomic.h =
b/arch/parisc/include/asm/atomic.h
index 226f8ca9..a5c6de5 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -25,8 +25,8 @@
  * Hash function to index into a different SPINLOCK.
  * Since "a" is usually an address, use one spinlock per cacheline.
  */
-#  define ATOMIC_HASH_SIZE 4
-#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) =
(a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_HASH_SIZE 64
+#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) =
(a))/SMP_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
=20
 extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
=20
diff --git a/arch/parisc/include/asm/spinlock_types.h =
b/arch/parisc/include/asm/spinlock_types.h
index 8c373aa..8c54f5e 100644
--- a/arch/parisc/include/asm/spinlock_types.h
+++ b/arch/parisc/include/asm/spinlock_types.h
@@ -4,7 +4,8 @@
 typedef struct {
 #ifdef CONFIG_PA20
 	volatile unsigned int slock;
-# define __ARCH_SPIN_LOCK_UNLOCKED { 1 }
+	volatile unsigned int pad[3];
+# define __ARCH_SPIN_LOCK_UNLOCKED { 1, { 1, 1, 1 } }
 #else
 	volatile unsigned int lock[4];
 # define __ARCH_SPIN_LOCK_UNLOCKED	{ { 1, 1, 1, 1 } }

--Apple-Mail-33--939912884
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-33--939912884--
