From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fix parisc runtime hangs wrt pa_tlb_lock
Date: Wed, 17 Jun 2009 09:26:05 +0200
Message-ID: <4A389A8D.2010806@gmx.de>
References: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca> <4A2ADEC9.2090403@gmx.de> <4A35741F.6000107@gmx.de> <20090614232046.GA14028@hiauly1.hia.nrc.ca> <4A3805E4.4080305@gmx.de> <20090617025529.GA19032@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090617025529.GA19032@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/17/2009 04:55 AM, Kyle McMartin wrote:
> On Tue, Jun 16, 2009 at 10:51:48PM +0200, Helge Deller wrote:
>> On 06/15/2009 01:20 AM, John David Anglin wrote:
>>> I am convinced that interrupts need to be disabled on SMP kernels to
>>> prevent deadlock.  On UP kernels, I am not convinced that anything bad
>>> happens if we do a tlb purge while handling an interrupt since we don't
>>> have to worry about preventing bus conflicts.  The UP code can't
>>> deadlock.  I'm thinking that we can stay with disabling preemption.
>> Dave is right and it took me long to understand his point...
>> I continued testing and we can simply just disable preemption for UP
>> kernels and use an irq-safe spinlock for SMP kernels.
>>
>> Below is the latest and greatest patch which fixes this bug.
>> Run-tested onUP kernels and compile-tested on SMP kernels.
>>
>
> Ugh, I'd really prefer it if we just took the irq disable and enable hit
> on UP by making the codepaths the same... Is that ok with you or?

You mean to use the irq-safe spinlocking path for SMP _and_ UP?
Yes, that would be ok for me too. We just thought why we should try to save
some cycles on UP if possible, as the UP-kernel often is used on
slower machines where it would be beneficial for them...

If yes, do you want me to send an updated patch?

Helge
