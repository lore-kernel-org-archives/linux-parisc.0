Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7509E4837
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 09:56:50 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LED blinking ;-(
Date: Sun, 6 Jan 2002 17:55:08 +0100
References: <Pine.BSF.4.30.0201061720380.727-100000@noc.zabbadoz.net>
In-Reply-To: <Pine.BSF.4.30.0201061720380.727-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Message-Id: <200201061755.08978.deller@gmx.de>
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

On Sunday 06 January 2002 17:33, Bjoern A. Zeeb wrote:
> Hi,

Hi Bjoern,

> had my apollo 715 updated this weekend and perhaps because the machine
> stood somewhere else I never had noticed that the LED 4 (OS running) has
> been blinking.
> Well I have no idea who is responsible for this the OS or the
> machine(firmware) but ...

AFAIK, I am.

> ... can one change this to a constant on ? - or at least not blinking
> that frequent or in a radom intervall ?

I assume you talk about the "Heartbeat LED" with which we blink in the
same frequency as a heart. That's also the behaviour under HP/UX.

You may see the actual values with:
pa64:~# cat /proc/pdc/led
Heartbeat: 1
Disk IO: 1
LAN Rx/Tx: 1

and change it with one of the following commands:
pa64:~# echo "0 1 1" > /proc/pdc/led
turns off only the heartbeat LED,
pa64:~# echo "0 0 0" > /proc/pdc/led
turns off all LEDs.

Helge
