From: Randolph Chung <randolph@tausq.org>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 17:40:28 +0800
Message-ID: <4A3A0B8C.9070104@tausq.org>
References: <20090618013510.0484B4FE2@hiauly1.hia.nrc.ca> <4A39DFAA.30803@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	linux-parisc@vger.kernel.org
To: Luk Claes <luk@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A39DFAA.30803@debian.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Luk,
> There is no desire to trim working architectures.
>
> It's very easy to tell there is nothing wrong when you don't have to
> deal with unreliable build daemons, endless discussions but no visible
> progress (except for java support) and complaints from DSA, package
> maintainers and others.
>   
If you looked at https://buildd.debian.org/stats/graph-big.png  I think 
it is obvious hppa is not *that* broken. hppa is >95% built. That is not 
that bad. Of course, it can be better, but if you looked at this with a 
historical perspective the port is really in a pretty good shape.

If you looked at the status of the toolchain posted to the 
gcc-testresults page: http://gcc.gnu.org/ml/gcc-testresults/2009-06/  
you can see that hppa is one of the better architectures out there. Our 
results are on par with (if not better than) other supported architectures.

IMHO hppa contributed a lot to getting Debian packages (and upstream) 
properly fixed to build properly across many other architectures and 
making it easier for new architectures to get incorporated into Debian. 
It's unfortunate that parisc is no longer a commercially popular 
platform, but why should not affect whether Debian supports it?

It's obvious from the recent exchange that there are still people on the 
hppa team (and other Debian maintainers) that are willing to work on 
this architecture to make things better. Also by many metrics it is 
still very much a working architecture. It's really a shame that 
Debian's considering dropping support for HPPA in Squeeze. Please 
reconsider.

randolph
