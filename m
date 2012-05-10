From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Thu, 10 May 2012 12:32:04 -0400
Message-ID: <4FABED84.2040401@bell.net>
References: <4FA9975C.5060708@bergerie> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <2075347.T446pQRFvO@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Vincent <vincent.stehle@laposte.net>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2075347.T446pQRFvO@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5/10/2012 2:41 AM, Rolf Eike Beer wrote:
> John David Anglin wrote:
>
>> I posted a number of kernel work in progress patches to the linux-parisc
>> list but nobody bothered to test them except for Vincent today.  All I
>> know
>> at this point is my rp3440 is much more stable and runs twice as fast as
>> it used to with my cache patch.  As such, it can keep up with unstable.
>> This took hundreds of kernel builds and considerable long term testing.
> I have your patch from a while back applied to my C8000 and I have not seen
> any crashes or other issues yet (since beginning of April). Your futex patches
> are on this machine for even longer. This of course means only that there is
> no obvious breakage, I did not run any special testcase for any of those stuff,
> but at least it doesn't randomly eats my machine.
>
> I think Guy Martin has the cache patch running on at least one of his
> machines.
>
> Related note: The #Gentoo-HPPA channel on Freenode has at least some activity
> every other day, often even daily. The last 3 critical breakages I had (the
> gcc bug breaking swap, the gcc bug breaking ext4 and the 3.4-rc compile
> breakage) were first discussed there before posting anywhere. Because of that
> the initial report e.g. to linux-parisc already had rather good data on what
> is happening.
>
Thanks, it's good to know that there has been some other testing.

Does anyone have a working 32-bit kernel using the tmpalias support?  It 
would be nice
to know if the problem is a 32-bit or PA 1.1 issue.

I asked where the crash occurred because PA 2.0 mnemonics are used in 
the tmpalias
code.  On the other hand, if the failure occurs on the first flush 
instruction, the issue is likely
in the TLB insert code in entry.S.

Dave

-- 
John David Anglin    dave.anglin@bell.net

