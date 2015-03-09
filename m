From: Helge Deller <deller@gmx.de>
Subject: Re: Pre-DEBIAN 8.0 install images for HPPA architecture (debian-ports
 unstable release)
Date: Mon, 09 Mar 2015 22:27:39 +0100
Message-ID: <54FE104B.7040806@gmx.de>
References: <54ECB150.80907@gmx.de> <CAD8V-zDFCm+Aj77oXgyV=jZp+=K65YNnT7uOukTOosXeS=xGwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Harri Haataja <realblades@gmail.com>, debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAD8V-zDFCm+Aj77oXgyV=jZp+=K65YNnT7uOukTOosXeS=xGwQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.03.2015 22:11, Harri Haataja wrote:
> On 24 February 2015 at 19:13, Helge Deller <deller@gmx.de> wrote:
>> I've prepared some initial netboot installation medias for
>>          DEBIAN 8.0 on HPPA
>
> I'd like to say thank you as well. I've been intending to test debian
> on a J6700 I rescued,

J6700 works pretty fine.

>and I got to booting it after seeing this
> announcement.
>
> Only the drives in the machine have an HP-UX installation I'd like to
> preserve for now and I haven't been able to dig out my spares yet.
> I'll see if I can get around to trying the install later.

FYI, you could even e.g. add a SATA PCI card and attach SATA drives if you like.
The only important thing is, that the bootloader (PALO) and the /boot partition needs to be on a (small) SCSI disc.

Helge
