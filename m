From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sat, 21 Apr 2018 18:36:56 -0400
Message-ID: <e6abed84-ef22-ded4-b256-eb96854ad01c@bell.net>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de>
 <ece0086b-6c7f-4c61-b101-475f085ec120@bell.net>
 <a0480809-8512-779d-e59c-c93775dc378a@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc
 <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Helge Deller <deller@gmx.de>, Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <a0480809-8512-779d-e59c-c93775dc378a@gmx.de>
Resent-Message-ID: <ydis0Amme7B.A.gKG.a072aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/e6abed84-ef22-ded4-b256-eb96854ad01c@bell.net

On 2018-04-21 6:17 PM, Helge Deller wrote:
>> It can be disabled with "cryptomgr.notests" on command line.
> Did you tested this?
Not recently.  I found this when I was working on the cache.TLB patch.  
It caused a stall in one version.
> Unless I typed it wrong it didn't worked on my B160L:
> [    0.000000] Kernel command line: root=/dev/sda5 crpytomgr.notests HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
You typed it wrong.

Dave
