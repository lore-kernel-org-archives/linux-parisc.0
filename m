From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Fri, 20 Apr 2018 11:24:26 +0200
Message-ID: <20180420112426.3c8be653@wim.jer>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
	<6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
	<dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
	<16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
	<9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
	<de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
	<f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
	<103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org, linux-parisc
 <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
Resent-Message-ID: <dlKQxCNoJlP.A.FYF.zXb2aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180420112426.3c8be653@wim.jer

On Thu, 19 Apr 2018 21:29:45 +0200
Frank Scheiner <frank.scheiner@web.de> wrote:

> Afterwards I found some older notes about this machine which mention
> no issues during diskless operation with the very same configuration 
> (kernel and possibly also userland), which made me wonder, if there's 
> maybe an issue between the machine's built-in NIC and my used 1000
> Mbit network switch. And indeed, when connecting another 100 Mbit
> network switch in between the 712/80 and the 1000 Mbit network switch
> the issue seemed to be gone and the machine stayed accessible .
> 
> But later this week I retried the 712/80 with the current Linux
> kernel (4.15.x) and Debian userland and the issue hit me again,
> although much later and despite the 100 Mbit network switch in
> between. Looking at it I could see that the collision indicator was
> active on the switch for the port used by the 712/80. I then
> configured a singular port of the 1000 Mbit network switch to 10 Mbit
> full duplex and attached the 712/80 to it. And then the issue again
> seemed to be gone. But trying to install a package or updating the
> package cache again quickly triggered it.

You could try setting the internal NIC to half-duplex, or perhaps use a
(passive) 10BASE-T hub instead of a switch if you cannot configure that
internally, on the kernel command line, or doing it in userland is too
late.


Kind regards,
     jer
