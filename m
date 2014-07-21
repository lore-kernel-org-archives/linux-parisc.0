From: John David Anglin <dave.anglin@bell.net>
Subject: Re: struct sigaction sa_restorer field
Date: Mon, 21 Jul 2014 10:14:09 -0400
Message-ID: <BLU436-SMTP1157331F7463DB56E855A8897F00@phx.gbl>
References: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl> <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/21/2014 4:25 AM, Helge Deller wrote:
> Hi Dave,
>
>> The sa_restorer field is obsolete and not in the hppa struct
>> sigaction, but we still define SA_RESTORER.  What should be done?
> Basically to not break userspace we can't (and shouldn't) add the sa_restorer struct member.
> So, the only option would be to drop the SA_RESTORER #define, right?
> But I have no idea how and if this will break some builds, since the major arches seem to define SA_RESTORER...
>
I asked the question when I saw the crashme kernel test package didn't 
build due to the missing field.

In the generic sigaction struct, the field is conditional on the 
SA_RESTORER define.  I imagine that
the major arches also have sa_restorer struct member.

I agree it seems best to remove the define.

Dave

-- 
John David Anglin    dave.anglin@bell.net

