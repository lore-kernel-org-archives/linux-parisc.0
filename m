From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Fri, 04 Jun 2010 10:03:07 +0900
Message-ID: <4C0850CB.20703@fsij.org>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <20100602171600.GA5566@hiauly1.hia.nrc.ca> <20100602175616.GA23219@lackof.org> <201006031150.15725.modestas@vainius.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: dann frazier <dannf@debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	561203@bugs.debian.org, deller@gmx.de,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, carlos@systemhalted.org
To: Modestas Vainius <modestas@vainius.eu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201006031150.15725.modestas@vainius.eu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Modestas Vainius wrote:
>> Note that Debian's buildds run a UP kernel, so as soon as those fixes
>> go upstream we can pull them in. Thanks for all your work here!
>>
>
> Well, as long as this is unfixed or at least "common", I don't see how hppa
> can be considered to be a release arch. Is that UP patch available somewhere?

My case and my analysis talked about UP kernel, and John David Anglin
made a patch:
	http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=561203#144

After that, the discussion went to SMP cases.

It would be better to evaluate the patch again, and make sure it works
for UP case and fix failures of buildd, then apply for Linux in Debian
(only) for HPPA.

I know that the patch is not that ideal because it touches
architecture independent part of Linux, but it is worth for Linux in
Debian (or Linux for the HPPA machine of buildd, at least).
-- 
