From: Helge Deller <deller@gmx.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 20 May 2012 21:11:43 +0200
Message-ID: <4FB941EF.4060304@gmx.de>
References: <4FA9975C.5060708@bergerie>    <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>    <4FAADE2A.9080803@bergerie>  <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>  <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>   <4FB182F8.2040403@gmx.de>  <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>    <1337069366.3005.10.camel@dabdike.lan>   <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>   <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>   <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>   <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>   <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>  <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>  <4FB6BA76.6010101@gmx.de> <1337508060.2682.13.camel@dabdike.int.
 hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337508060.2682.13.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/20/2012 12:01 PM, James Bottomley wrote:
> On Fri, 2012-05-18 at 23:09 +0200, Helge Deller wrote:
>> James, here is the full kernel log. Does this help?
>
> Yes and no: it shows clearly we got all the way through the initrd, so
> we've gone through the alias region thousands of times doing flushes.
>
>> Kernel Fault: Code=26 regs=8fc30940 (Addr=0f2ff000)
>>
> It's an access rights trap, presumably on the alias tlb, since the
> address is definitely in the alias region.  The obvious candidate is the
> protection id deposit in do_alias
>
> 	depw,z		\prot,8,7,\prot
>
> but that all checks out fine (you can compare it with
> make_insert_tlb_11). So the page should have read, write and dirty set.
>
> The interesting thing is that the only way to get an access rights trap
> in the kernel is if the protection type is zero and I just can't see how
> do_alias would zero out \prot in a way that functions on your C3000
> (PA2.0) but not on the PA1.1 systems.
>
> Are you sure this is booting the same kernel?

Yes, since I use tftboot to deliver same vmlinux kernel to all my machines
for bootup.

Helge
