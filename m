Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D76974829
	for <parisc-linux@parisc-linux.org>; Wed, 19 Feb 2003 01:19:51 -0700 (MST)
Date: Wed, 19 Feb 2003 09:19:49 +0100
Message-ID: <3E48441000002658@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] .config fo a N class?
To: grundler@dsl2.external.hp.com
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>Date: Mon, 17 Feb 2003 19:52:30 -0700
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: parisc-linux@parisc-linux.org
>Subject: Re: [parisc-linux] .config fo a N class?
>From: grundler@dsl2.external.hp.com (Grant Grundler)
>
>
>On Mon, Feb 17, 2003 at 06:51:01PM +0100, Joel Soete wrote:
>> >I grab the config file of the test-drive L model; apply it against current
>> >k-2.4.20-pa26 (just change 64 to 32 bits).
>>                             ^^^^^^^^^^^^^ My bad: I would have to remember
>> that hpux-11 have to be 64bits on L and N servers :?
>
>right. But L-class also only supports 64-bit.
>And you want to disable CONFIG_SMP for N-class and L3000.
>
>> Well, for now I just boot with a dpkg kernel-image-2.4.19-64 (up) and
still
>> have to see what is wrong with eth0:
>
>You were not very clear about the symptom.

Yes, sorry: my first goal was to advise that I reach to boot the N and will
go later examine this pb.

IIRC to start up this box I first unplug the NIC cable to avoid network
pb.
After that I changed the config file to restart the built-in NIC which didn't
come up? A strange thing that I noticed was that there was not hard led
lighted.

It should be because the switch disable temporarely the port after the cut
of the link? I will check further...

>And we need a slightly more accurate description
>of the kernel-image version number.
>
it is the image from kernel-image-2.4.19-64_22.2_hppa.deb

>But this might help you anyway
>| > cvs log driver/nets/tulip/media.c
>...
>| revision 1.14
>|
>| date: 2002/10/14 23:34:02;  author: grundler;  state: Exp;  lines: +13
>-13
>|
>| 2.4.19-pa22 Fix tulip phy reset/init
>| DP83840A.pdf and lxt971d.pdf both require polling
>| the reset bit (bit 15) in mdio control register to
>| determine when a reset has completed. Then the
>| "init" sequence can be sent.
>
I will check if I can still find back some sources
>
>> eth0 Digital DS21143 Tulip rev 65 at 0x80 ... irq 128
>>
>> Is there known problem with this type of NIC?
>
>yes - there was. But built-in should work. add-on cards had problems.
>
>> Next step would be to install a gcc-64 to recompile the kernel 2.4.20-pa27
>> and have a new look on this eth0.
>
>yes - good plan
>
Thanks again for your kind attention,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
