Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 1 Jul 2003 12:13:27 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030701181327.GC14683@dsl2.external.hp.com>
References: <20030630163601.GC14971@dsl2.external.hp.com> <3ED71F6D0000C19D@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED71F6D0000C19D@ocpmta7.freegates.net>
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

On Tue, Jul 01, 2003 at 06:33:07PM +0200, Joel Soete wrote:
> I hope I am not going to anoying you.

:^)

> I just found related interesting stuff: <http://lwn.net/Articles/38384/>
> And may be also the source of pb.

Maybe our userspace will encounter this problem as well since I've
ripped out the __STRICT_ANSI__ test...can you work this out?


> I also write this small testcase to try to point out the pb in 32bits mode:
...
> And here is the results:
> Val of TU64: fedcba9876543210
> Val of ___arch__swab64(TU64): 76543210fedcba98
> Val of __fswab64(TU64): 1032547698badcfe
> 
> What is right (I could not rebuild with hppa64-linux-gcc :( )?

__fswab64() is correct.
___arch__swab64() didn't actually swap within the  32-bit words.


asm-parisc/byteorder.h has:
static __inline__ __const__ __u64 ___arch__swab64(__u64 x)
{
	__u32 t1 = (__u32) x;
	__u32 t2 = (__u32) ((x) >> 32);
	___arch__swab32(t1);
	___arch__swab32(t2);
	return (((__u64) t2 << 32) + ((__u64) t1));
}


DOH! *smack*
Probably my bad.
That should read:

static __inline__ __const__ __u64 ___arch__swab64(__u64 x)
{
	__u32 t1 = (__u32) x;
	__u32 t2 = (__u32) ((x) >> 32);
	return ((__u64) ___arch__swab32(t1) << 32) + ((__u64) ___arch__swab32(t2));     
}


Could you please test this?

thanks,
grant
