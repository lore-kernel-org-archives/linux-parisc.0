Return-Path: <marnix.vd.berg@hccnet.nl>
Received: from smtp10.hccnet.nl (smtp10.hccnet.nl [62.251.0.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99868488D
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 15:24:16 -0700 (MST)
Received: from hccnet.nl by smtp10.hccnet.nl
	via fia65-26.dsl.hccnet.nl [62.251.26.65] with ESMTP for
	<parisc-linux@lists.parisc-linux.org>
	id i2IMOFF1022841 (8.12.10/2.04); Thu, 18 Mar 2004 23:24:15 +0100 (MET)
Message-ID: <405A237B.1070109@hccnet.nl>
Date: Thu, 18 Mar 2004 23:32:27 +0100
From: Marnix van den Berg <marnix.vd.berg@hccnet.nl>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Common Console Problem booting HP C3000 From	CD-Rom
References: <mailman.112.1079643013.2398.parisc-linux@lists.parisc-linux.org>	
	<1079643703.11454.13.camel@lugh.ecew2k.ncsu.edu>	
	<405A1FBE.5040609@hccnet.nl>
	<1079648041.11454.87.camel@lugh.ecew2k.ncsu.edu>
In-Reply-To: <1079648041.11454.87.camel@lugh.ecew2k.ncsu.edu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Reply-To: marnix.vd.berg@hccnet.nl
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Adam,

If you've got no keyboard connected it should switch to serial console 
automatically and afaik it's just a normal 9600 8N1 line. I had it 
hooked up to my PC without problem (admittedly using Windows 
HyperTerminal, shame on me). You might check if someone has changed the 
serial line settings.

Frankly, I'm a bit puzzled you're having trouble booting. The stock 
kernel from CD's worked without a hitch for me. Have you got any 
non-standard hardware in it? Extra Scsi stuff, network cards, etc..?

Regards

Adam Parrish wrote:

> Marnix,
> 
> I assume that installing over the serial console is the best way since I
> have no special hardware for them. I have a null modem cable connected
> to my laptop with minicom right now and I am trying to get it to
> initialize that terminal now. 
> 
> The 32 bit kernel barfs on me when it boots with the HPMC error. Is
> there anything special I have to set my Console line to in the PALO
> bootloader to use the serial connection, or in the Configuration utility
> before I boot?
> 
> Cheers,
> Adam
> 
> On Thu, 2004-03-18 at 17:16, Marnix van den Berg wrote:
> 
>>Hello,
>>
>>Have you tried booting the standard 32 bit kernel? There isn't really a
>>reason to use the 64 bit kernel unless of course you're one of those
>>lucky people with more than 4gb of memory  I myself have a C3000 and
>>Debian installed on it without a problem. I can't use the framebuffer
>>since it's a FX4. I take it you'll be using the serial console? Or did
>>you fit them all with Vis-EG cards?
>>
>>Regards,
>>
>>Marnix van den Berg
>>
>>Adam Parrish wrote:
>>
>>
>>>Good Day,
>>>
>>>I am attempting to load Debian on a good many of our C3000 Visualize
>>>workstation per user request. Unfortunately I am stumbling upon a
>>>"Common Error" while booting. 
>>>
>>>When booting without altering any of the boot options from the pdl I get
>>>a High Priority Machine Check error:
>>>
>>>(HPMC): Code=1 regs=102F3080 (ADDR = 00000000) 
>>>
>>>When using the 64 bit version by editing line 0 to have vmlinuz64 on it
>>>so that it boots the 64 bit kernel I get the error that I need to switch
>>>the console. 
>>>
>>>I have tried multiple consoles but am unable to get it to show me the
>>>linux interactive boot screen. The LCD on the front of my computer leads
>>>me to believe that the kernel booted though since it says Linux 2.4.17. 
>>>
>>>I have skimmed the Mailing List and I apologize if this is a repeat,
>>>although none of the messages I read reflected my problem or the
>>>solution. 
>>>
>>>Any help or suggestion in debugging this problem would be greatly
>>>appreciated. 
>>>
>>>Thanks and Regards,
>>
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
