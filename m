Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5156485A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Oct 2002 17:26:29 -0600 (MDT)
Message-ID: <3DBB3423.5020408@freebel.net>
Date: Sun, 27 Oct 2002 00:32:35 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
References: <3DB5776100000C32@ocpmta8.be.tiscali.com> <3DBAD364.9060301@freebel.net> <20021026211822.GJ22052@tausq.org> <3DBB30C0.6060000@freebel.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

__pu_err disapear in ..asm64?
It doesn't seems to be an error, so don't we need anymore??

Joel Soete wrote:
> 
> 
> Randolph Chung wrote:
> 
>> In reference to a message from Joel Soete, dated Oct 26:
>>
>>> i386 declare: "extern void __get_user_bad(void);"
>>> ...
>>> but not define elsewhere? (is it there so that the build of the 
>>> kernel failed if that case was requested to run properly?)
>>
>>
>>
>> yes.
>>
>>
>>> PS: afaik on i386 only put_user_u64 is define why not pending get_user?
>>
>>
>>
>> on first glance i haven't found any code that uses get_user with 64-bit
>> quantities.
> 
> 
> Not found too.
> 
>> if you have a specific need for this, please let me know.
> 
> 
> No spefic need, thanks. It was just because mips (32bits) already 
> foreseen it and it would be already complete :)
> 
>>
>> in the mean time, i've checked in support for put_user with 64-bit
>> values. This is in 2.4.19-pa24
> 
> 
> Great, I will test it (in fact I was not so far; just a problem of 
> writing the right way).
> 
> Anyway couldn't we also consider __get_user_bad() and __get_kernel_bad() 
> for _default:_ case (just to avoid erronious case: with the problem 
> encounter with xfs test I was near to loose all my system :(( )?
> 
>>
>> Let me know if this works for you. i've tested it only lightly.
>>
> Just have to wait a few days to test at office.
> 
> Thanks again.
> 
> See you,
>     Joel
> 
> 
