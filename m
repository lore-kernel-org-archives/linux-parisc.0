Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from exchange2.elgin.cc.il.us (exchange2.elgin.edu [66.158.60.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CEA7482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 08:30:34 -0700 (MST)
Message-ID: <5D69EA3878E6D411B43C00508BFD7283049FB554@exchange2.elgin.edu>
From: "Mehta, Miten" <mmehta@elgin.edu>
To: 'Keith Hopkins' <kxh3@wwarc1.atl.hp.com>,
	"Mehta, Miten" <mmehta@elgin.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] RE: X windows setup on C110 with woody and ker
	 nel-2.4.20pa22
Date: Thu, 30 Jan 2003 09:27:07 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2C874.0CE3C350"
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

------_=_NextPart_000_01C2C874.0CE3C350
Content-Type: text/plain;
	charset="iso-8859-1"

Hello Keith,

Find attached output of "dmesg | grep -e STI -e stifb".

There seems to be some progress with addition of depth 24 section following
32 one but thats just what I felt ;-).


-----Original Message-----
From: Keith Hopkins [mailto:kxh3@wwarc1.atl.hp.com]
Sent: Wednesday, January 29, 2003 9:07 PM
To: Mehta, Miten
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: X windows setup on C110 with woody and
ker nel-2.4.20pa22


Mehta, Miten wrote:
> Hello,
> 
> I still get errors for depth 24 though some what different.
> 
> take a look at xfree log attached.
> 

Please post the output of  "dmesg | grep -e STI -e stifb".

--
Best Regards,
    Keith





------_=_NextPart_000_01C2C874.0CE3C350
Content-Type: text/plain;
	name="dmesg_sti.txt"
Content-Disposition: attachment;
	filename="dmesg_sti.txt"

STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071B
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf4100000

------_=_NextPart_000_01C2C874.0CE3C350--
