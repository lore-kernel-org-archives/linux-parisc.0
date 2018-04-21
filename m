From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Fri, 20 Apr 2018 20:22:08 -0400
Message-ID: <5f57a530-c9e8-0fbd-4eba-ba6995320c10@bell.net>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <20180420112426.3c8be653@wim.jer>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Jeroen Roovers <jer@gentoo.org>, Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20180420112426.3c8be653@wim.jer>
Resent-Message-ID: <9ARbxOAHc6M.A.vOC.CRo2aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/5f57a530-c9e8-0fbd-4eba-ba6995320c10@bell.net

On 2018-04-20 5:24 AM, Jeroen Roovers wrote:
>> But later this week I retried the 712/80 with the current Linux
>> kernel (4.15.x) and Debian userland and the issue hit me again,
>> although much later and despite the 100 Mbit network switch in
>> between. Looking at it I could see that the collision indicator was
>> active on the switch for the port used by the 712/80. I then
>> configured a singular port of the 1000 Mbit network switch to 10 Mbit
>> full duplex and attached the 712/80 to it. And then the issue again
>> seemed to be gone. But trying to install a package or updating the
>> package cache again quickly triggered it.
> You could try setting the internal NIC to half-duplex, or perhaps use a
> (passive) 10BASE-T hub instead of a switch if you cannot configure that
> internally, on the kernel command line, or doing it in userland is too
> late.
 From the manual, it seems the 10BASE-T port is half duplex (CSMA/CD).  
The MAU
interface is definitely half duplex and the word duplex is not mentioned 
in the manual.

The 10BASE-T port probably doesn't support auto negotiation, so you will 
need to manually
set the switch port to 10BASE-T half duplex if it doesn't automatically 
configure to this mode
when auto negotiation fails.

Some switches support a half-duplex back pressure form of flow control.

Setting the switch port is probably easier than finding a passive 10BASE 
hub.

Dave
