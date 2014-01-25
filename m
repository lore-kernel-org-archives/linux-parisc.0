From: Dave Land <xmechanic@landcomp.net>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 13:04:59 -0700
Message-ID: <52E418EB.9050404@landcomp.net>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>	<1417398.fmUESL4Ngr@eto>	<BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>	<7905648.nun1s37FKj@eto> <20140125181348.67a2bf8f@marga.jer-c2.orkz.net> <52E4168F.1010606@landcomp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	John David Anglin <dave.anglin@bell.net>
To: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52E4168F.1010606@landcomp.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/25/14 12:54 PM, Dave Land wrote:
> On 1/25/14 10:13 AM, Jeroen Roovers wrote:
>> On Sat, 25 Jan 2014 18:03:17 +0100
>> Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
>>
>>> Boot output looks fine. Cables are normal nullmodem. I can interact
>>> using minicom with the firmware, i.e. typing "BO
>>> PRI<return>N<return>" or things like that work fine.
>>
>> Yes, in the PDC everything still seems fine.
>>
>> But as early as in the IPL I can't paste a string without
>> characters dropping (which is how I first noticed the issue, since
>> that's where I normally do this to select a kernel to boot). So did the
>> IPL change as well, then?
>>
>>
>>
>>       jer
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-parisc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
> (I probably should have hit reply-all on this before...)
>
> Just as an FYI, I had some of the same behavior when I first set my
> J6750 up with a serial line (null modem cable to a secondary machine)
> Usually had to type the p/w 2 or 3 times to get it to 'take' in minicom.
> One thing I *did* notice was the *length* of the null modem cable and
> the proximity of the 2 machines seemed to make a difference (bad cable
> shielding maybe?) Just my 2 cents. (Running Kernel Ver. 3.12.6-2 at the
> moment)
>
> ...and like Dave A. mentioned, Xon/Xoff makes a difference too.
>
> Dave L.
>
> P.S. Now that it's up and running, and I usually log in with PUTTY or
> the STIcon graphics console, it's not a problem anymore. :-)

One other thing... If you're using the serial line, make sure you don't 
have a monitor or keyboard & mouse hooked to the target machine (I know 
the C8000's are graphics capable and most likely have usb ports for 
keyboard and mouse, the same as my J6750.) This seems to confuse the 
machine in the early setup stages, at least it did make a difference on 
mine.

Dave L.

-- 
Dave Land
Land Computer Service  xmechanic@landcomp.net
ICQ: 676030523


