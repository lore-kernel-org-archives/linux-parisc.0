Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kramer (dsl-64-128-230-1.telocity.com [64.128.230.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 108CC4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 22:14:35 -0700 (MST)
Date: Fri, 6 Dec 2002 00:14:38 -0500
Subject: Re: [parisc-linux] Driver for A4071B on C100 workstation
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: derekengelhaupt@rocketmail.com,
	parisc-linux@lists.parisc-linux.org
To: "Abel Mamfoumby" <moumboungou@hotmail.com>
From: Chuck Slivkoff <caslivkoff@telocity.com>
In-Reply-To: <F129hxhabHzpJIhRcoA0000c96c@hotmail.com>
Message-Id: <9DF31824-08D9-11D7-8876-000393581E44@telocity.com>
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

I helped a colleague get the A4071B working in a 725/100 last week.  
Config in a Cxxx box should be the same. You have to match the  
dimensions and depth of the fb, as reported by the kernel on boot.

-chuck

http://lists.debian.org/debian-hppa/2002/debian-hppa-200212/ 
msg00011.html


On Thursday, Dec 5, 2002, at 08:34 US/Eastern, Abel Mamfoumby wrote:

> I don't know how I can do to use the internal port!
>
>
>> From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
>> To: Abel Mamfoumby  
>> <moumboungou@hotmail.com>,parisc-linux@lists.parisc-linux.org
>> Subject: Re: [parisc-linux] Driver for A4071B on C100 workstation
>> Date: Thu, 28 Nov 2002 06:44:30 -0800 (PST)
>>
>>
>> I had that same card in my C180 and couldn't get it to work.  You  
>> will probably be better off using the internal graphics port on the  
>> C100.  The internal port only yields 8 bit color, but I don't think  
>> that A4071B card is supported at the moment.
>> derek
>>  Abel Mamfoumby <moumboungou@hotmail.com> wrote:Hello,
>> I have just installed The Debian HPPA Linux 3.0r0 on my workstation  
>> C100 /
>> 9000. And I have the A4071B Graphics card. Unfortunately I can't  
>> configure
>> X11. is there someone who can help me?
>> ThankU
>>
>> Moumboungou
>>
>>
>>
>>
>>
>> _________________________________________________________________
>> MSN Messenger : discutez en direct avec vos amis !
>> http://www.msn.fr/msger/default.asp
>>
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
>>
>> ---------------------------------
>> Do you Yahoo!?
>> Yahoo! Mail Plus - Powerful. Affordable. Sign up now
>
>
> _________________________________________________________________
> MSN Messenger : discutez en direct avec vos amis !  
> http://www.msn.fr/msger/default.asp
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
