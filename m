Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD8344829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 06:54:56 -0600 (MDT)
Date: Tue, 24 Sep 2002 14:54:53 +0200
Message-ID: <3D8F0114000004FF@ocpmta2.be.tiscali.com>
In-Reply-To: <OF52713812.E62609E7-ONC1256C3E.0044B75D@diamond.philips.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Help wanted: XF86Config (B2600)
To: joachim.weller@philips.com, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hey Joachim,

Have first a look with dmesg.

For my b2k a get unfortunately:
...
STI device: HPA4982A
stifb: Unsupported gfx card id 0x35acda16
...

Joel

>-- Original Message --
>From: joachim.weller@philips.com
>To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] Help wanted: XF86Config (B2600)
>Date: Tue, 24 Sep 2002 14:40:33 +0200
>
>
>Hi,
>
>since yesterday, I have up and running a B2600 with Debian woody 3.0,
>but I can't setup  X11 Configuration for the built in PCI Grafic card,
>using framebuffer driver.
>
>The error message in  /etc/XFree86.0.log (XFree86 Version 4.1.0.1) 
>says:
>(EE) No devices detected.
>
>although I have put in /etc/X11/XF86Config:
>
>Section "Device"
>        BoardName       "hp-3D"
>        Identifier      "Device[0]"
>        BusID           "1:3:0" 
>        Driver          "fbdev"
>        Option          "UseFBDev"              "true"
>        Screen          0
>EndSection
>
>The BusID was determined by  "cat /proc/pci" :
>  Bus  1, device   3, function  0:
>    3D controller: PCI device 103c:108b (Hewlett-Packard Company) (rev 5).
>      IRQ 258.
>      Master Capable.  Latency=255.
>      Prefetchable 64 bit memory at 0xfffffffffb000000 
>[0xfffffffffbffffff].
>      Non-prefetchable 64 bit memory at 0xfffffffffa000000 
>[0xfffffffffaffffff].
>
>If anybody has the same grafic card running, I would very much appreciate
>to get a working XF86Config or any tips to resolve that problem.
>
>Regards,
>       Joachim
>
>Joachim Weller
>
>Philips Medizin Systeme Boeblingen GmbH
>Cardiac and Monitoring Systems (CMS) /New Product Engineering 
>Phone: {+49|0}-7031-463-1891
>Fax:   {+49|0}-7031-463-2112
>________________________________________________________________________________
>Gesch?ftsf?hrer: Dr. Werner Haas, David Russell, Wolfgang Strenzl 
>(Sprecher)
>Sitz der Gesellschaft: B?blingen Registergericht B?blingen Reg.-Nr. HRB

>5187 
>Hewlett-Packard Str. 2, D 71034 Boeblingen      -GERMANY-
