From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Mon, 23 Dec 2013 21:39:54 -0500
Message-ID: <BLU0-SMTP924554170555959730283297C00@phx.gbl>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <2859617.TAsvt0Sziu@caliban.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2859617.TAsvt0Sziu@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23-Dec-13, at 3:34 PM, Rolf Eike Beer wrote:

> Am Donnerstag, 19. Dezember 2013, 21:17:51 schrieb Aaro Koskinen:
>> Hi,
>>
>> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the  
>> current
>> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
>
> I also suspect this patch of causing trouble. My C8000 regularly  
> submits to
> the libarchive dashboard (http://my.cdash.org/index.php?project=libarchive 
> ).
> Since I upgraded to 3.12.5 one test (libarchive_test_compat_mac) keeps
> failing. The day after compile errors and other problems started  
> (just browse
> through the last 2 weeks and you will see it). Then I reverted that  
> change and
> rebootet. The compat_mac test still fails, but the other failures  
> are gone.

The libarchive_test_compat_mac test also appears to fail on x86.  It  
didn't fail
in my 3.1.2 build with kernel change.

I believe the GLIBC 2.18 change was wrong but I don't see why it would  
cause
compile errors.  I have compiled many packages with the kernel change  
and not
seen problems that I would attribute to it.

I did a test build of libarchive and saw following fails:

Failing tests:
   20: test_archive_read_close_twice_open_fd (3 failures)
   21: test_archive_read_close_twice_open_filename (3 failures)

This was with 3.1.2.  Looking at the logs, it didn't appear that these  
were mmap issues.

We need more data.

Dave
--
John David Anglin	dave.anglin@bell.net



