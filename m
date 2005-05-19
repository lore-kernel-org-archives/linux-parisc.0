From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Wed, 18 May 2005 23:55:09 -0600
Message-ID: <20050519055509.GB29802@colo.lackof.org>
References: <4282FEEE00001BF0@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE00001BF0@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 17, 2005 at 06:29:18PM +0200, Joel Soete wrote:
> > > ccio-dma.c: failed to claim CCIO bus address space (ffffffff00000000,ffffffffffffffff)
...
> > It would be interesting to know why it's asking for that range.
> > Where are the values of that range coming from?

> 32bit kernel:
...
> ccio_init_resource(res=10712c68, name=GSC Bus [8/], ioaddr=fff88078)
> ccio_init_resource() res->start f1000000
> ccio_init_resource() res->end f17fffff
> ccio_init_resource() res->end + 1  f1800000
> ccio_init_resource() claimed CCIO bus address space (f1000000, f17fffff)
> ccio_init_resource(res=10712c84, name=GSC Bus [8/], ioaddr=fff88060)
> ccio_init_resource() res->start fc000000
> ccio_init_resource() res->end fff7ffff
> ccio_init_resource() res->end + 1  fff80000
> ccio_init_resource() claimed CCIO bus address space (fc000000, fff7ffff)
...

Ah...I forgot that U2/Uturn have two sets of range registers.
One per GSC bus....

BTW, PDC sets all of this address stuff up AFAIK.

...
> ccio_init_resource(res=1071245c, name=GSC Bus [10/], ioaddr=fff8a078)
> ccio_init_resource() res->start f1800000
> ccio_init_resource() res->end f1ffffff
> ccio_init_resource() res->end + 1  f2000000
> ccio_init_resource() claimed CCIO bus address space (f1800000, f1ffffff)
> ccio_init_resource(res=10712478, name=GSC Bus [10/], ioaddr=fff8a060)
> ccio_init_resource() res->start 00000000
> ccio_init_resource() res->end ffffffff
> ccio_init_resource() res->end + 1  00000000
> Lasi version 0 at 0xffd00000 found.
> ...

This last one seems to be disabled.
That's what this code in ccio_init_resource() is testing for:
	if (res->end + 1 == res->start)
                return;
 
/me puts on his fortune teller hat and looks in his crystal ball:
	"Joel will be submitting a patch shortly...You must add a comment
	explaining WTF this test is doing..."


> 64bit kernel:
...
> ccio_init_resource(res=00000000109e3858, name=GSC Bus [8/], ioaddr=fffffffffff88078)
> ccio_init_resource() res->start fffffffff1000000
> ccio_init_resource() res->end fffffffff17fffff
> ccio_init_resource() res->end + 1  fffffffff1800000
> ccio_init_resource() claimed CCIO bus address space (fffffffff1000000, fffffffff17fffff)
> ccio_init_resource(res=00000000109e3890, name=GSC Bus [8/], ioaddr=fffffffffff88060)
> ccio_init_resource() res->start fffffffffc000000
> ccio_init_resource() res->end fffffffffff7ffff
> ccio_init_resource() res->end + 1  fffffffffff80000
> ccio_init_resource() claimed CCIO bus address space (fffffffffc000000, fffffffffff7ffff)

No problem with the first one.

...
> ccio_init_resource(res=00000000109e5858, name=GSC Bus [10/], ioaddr=fffffffffff8a078)
> ccio_init_resource() res->start fffffffff1800000
> ccio_init_resource() res->end fffffffff1ffffff
> ccio_init_resource() res->end + 1  fffffffff2000000
> ccio_init_resource() claimed CCIO bus address space (fffffffff1800000, fffffffff1ffffff)
> ccio_init_resource(res=00000000109e5890, name=GSC Bus [10/], ioaddr=fffffffffff8a060)
> ccio_init_resource() res->start ffffffff00000000
> ccio_init_resource() res->end ffffffffffffffff
> ccio_init_resource() res->end + 1  0000000000000000

This fails because io_io_low/high registers in reality are only 16 bits.
The upper 16 bits are hardcoded to 1's.
The conversion of res->start to 64-bit is wrong for this one case:
	res->start = (unsigned long)(signed) __raw_readl(ioaddr) << 16;

__raw_readl(ioaddr) returns 0xffff0000.
0xffff0000 << 16 should be 0 but it's not since this is 64-bit.
That line should read something like:
	res->start = (unsigned long) ((signed) __raw_readl(ioaddr) << 16);

And please add a comment here too that parenthesis *do* matter.
Then it should fail the same test that I point out above....

> ccio_init_resource() failed to claim CCIO bus address space (ffffffff00000000,
> ffffffffffffffff)

...and we wouldn't even try to acquire this range.

> ccio_init_resource() claimed CCIO bus address space (ffffffff00000000, ffffffffffffffff)
> Lasi version 0 at 0xffffffffffd00000 found.
> 
> even thought I have no doc to now what would means:
>         res->start = (unsigned long)(signed) READ_U32(ioaddr) << 16; (==
> 0x0 in 32bits)
>         res->end = (unsigned long)(signed) (READ_U32(ioaddr + 4) << 16) -
> 1; (== 0xffffffff in 32bits too)
> 
> but seems that test:
>         if (res->end + 1 == res->start)
> is a stuff which not love 64bit :-(

You almost got it right.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
