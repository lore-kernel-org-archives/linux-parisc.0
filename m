From: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref refs/heads/parisc)
Date: Fri, 15 Oct 2010 22:10:21 +0200
Message-ID: <4CB8B52D.6040300@steuerkanzlei-deller.de>
References: <201010140531.o9E5VRYK010123@hera.kernel.org> <20101014153931.GI24144@bombadil.infradead.org> <4CB8B0DE.1070606@steuerkanzlei-deller.de> <20101015200141.GH8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101015200141.GH8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  On 10/15/2010 10:01 PM, Kyle McMartin wrote:
> On Fri, Oct 15, 2010 at 09:51:58PM +0200, Helge Deller wrote:
>>   On 10/14/2010 05:39 PM, Kyle McMartin wrote:
>>> On Thu, Oct 14, 2010 at 05:31:27AM +0000, Kyle McMartin wrote:
>>>> commit 7da1272547ebe96982a42292dfc833457708f4da
>>>> Author: Kyle McMartin<kyle@dreadnought.i.jkkm.org>
>>>> Date:   Thu Oct 14 01:02:23 2010 -0400
>>>>
>>>>      parisc: kill __do_IRQ
>>>>
>>>>      Signed-off-by: Kyle McMartin<kyle@redhat.com>
>>>>
>>> So, I've killed our __do_IRQ calls... Could people please test this
>>> branch on a variety of machines? I've split up the changes so there's
>>> logical separation between converting the CPU interrupts, and the
>>> sub-interrupt sources (Superio, dino, etc.) so if your device fails
>>> to interrupt, you can just git revert that bit and test the CPU
>>> conversion while I fix it up.
>>>
>>> I *think* everything should be ok though, I've tested it on a500/rp3440
>>> class machines with iosapic, but not on anything older.
>> c3000 is ok too. But I think it has iosapic as well.
>> I will try if I can connect the 715/64 and b160L, but I'm not sure
>> if I find time to do it this weekend...
>>
> C3000 is a good one since it has SuperIO, I don't remember what devices
> are behind it (IDE, USB, iirc...) though.
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled

And serial works, since I'm running on serial console.... :-)

Helge
