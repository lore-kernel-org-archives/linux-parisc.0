Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5A639482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 12:57:32 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: "Mehta, Miten" <mmehta@elgin.edu>
Date: Wed, 29 Jan 2003 20:56:36 +0100
References: <5D69EA3878E6D411B43C00508BFD7283049FB54D@exchange2.elgin.edu>
In-Reply-To: <5D69EA3878E6D411B43C00508BFD7283049FB54D@exchange2.elgin.edu>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200301292056.36440.deller@gmx.de>
Subject: [parisc-linux] Re: X windows setup on C110 with woody and kernel-2.4.20pa22
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

Hi Miten,

Please don't remove parisc-linux@lists.parisc-linux.org from the receivers =
in the future.

=46rom your dmesg this is the important part:

STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071B
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf4100000

So, if you change the in SubSection "Display" the Depth to 32 it should wor=
k:
Example:
    SubSection "Display"
                Depth           32               # 8, 16, 24 or 32 (acordin=
g to "fbset -i")
                Modes           "1280x1024"     # "1024x768" or "1280x1024"
        EndSubSection

You don't seem to have HIL, but IIRC the ps/2 driver uses the same /dev/inp=
ut/mice=20
interface.

Regards,
Helge
