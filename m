From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sat, 21 Apr 2018 15:12:03 -0400
Message-ID: <ece0086b-6c7f-4c61-b101-475f085ec120@bell.net>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc
 <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Helge Deller <deller@gmx.de>, Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de>
Resent-Message-ID: <FtxhIutLK6G.A.ruB.X042aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/ece0086b-6c7f-4c61-b101-475f085ec120@bell.net

On 2018-04-20 2:37 AM, Helge Deller wrote:
>> Also interesting, the kernel messages for 4.15.11, please notice the
>> time difference between "random: crng init done" and "Key type
>> asymmetric registered":
> Seems to be a generic issue.
> https://www.linuxquestions.org/questions/showthread.php?p=5803405#post5803405
>
> My assumption is, that the kernel waits until it has
> enough randomness for the various encryption algorithms.
I think this is caused by cryptomgr_test.  It can be disabled with 
"cryptomgr.notests" on command
line.

Dave
