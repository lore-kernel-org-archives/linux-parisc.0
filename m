From: John David Anglin <dave.anglin@bell.net>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Thu, 12 Mar 2015 15:51:11 -0400
Message-ID: <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl> <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com> <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl> <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com> <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl> <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Cc: Graham Gower <graham.gower@gmail.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	kirill@shutemov.name
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-03-12 3:35 PM, Aaro Koskinen wrote:
> Hi,
>
> On Wed, Mar 11, 2015 at 08:21:35PM -0400, John David Anglin wrote:
>> On 2015-03-11, at 7:31 PM, Graham Gower wrote:
>>> I thought this patch was supposed to address the problem?
>>> https://lkml.org/lkml/2015/2/26/230
>>>
>>> However, its not fixed it for me either in 4.0.0-rc3.
>> I doubt the patch is correct for parisc. I believe the system where
>> I saw the BUG messages has PT_NLEVELS == 3.
> For 32-bit kernels, the fix helped.
32-bit kernels have PT_NLEVELS == 2.  I think the define needs to be 
moved outside #if/#endif
but didn't get a chance to test last night.

Dave

-- 
John David Anglin  dave.anglin@bell.net

