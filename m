From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128
 bytes on PA8800 and PA8900 CPUs
Date: Mon, 28 Sep 2015 16:00:03 -0400
Message-ID: <56099C43.70705@bell.net>
References: <20150902162000.GC2444@ls3530.box>
 <1441287043.2235.6.camel@HansenPartnership.com>
 <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de>
 <56017FB3.5050709@gmx.de> <65929045-FF25-4BFB-BA89-F07A47328F1F@bell.net>
 <5609636C.7010604@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5609636C.7010604@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-28 11:57 AM, Helge Deller wrote:
> Hi Dave,
>
> On 27.09.2015 18:27, John David Anglin wrote:
>> On 2015-09-22, at 12:20 PM, Helge Deller wrote:
>>> The baseline for all results is the timing with a vanilla kernel 4.2:
>>> real    0m13.596s
>>> user    0m18.152s
>>> sys     0m35.752s
>>>
>>>
>>> The next results are with the atomic_hash (a) patch applied:
>>> For ATOMIC_HASH_SIZE = 4.
>>> real    0m21.892s
>>> user    0m27.492s
>>> sys     0m59.704s
>>>
>>> For ATOMIC_HASH_SIZE = 64.
>>> real    0m20.604s
>>> user    0m24.832s
>>> sys     0m56.552s
>>>
>> Attached is a revised patch "a" to try to improve performance of atomic_t variables.  If you get a chance, could
>> you see how it performs.
> here are the numbers for your revised "a" patch (on top of vanilla kernel 4.2):
>
> real    0m20.040s
> user    0m22.876s
> sys     0m56.724s
> (Variations can be around +- 0.5 seconds)
>
> If you want to test yourself:
> The testcase executable is on sibaris: /home/var_lib_sbuild_build/libatomic/libatomic-ops-7.4.2/test_atomic
It doesn't seem like the padding has much difference.  I had hoped for 
better although
the test probably doesn't test atomic_t variables.  The regression from 
the the vanilla
kernel is a problem.

Dave

-- 
John David Anglin  dave.anglin@bell.net

