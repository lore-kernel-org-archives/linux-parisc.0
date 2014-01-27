From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: parisc: fix =?UTF-8?Q?mmap=28MAP=5FFIXED=7CMAP=5FSHARED=29=20?=
 =?UTF-8?Q?to=20already=20mmapped=20address?=
Date: Mon, 27 Jan 2014 12:23:58 +0100
Message-ID: <abd044509f0c10ea10d8f4ab26c7de40@sf-mail.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
 <2859617.TAsvt0Sziu@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2859617.TAsvt0Sziu@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 23.12.2013 21:34, schrieb Rolf Eike Beer:
> Am Donnerstag, 19. Dezember 2013, 21:17:51 schrieb Aaro Koskinen:
>> Hi,
>> 
>> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
>> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> 
> I also suspect this patch of causing trouble. My C8000 regularly 
> submits to
> the libarchive dashboard 
> (http://my.cdash.org/index.php?project=libarchive).
> Since I upgraded to 3.12.5 one test (libarchive_test_compat_mac) keeps
> failing. The day after compile errors and other problems started (just 
> browse
> through the last 2 weeks and you will see it). Then I reverted that 
> change and
> rebootet. The compat_mac test still fails, but the other failures are 
> gone.

Just for the records: the compat_mac test fails also on my x86_64.

At least the compile error in archive_read_support_format_zip.c is real, 
i.e. I can reproduce it on a 32 bit build on x86. No idea why it did not 
happen before.

Eike
