From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Re: Weird sys readings during ghc run
Date: Sun, 9 May 2010 02:22:37 +0200
Message-ID: <A88D1A32-C758-4645-B936-3B35AD7455E4@parisc-linux.org>
References: <w2p7d01f9f01005060541jca558889j5e9ef1e4eccf675a@mail.gmail.com> <00E6F5C7-BD87-4BD0-8E6F-C80D8E427DAA@parisc-linux.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <00E6F5C7-BD87-4BD0-8E6F-C80D8E427DAA@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 6 mai 10 =E0 23:49, Thibaut VAR=C8NE a =E9crit :

> Hi pa-ckers
>
> Sometimes a few graphs tell a lot more than words, here's what has
> been recently observed on lafayette.d.o, one of the hppa Debian
> autobuilders.
>
> http://imagebin.ca/view/uhqcMQ.html
> http://imagebin.ca/view/kGT08zc.html
> http://imagebin.ca/view/r61bGE0X.html
>
> The beginning of the (seemingly) abnormal sys usage, and very high IP=
I
> rate coincides with:
>
> PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
> 14042 buildd    20   0  337m 311m  20m R   99  7.7 138:46.37 ghc
>
> It looks like (but maybe I'm just paranoid) ghc is doing some nasty =20
> things...
>
> Lafayette is running 2.6.32-3-parisc64-smp, and this apparently
> happened during the build of haskell-src-exts_1.8.2-3
>
> The build got eventually killed with ghc still running, see:
> https://buildd.debian.org/fetch.cgi?&pkg=3Dhaskell-src-exts&ver=3D1.8=
=2E2-3&arch=3Dhppa&stamp=3D1273149256&file=3Dlog

=46or the records, exactly the same symptoms (100% sys usage, IPI going=
 =20
crazy, build timeout) happened during the build of missingh.

Log is here:
https://buildd.debian.org/fetch.cgi?pkg=3Dmissingh&arch=3Dhppa&ver=3D1.=
1.0.3-2&stamp=3D1273363098&file=3Dlog&as=3Draw

HTH--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
