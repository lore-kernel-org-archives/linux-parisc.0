Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from altern.org (altern.org [80.67.174.57])
	by dsl2.external.hp.com (Postfix) with SMTP id 948A2482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Jul 2003 07:01:04 -0600 (MDT)
Date: Wed, 30 Jul 2003 14:40:24 +0200 (CEST)
From: <dantes@altern.org>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Message-Id: <20030730130104.948A2482D@dsl2.external.hp.com>
Subject: [parisc-linux] A question about graphic cards - again...
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

Hello list,


Although I have found quite a lot of posts about graphic cards in the list archives, I still have a few points unanswered, so here they are.

I'll get tomorrow a C240 which seems to have a Visualize FX2 inside (well the guy I'm getting it from says so). From what I understood, this card is not supported by XFree. Moreover, it's got an EVC connector (sure of that, checked it myself), and the adaptator for VGA is friggin' expensive...

So I was wondering about sticking a regular (as in "from the PC world") PCI VGA card in it, to get graphics and so on. And now, ladies and gentlemen, here are the questions:


- What about firmware support? Will the machine be able to display the boot output on a non-HP PCI card? (mmm... pretty sure it won't, actually)

- What about the kernel? Do I *have* to use STIcon or STIfb on HPPA kernels, or can I use a regular console?

- I have read somewhere that quite a lot of PCI graphic cards are not properly initialised by their X drivers (relying on firmware to be run at boot time). Could people share info about which ones are working, and which ones ain't?

- Last but not least, what about HP-UX support of alien graphic cards?


OK, that's all for today. Thanks a lot in advance for your answers, and best regards!
Dantes
