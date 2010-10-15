From: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref refs/heads/parisc)
Date: Fri, 15 Oct 2010 21:51:58 +0200
Message-ID: <4CB8B0DE.1070606@steuerkanzlei-deller.de>
References: <201010140531.o9E5VRYK010123@hera.kernel.org> <20101014153931.GI24144@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101014153931.GI24144@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  On 10/14/2010 05:39 PM, Kyle McMartin wrote:
> On Thu, Oct 14, 2010 at 05:31:27AM +0000, Kyle McMartin wrote:
>> commit 7da1272547ebe96982a42292dfc833457708f4da
>> Author: Kyle McMartin<kyle@dreadnought.i.jkkm.org>
>> Date:   Thu Oct 14 01:02:23 2010 -0400
>>
>>      parisc: kill __do_IRQ
>>
>>      Signed-off-by: Kyle McMartin<kyle@redhat.com>
>>
> So, I've killed our __do_IRQ calls... Could people please test this
> branch on a variety of machines? I've split up the changes so there's
> logical separation between converting the CPU interrupts, and the
> sub-interrupt sources (Superio, dino, etc.) so if your device fails
> to interrupt, you can just git revert that bit and test the CPU
> conversion while I fix it up.
>
> I *think* everything should be ok though, I've tested it on a500/rp3440
> class machines with iosapic, but not on anything older.

c3000 is ok too. But I think it has iosapic as well.
I will try if I can connect the 715/64 and b160L, but I'm not sure if I 
find time to do it this weekend...

BTW, fanotify* isn't wired up yet:
<stdin>:1526:2: warning: #warning syscall fanotify_init not implemented
<stdin>:1530:2: warning: #warning syscall fanotify_mark not implemented

Helge
