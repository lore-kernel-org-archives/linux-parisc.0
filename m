From: Luk Claes <luk@debian.org>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 20:19:05 +0200
Message-ID: <4A3A8519.70400@debian.org>
References: <20090618013510.0484B4FE2@hiauly1.hia.nrc.ca> <4A39DFAA.30803@debian.org> <4A3A0B8C.9070104@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	linux-parisc@vger.kernel.org
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A3A0B8C.9070104@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Randolph Chung wrote:
> Luk,
>> There is no desire to trim working architectures.
>>
>> It's very easy to tell there is nothing wrong when you don't have to
>> deal with unreliable build daemons, endless discussions but no visible
>> progress (except for java support) and complaints from DSA, package
>> maintainers and others.
>>   
> If you looked at https://buildd.debian.org/stats/graph-big.png  I think
> it is obvious hppa is not *that* broken. hppa is >95% built. That is not
> that bad. Of course, it can be better, but if you looked at this with a
> historical perspective the port is really in a pretty good shape.

As already was explained, the issue is not that builds don't succeed
after multiple tries. The issue is that sometimes multiple tries are
needed and sometimes the buildds crash.

> If you looked at the status of the toolchain posted to the
> gcc-testresults page: http://gcc.gnu.org/ml/gcc-testresults/2009-06/ 
> you can see that hppa is one of the better architectures out there. Our
> results are on par with (if not better than) other supported architectures.

I hope that it will show in the reliability of the buildds and the
general improvement of support for the hppa port.

Cheers

Luk
