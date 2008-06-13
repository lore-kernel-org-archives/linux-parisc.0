From: Thiemo Seufer <ths@networkno.de>
Subject: Re: hppa release status
Date: Fri, 13 Jun 2008 10:48:09 +0100
Message-ID: <20080613094809.GA17481__31493.464872665$1213352453$gmane$org@networkno.de>
References: <20080608194617.GT10194@mails.so.argh.org> <484EF5D7.5000209@gmx.de> <1213285147.3426.23.camel@localhost.localdomain> <20080613084410.GB12988@artemis.madism.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Andreas Barth <aba@not.so.argh.org>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.o
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080613084410.GB12988@artemis.madism.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Pierre Habouzit wrote:
[snip]
> > Actually, I can't reproduce this on ion, which is my debian testing
> > build box.  The only difference from a normal testing system is that
> > it's running 2.6.26-rc1 (it's also a pa8800 which makes its coherency a
> > bit more stringent).  Building python 2.5.2-6 and running all the built
> > in tests except the two parisc exceptions runs.  Ryan Murray stated that
> > the failing test was test_sys, so this is what I get running it alone:
> > 
> > jejb@ion> pwd
> > /home/jejb/sources/python2.5-2.5.2/build-shared
> > jejb@ion> ./python  -E -tt ../Lib/test/regrtest.py -w -l -uall -s
> > test_sys
> > test_sys
> > 1 test OK.
> > 
> > So I think more investigation of the actual alleged failure is
> > warranted.  At this time, if it is a real failure, I'm not sure it's
> > necessarily threads related.
> 
>   This is really coherent with our observations: LT is almost pure C,
> and kfreebsd uses LT and python works really well. So either it's a bug
> in the LT hppa specific code, or a kernel issue. Your tests tends to
> show the latter.

I recall a similiar failure on mips/mipsel went away after upgrading the
buildd kernels to 2.6.24+. (I have no idea what version the hppa buildds
use.)


Thiemo
