Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from exchange2.elgin.cc.il.us (exchange2.elgin.edu [66.158.60.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD6A8482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 09:53:33 -0700 (MST)
Message-ID: <5D69EA3878E6D411B43C00508BFD7283049FB555@exchange2.elgin.edu>
From: "Mehta, Miten" <mmehta@elgin.edu>
To: 'Keith Hopkins' <kxh3@wwarc1.atl.hp.com>,
	"Mehta, Miten" <mmehta@elgin.edu>
Cc: 'Helge Deller' <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] RE: X windows setup on C110 with woody and ker
	nel-2.4.20pa22
Date: Thu, 30 Jan 2003 10:50:06 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2C87F.A4580970"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C2C87F.A4580970
Content-Type: text/plain;
	charset="iso-8859-1"

Hello,

I have got startx command working and giving me KDE.  Please find attached
necessary files.

In short I added DefaultFbBpp 32, mouse as /dev/psaux.

Thanks for help.

Miten.



-----Original Message-----
From: Keith Hopkins [mailto:kxh3@wwarc1.atl.hp.com]
Sent: Wednesday, January 29, 2003 7:15 PM
To: Mehta, Miten
Cc: 'Helge Deller'; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: X windows setup on C110 with woody and
kernel-2.4.20pa22


Mehta, Miten wrote:
> Hey,
> 
> I tried it again and find here xfree log.  I was advised to take X window
> setup to debian-hppa so I did not post to parisc list.  Also find
> XF86Config-4.  
> 
> Actually what I just did I had done that in very first attempt ;-).
Thibaut
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
> fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xf4100000
> 
> So, if you change the in SubSection "Display" the Depth to 32 it should
> work:
> Example:
>     SubSection "Display"
>                 Depth           32               # 8, 16, 24 or 32
(acording
> to "fbset -i")
>                 Modes           "1280x1024"     # "1024x768" or
"1280x1024"
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

   Your log now complains there is no Depth 24 section.  So, I suggest to
ADD that section just above/below the Depth 32 section.

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


------_=_NextPart_000_01C2C87F.A4580970
Content-Type: application/octet-stream;
	name="xfree_c110.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="xfree_c110.tar.gz"

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

------_=_NextPart_000_01C2C87F.A4580970--
