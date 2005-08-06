From: Matt Taggart <taggart@debian.org>
Subject: Re: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Sat, 06 Aug 2005 13:43:52 -0700
Message-ID: <20050806204352.F1B4A1AA7B5@cyrix.home.bogus>
References: <1123204638.3628.132.camel@krebs.dannf>
	<20050805195306.GS9703@systemhalted.org>
	<1123274838.9036.57.camel@krebs.dannf>
	<20050806183834.0C7681AA7DF@cyrix.home.bogus>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050806183834.0C7681AA7DF@cyrix.home.bogus> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Matt Taggart writes...

> I can repeatably cause a kernel panic on paer now. The machine is running the
>  
> Debian kernel-image-2.6.8-2-64 version 2.6.8-6 package. When I tried to run 
> apt-get upgrade in an unstable chroot I got the following on the console,

I had a hunch that this problem was something to do with the apt in the 
unstable chroot so I tried some things to fix it.

First, using aptitude upgrade instead caused a crash as well, no surprise.

Second, I suspected that the problem might be a c++ issue, so I used dpkg to 
upgrade a few things by hand. After just upgrading libstdc++6 from 4.0.1-2 to 
4.0.1-3 the apt-get upgrade to no longer crashed the machine, but it still 
segfaulted. I then upgraded apt/apt-utils to 0.6.39 and now apt-get upgrade 
seems to work fine.

So paer is fixed, but apt shouldn't have been able to crash the kernel so it 
still might be nice to figure out why. I think the test case should be easy to 
replicate for someone who wanted to try and figure out why.

Thanks,

-- 
Matt Taggart
taggart@debian.org


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
