Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 38650485D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 13:58:22 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Stephan Trajkoff <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] harmony driver on k210/819
Date: Wed, 10 Jul 2002 21:57:51 +0200
References: <3D2BD8BE.7060409@itp.bg>
In-Reply-To: <3D2BD8BE.7060409@itp.bg>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200207102157.51570.deller@gmx.de>
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

On Wednesday 10 July 2002 08:48, Stephan Trajkoff wrote:
> Hello, on kernel 2.4.18-pa52, i compiled harmony sound blaster
> in dmesg the sound blaster is detected
> but when I start mpg123 blahblah.mp3 the output is Illegal operation

Works for me. Have you tried updating mpg123 ?

pa64:~# dmesg | grep Harmony
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xf0104000, IRQ 82

pa64:~# uname -a
Linux pa64 2.4.18-pa53 #249 Tue Jul 9 21:27:22 CEST 2002 parisc unknown

pa64:~# dpkg -l mpg123
||/ Name                   Version                Description
+++-======================-======================-============================================================
ii  mpg123                 0.59r-8                MPEG layer 1/2/3 audio player

Greetings,
Helge
