Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep14-int.chello.nl (amsfep14-int.chello.nl [213.46.243.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E744482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 08:25:52 -0700 (MST)
Message-ID: <3C434AFE.4060506@chello.nl>
Date: Mon, 14 Jan 2002 22:17:50 +0100
From: Arjen Hommersom <arjenh@chello.nl>
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 0.9.3 on a graphics console
References: <B07B5B98-08FE-11D6-AEFA-0030656F07A2@esiee.fr>
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

Thibaut VARENE wrote:

> Hi,
>
> about your problem you might find answers there:
> http://lists.parisc-linux.org/pipermail/parisc-
> linux/2001-December/014912.html

This person succeeded with a serial console. Any reports of people 
succeeding with a graphics console?

> Could you please tell us what procedure you used to install (CD, 
> network...), what is you exact hardware configuration, what boot args 
> you exactly typed, and any further info you might think useful to add...

I'm trying to do a network install. I installed bootpd on an Debian/i386 
machine and i boot with
 > boot lan
I chose not to interact with IPL, so it used default boot args.

For hardware.. it's a C240 and sam reports a HP visualize FX2(4) as a 
graphics card that is connected to a VGA monitor which works ok in 
HP-UX. If you can tell me how to get more detailed hardware information 
in HP UX, i'll be happy to provide it.

>>
>> I'm trying to install 0.9.3 with a graphics console on a C240, but 
>> the system stops at:
>> Branching the kernel entry point 0x00100000.
>>
>> I've seen reports of people succeeding it with a serial console. 
>> Before i try to find out how that works (i've never used a serial 
>> console before), i'm wondering if there will be a 0.9.4 in the near 
>> future that supports this setup.
>>

Arjen Hommersom
