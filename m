From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: 04 Sep 2004 22:56:30 -0400
Message-ID: <1094352991.1924.12.camel@mulgrave>
References: <20040905013844.GC23842@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040905013844.GC23842@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2004-09-04 at 21:38, Grant Grundler wrote:
> I haven't tested the following patch and just wanted to get
> feedback if it is "the right thing" or not.

It should work, but I don't think it's the right thing to do.

__ldcw already insists on operating on volatile data, which is the
correct thing to do.  Adding a memory barrier is probably harmless, but
it crimps any optimisations gcc might like to try with that function
(not that there really are any with such a simple loop).  Indeed, we
could even remove the __volatile__ from the asm.

I think the best implementation is probably

barrier();
a = __ldcw_align(x);
while (__ldcw(a) == 0)
	while(*a == 0)
		;
mb();

Which makes it totally clear what barriers we need where in the spinlock
(the first being simply a compiler ordering barrier and the second
actually a processor memory barrier).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
