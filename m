Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep13-int.chello.nl (amsfep13-int.chello.nl [213.46.243.23])
	by dsl2.external.hp.com (Postfix) with ESMTP id D378B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jan 2002 16:09:30 -0700 (MST)
Message-ID: <3C47ABFF.3090102@chello.nl>
Date: Fri, 18 Jan 2002 06:00:47 +0100
From: Arjen Hommersom <arjenh@chello.nl>
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.3 on a graphics console
References: <117AF172-0904-11D6-AEFA-0030656F07A2@esiee.fr>
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

>>
>> For hardware.. it's a C240 and sam reports a HP visualize FX2(4) as a 
>> graphics card that is connected to a VGA monitor which works ok in 
>> HP-UX. If you can tell me how to get more detailed hardware 
>> information in HP UX, i'll be happy to provide it.
>
>
> Well, I bet this specific off board graphic card is not supported.
> Although onboard controllers are getting more and more supported, it 
> is not the case for specific HP hardware.
>
> As there's no core graphics for your box, I suggest you to try with 
> serial console.


Ah, that works, linux is up and running now :) Upgrading to 2.4.16-32 
even allows me to use a  graphics console, so thats all great. However, 
i do not see the penguin while booting and XFree doesnt seem to work, so 
i suppose the framebuffer device doesn't work (?)

I found in the mailinglist archive the thread "XFree86 on B180" that 
suggests it might work if you treat this card as an 'artist graphics 
card'. I'd be more than happy to test that if someone could give me some 
details on how to do that.

Thanks,

Arjen Hommersom
