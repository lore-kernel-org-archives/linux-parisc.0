From: Frank Scheiner <frank.scheiner@web.de>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sun, 22 Apr 2018 21:17:11 +0200
Message-ID: <2b4b37c1-b719-8ece-2de3-33075450e6da@web.de>
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
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20180420112426.3c8be653@wim.jer>
Resent-Message-ID: <_zgIW75MTXE.A.8NB.O_N3aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/2b4b37c1-b719-8ece-2de3-33075450e6da@web.de

On 04/20/2018 11:24 AM, Jeroen Roovers wrote:
> You could try setting the internal NIC to half-duplex, or perhaps use a
> (passive) 10BASE-T hub instead of a switch if you cannot configure that
> internally, on the kernel command line, or doing it in userland is too
> late.

I actually had the port configured to half-duplex at first. But I was 
distracted by the high number of collisions taking place and so changed 
it to full-duplex.

Cheers,
Frank
