Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D73F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 09:39:46 -0600 (MDT)
Date: Tue, 28 Aug 2001 11:40:32 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: baldric-exec@baldric.uwo.ca, rhirst@linuxcare.com,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010828114032.C30657@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk> <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk> <20010817155340.C8649@megatonmonkey.net> <20010828000748.G7064@linuxcare.com> <20010828002251.L28978@megatonmonkey.net> <carlos@megatonmonkey.net> <20010828151417.CADE037DAD@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828151417.CADE037DAD@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Tue, Aug 28, 2001 at 09:14:17AM -0600
List-ID: <linux-parisc.vger.kernel.org>

> 
> For an x86 -> hppa/hppa64 cross toolchain I use the palinux-autobuilder script 
> in the build-tools section of pehc cvs.
> 
> For a native hppa toolchain use the debian packages(which several people 
> worked very hard on in order to get working so we didn't have to deal with 
> building by hand).
> 

True, the native hppa toolchain is excellent. But in our case the systems we
are compiling for are much too slow.  Our cluster of 715's is great for 
proving and testing that your code works in parallel, but nothing short of
dead slow...

Thus we make extensive use of the toolchain on x86.
Ever try building MPICH on a 715/50? :}
Compared to make -j16 on our dual PIII...

> For hppa -> hppa64 cross compilers I still do it by hand.
> 
> Are you rolling your own toolchain for fun, or is the stuff on pehc not 
> meeting your needs?
>

The palinux-autobuilder, atleast the last one I saw, could not compile
the latest set of sources.  I haven't tried in a while.  This is really
the whole reason this thread got started... that palinux-autobuilder 
wasn't working properly for me :} And now Matthew almost has me signed on
as the maintainer for glibc on hppa!

Also, the notes on http://www.parisc-linux.org/toolchain/index.html should
be changed to reflect the fact that it's not possible to build a system
using said instructions ;)

It should probably be changed to include the steps required to:

a) Roll it by hand (what I was attempting)
b) Use the palinux-autobuilder

It goes without saying that I really _want_ the autobuilder to work.
Maybe I should grab it out of CVS... I had the ftp version.

I noted in my other email, that there are a few finiky things that
the autobuilder must do in order to work (set certain environment variables,
patch glibc, etc...).

Cheers,
Carlos. 
