Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx05.nexgo.de (mx05.nexgo.de [151.189.8.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC90F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 03:18:18 -0600 (MDT)
Message-ID: <3B8F7268.9090408@hrzpub.tu-darmstadt.de>
Date: Fri, 31 Aug 2001 13:18:00 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel failures
References: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de> <20010831064005.F30497@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

>>4. My HIL-Keyboard isn't detected anymore by the new 2.4.9-kernel. Using 
>>Kernel 2.4.7-pa1, after the initalisation of HIL, I get a bootmessage like
>> "HIL: keyboard found".  Booting the new Kernel gives me only the two 
>>lines of HIL initalisation, but nothing about my Keyboard. Which is a 
>>PS/2-Keyboard on a HIL-Adaptorbox. Both Kernel were configured via "make 
>>oldconfig".
>>
>
>I'm interested in debugging this one - I don't quite understand what's going on though.  You should see:
>
>Found HIL at 0x%x, IRQ %d
>
>then one of:
>
>HIL: timed out, assuming no keyboard present.
>HIL: no keyboard present.
>HIL: keyboard found at id %d
>
>which?
>
Sorry!! I looked at the wrong File. I get the following messages:
Snip------------
        Found HIL at 0xf0201000, IRQ 126
        HIL: keyboard found at id 0
        HIL: keymap loaded.
Snap-----------

But thanks for your quick answer!

Rüdiger
