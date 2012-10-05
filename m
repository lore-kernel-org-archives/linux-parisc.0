From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Sat, 6 Oct 2012 00:32:52 +0100
Message-ID: <20121005233252.GD2616@ZenIV.linux.org.uk>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
 <20121005144819.GO23473@ZenIV.linux.org.uk>
 <BLU0-SMTP36BD50597936314A689A99978B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP36BD50597936314A689A99978B0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 05, 2012 at 06:54:02PM -0400, John David Anglin wrote:
> On 5-Oct-12, at 10:48 AM, Al Viro wrote:
> 
> >What are you using for toolchain, BTW?  With gcc 4.3 / binutils 2.20
> >(cross-builds) I'm getting panics from mainline kernel on parisc32 all
> >way back to 2.6.28...
> 
> 
> Current debian unstable tools are available in
> shirka.esiee.fr:/home/dave/archives
> and shirka.esiee.fr:/home/dave/archives-new.  It's pretty straight
> forward to update
> binutils, gcc, libc, etc.
> 
> gcc 4.4, 4.5, 4.6 and 4.7 are available.  In particular, 4.6 and 4.7
> have significant
> bug fixes.
> 
> James seems to have an account on shirka.
> 
> I don't have any place to distribute the debs that are on shirka, or
> the time to remove
> obsolete builds.  Any volunteers?

Hmm...  debian-ports would be a natural place, but TBH I'd very much prefer
to deal with cross-builds - doing kernel builds on a 100MHz 7100LC with
96M of RAM is really not fun...
