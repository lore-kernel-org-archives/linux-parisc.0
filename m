From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sun, 22 Apr 2018 16:10:45 -0400
Message-ID: <24d6336b-5533-36c0-fb3e-9924fd4e3934@bell.net>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <20180420112426.3c8be653@wim.jer>
 <5f57a530-c9e8-0fbd-4eba-ba6995320c10@bell.net>
 <5902c913-93a2-bb5f-5fd6-b45bcff94158@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Frank Scheiner <frank.scheiner@web.de>, Jeroen Roovers <jer@gentoo.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <5902c913-93a2-bb5f-5fd6-b45bcff94158@web.de>
Resent-Message-ID: <R3son9R6HcE.A.BsD.YxO3aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/24d6336b-5533-36c0-fb3e-9924fd4e3934@bell.net

On 2018-04-22 3:17 PM, Frank Scheiner wrote:
> On 04/21/2018 02:22 AM, John David Anglin wrote:
>>  From the manual, it seems the 10BASE-T port is half duplex 
>> (CSMA/CD). The MAU
>> interface is definitely half duplex and the word duplex is not 
>> mentioned in the manual.
>
> I also didn't find any info about half-/full-duplex in the two manuals 
> I have at hand for the 712/80 ("Service Handbook" and "Technical 
> Reference Manual"). To be sure, which one did you consult?
I looked at the "Technical Reference".
>
>>
>> The 10BASE-T port probably doesn't support auto negotiation, so you 
>> will need to manually
>> set the switch port to 10BASE-T half duplex if it doesn't 
>> automatically configure to this mode
>> when auto negotiation fails.
>
> Did this at first but then went for full-duplex again. Today I started 
> with full-duplex and actively cooling the heatsink (now smoothed and 
> with fresh thermal grease applied) of the 712/80's processor, but that 
> didn't help alone. The issue hit me after entering the password during 
> login.
>
> Then I reconfigured half-duplex and tried again. The machine now 
> worked through the whole login and I could also do an `apt update` 
> without issues afterwards. Then I let it alone for about twenty 
> minutes and on return I did an `apt list --upgradable` which triggered 
> the issue again.
Seems like hardware problem, probably in 712.  The switch and 712 need 
to be in same mode.  If my supposition about the 712
only supporting half duplex is correct, then the switch will have to be 
in half duplex.  I think network boot and `apt update`
would be a sufficient test of the network configuration.  Without error 
messages, this is hard.
>
> :-/
>
>>
>> Some switches support a half-duplex back pressure form of flow control.
>
> I'll try that now. According to the documentation my switch can create 
> back-pressure as form of flow control.
It's possible flow control on the server port might help given that the 
712 is so slow and probably
needs half duplex.  The switch might drop packets as a result. However, 
IP usually adjusts for slow segments.

Dave
