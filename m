Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64DDD482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 03:13:16 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: hugues.henriot@tudor.lu, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 715/64 Keyboard not recognized
Date: Thu, 22 Nov 2001 11:13:12 +0100
References: <OF9594B9C0.CEA20CC1-ONC1256B0C.00322D66@kirchberg.crpht.lu>
In-Reply-To: <OF9594B9C0.CEA20CC1-ONC1256B0C.00322D66@kirchberg.crpht.lu>
MIME-Version: 1.0
Message-Id: <E166qr2-0000jb-00@linuxlab.wdf.sap-ag.de>
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

Hi Hugues,

> During the boot process, my keyboard (PS2) an the mouse (HIL)are recognised
> but when i'm under the "installation process", I have any response from my
> keyboard !
>
> RQ : My PS2 keyboard and the HIL mouse are connected on my workstation with
> a "keyboard adapter module" and this module is directly attached with on
> the station with an RJ45 Cable

Hmm, we don't have any HIL-mouse driver in pa-linux yet. Are you sure your mouse 
is really working (boot messages ???) and if it's so then I assume you have a PS/2 mouse.

Since I have a 715/64 myself I know that at least on my system the keyboard is a HIL
model (and connected to a "keyboard adapter module" too). We had and still
have some problems with keyboards after system reset, so I would askl you to only install 
only after a full power-on, not after a warm-boot. 
And for HIL keyboards you should select "cancel" in the keyboard language dialog....

Helge
