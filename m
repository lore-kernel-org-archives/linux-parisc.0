Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c003.snv.cp.net (h024.c003.snv.cp.net [209.228.32.238])
	by dsl2.external.hp.com (Postfix) with SMTP id 247724842
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 11:38:57 -0600 (MDT)
Date: Sun, 14 Jul 2002 13:39:03 -0400
Subject: Re: [parisc-linux] 712/80 ext. network card
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: Simon Urbanek <su@b-q-c.com>, parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
From: Chuck Slivkoff <caslivkoff@telocity.com>
In-Reply-To: <200207141512.18242.deller@gmx.de>
Message-Id: <968A1D16-9750-11D6-84C8-000393581E44@telocity.com>
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

There's no ISA slot in the 712. There was a special interface card 
(A4014A) that added a second network port and a second serial port. It 
is documented in this manual:

   http://www.hp.com/workstations/support/archive/manuals/A2615-90602.pdf

Good luck trying to find one. The only time I saw these adapters was 
when the 712 was used as the console to V-class servers. The B-class 
(with PCI & GSC slots) soon replaced the 712 for this solution.

I wanted to do the same with one of my 712's, but have not been able to 
find one of these adapters. :-(

On Sunday, July 14, 2002, at 09:12 , Helge Deller wrote:

> Hi Simon,
>
> last time I tested a normal PC network card (ISA NE2000 clone) worked.
>
> Greetings,
> Helge
>
> On Sunday 14 July 2002 14:52, Simon Urbanek wrote:
>> Hi,
>>
>> I have a HP 712/80 workstation with PARISC-Linux and it works 
>> flawlessly
>> (2.4.18) - good job.
>> I would like to use it as a router/fw, ergo I need to plugin another
>> network card. Could you, please, tell me what network cards for the
>> extension slot are supported by the PARISC-Linux and maybe where I can
>> get one? I know, it's all a bit old stuff ;) so it's not easy to get I
>> suppose..
>>
>> Thanks for any help,
>> Simon
>>
>> PS: Please CC any response to my e-mail since I'm not on the list.
>>
>> --
>> Simon Urbanek
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
