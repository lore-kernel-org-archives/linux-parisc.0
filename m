Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jpnsmtp6.jpn.hp.com (jpnrel6.hp.com [128.88.255.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C57B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 18:16:03 -0700 (MST)
Message-ID: <3E387CAE.6060408@wwarc1.atl.hp.com>
Date: Thu, 30 Jan 2003 10:15:26 +0900
From: Keith Hopkins <kxh3@wwarc1.atl.hp.com>
MIME-Version: 1.0
To: "Mehta, Miten" <mmehta@elgin.edu>
Cc: "'Helge Deller'" <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: X windows setup on C110 with woody and kernel-2.4.20pa22
References: <5D69EA3878E6D411B43C00508BFD7283049FB550@exchange2.elgin.edu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Mehta, Miten wrote:
> Hey,
> 
> I tried it again and find here xfree log.  I was advised to take X window
> setup to debian-hppa so I did not post to parisc list.  Also find
> XF86Config-4.  
> 
> Actually what I just did I had done that in very first attempt ;-).  Thibaut
> VARENE pointed out some thing which I have not tried to use /dev/psaux in
> place of /dev/input/mice.  Just shall wait for your reponse.
> 
> thanks.
> 
> Miten.
> 
> 
> 
> -----Original Message-----
> From: Helge Deller [mailto:deller@gmx.de]
> Sent: Wednesday, January 29, 2003 1:57 PM
> To: Mehta, Miten
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: X windows setup on C110 with woody and kernel-2.4.20pa22
> 
> 
> Hi Miten,
> 
> Please don't remove parisc-linux@lists.parisc-linux.org from the receivers
> in the future.
> 
>>From your dmesg this is the important part:
> 
> STI GSC/PCI graphics driver version 0.9
> STI byte mode ROM at f4000000, hpa at f4000000
> STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
> STI device: HPA4071B
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf4100000
> 
> So, if you change the in SubSection "Display" the Depth to 32 it should
> work:
> Example:
>     SubSection "Display"
>                 Depth           32               # 8, 16, 24 or 32 (acording
> to "fbset -i")
>                 Modes           "1280x1024"     # "1024x768" or "1280x1024"
>         EndSubSection
> 
> You don't seem to have HIL, but IIRC the ps/2 driver uses the same
> /dev/input/mice 
> interface.
> 
> Regards,
> Helge
> 
>

Hi Miten,

   Your log now complains there is no Depth 24 section.  So, I suggest to ADD that section just above/below the Depth 32 section.

Example:

Section "Screen"
	Identifier	"Default Screen"
	Device		"Generic Video Card"
	Monitor		"Generic Monitor"
	SubSection "Display"
		Depth		24		# 8, 16, 24 or 32
		Modes		"1280x1024"	# "1024x768" or "1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		32		# 8, 16, 24 or 32
		Modes		"1280x1024"	# "1024x768" or "1280x1024"
	EndSubSection
EndSection

--
Best Regards,
   Keith
