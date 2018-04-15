From: Helge Deller <deller@gmx.de>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sun, 15 Apr 2018 10:34:51 +0200
Message-ID: <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Frank Scheiner <frank.scheiner@web.de>, Dennis Clarke <dc@oetec.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
Resent-Message-ID: <jcuHKBhSbS.A.nOH.Y8w0aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de

On 14.04.2018 20:13, Frank Scheiner wrote:
> On 04/14/2018 06:11 PM, Dennis Clarke wrote:
>> Really?  Well then .. let me see what I have that is ancient in the
>>   warehouse.
>>
>> How about PA-RISC?  I happen to have some superdomes kicking about but they require truely a ton of power to operate.
> 
> I assume hppa people in Debian (debian-hppa@l.d.o in CC) would appreciate testing on such gear.
> Not sure if those superdomes will work out of the box though. 

It really would be interesting if Linux can boot on such machines.
If they don't, I'm pretty sure that I can finish the firmware support in Linux to be able to boot in a cell. For that I'd need access to such a machines via ssh (to a x86 machine for cross-compiling/tftpboot provisioning) & a serial port to the superdome.

> I know from my own testing that the following "smaller" machines work with Debian GNU/Linux Sid for hppa:
> 
> * 712/80
> * c3700, c3750, J5600, rp2470
> * c8000, rp3440
> 
> Apart from the rp3440 - and maybe also the 712/80 which showed some issue with it's built-in NIC after netbooting the Linux kernel and the OS

What kind of problems?

> - all machines also work diskless, which could speed up testing for you and avoid a manual Debian installation - although this could still be interesting.

Helge
