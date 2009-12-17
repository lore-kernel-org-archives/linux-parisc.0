From: Helge Deller <deller@gmx.de>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 20:12:42 +0100
Message-ID: <4B2A82AA.10907@gmx.de>
References: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/16/2009 10:35 PM, John David Anglin wrote:
>> On 12/15/2009 11:21 PM, John David Anglin wrote:
>>>> I have constructed a vfork test case which shows some of the problems
>>>> I have using vfork reliably. This fails every time on my PA8700 system
>>>> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>>>> being corrupted.
>>>
>>> The test doesn't fail on two of my builds:
>>> Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
>>> Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc
>>
>> I did tested your testcase on my c3000 too but it didn't failed for me either.
>> This was on some 2.6.32-rc candidate.
>
> I think it must be because Carlos is building SMP kernels.

I couldn't reproduce on my SMP box either (but it's PA8500 instead of PA8700):
cpu             : PA8500 (PCX-W)
model           : 9000/785/J5000
Linux ls3017 2.6.32-32bit #79 SMP Thu Dec 3 14:04:53 CET 2009 parisc GNU/Linux

Helge
