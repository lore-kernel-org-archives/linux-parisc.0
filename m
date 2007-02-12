From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Fw: Another problem with making things static
Date: Mon, 12 Feb 2007 12:42:57 +0100
Message-ID: <7d01f9f00702120342g628f53e3o2eb68f33605e83db__16065.7316832387$1416624286$gmane$org@mail.gmail.com>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
	<20070210201911.7a16b5f3.akpm@linux-foundation.org>
	<20070211072552.GC22248@colo.lackof.org>
	<20070210234424.500ed1c9.akpm@linux-foundation.org>
	<20070211075738.GD22248@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070211075738.GD22248@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 2/11/07, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sat, Feb 10, 2007 at 11:44:24PM -0800, Andrew Morton wrote:

> > I say this a lot, but...  It is in the interests of arch maintainers to
> > help others to build cross-compilers.  If someone were to prepare a web
> > page (or even a script) which could be used to generate a kernel
> > cross-compilation environment for parisc then the parisc maintainers would
> > see a lot less breakage.
>
> Agreed.
> We have such a page:
>         http://www.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html
>
> (link "Build XC" from www.p-l.o homepage)

This is unfortunately rather outdated... I wonder if it'd still work.
I've built a parisc xcompiler a while ago using
toolchain-source/tpkg-make, I'll try to do that again and make a
receipe available online.

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
