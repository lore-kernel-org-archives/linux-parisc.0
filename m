Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 1A67F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jun 2003 11:54:39 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1056995678.3f00795e49bf5@clients.latnet.lv>
Date: Mon, 30 Jun 2003 20:54:38 +0300 (EEST)
From: Dub <dub@latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] modprobe: Can't locate module char-major-60 (server hangs!)
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

Hi,

I have just installed my first Debian server  3.0r1 on HP PA-RISC K210
(palinux-2.4.20).
I made installatiion using console device /dev/ttyB0.

After reboot I got the message, and the system became frozen.

Jun 27 15:08:47 smsmail4 modprobe: modprobe: Can't locate module char-major-60
Jun 27 15:08:49 smsmail4 last message repeated 9 times
Jun 27 15:08:49 smsmail4 init: Id "T0" respawning too fast: disabled for 5
minut

Everything is working in single-user mode (/sbin/sulogin starts just fine from
/etc/inittab)

Getty for ttyB0 gives the same error.

bash-2.05a# /sbin/getty -L ttyB0 9600 vt100
modprobe: modprobe: Can't locate module char-major-60

I tried to change devices or even to comment getty out from /etc/inittab, but
the server still hangs.

I suspect something could be fixed in /etc/modules.conf

It's still unclear for me what is the meaning of message
modprobe: Can't locate module char-major-60
from OS point of view.

Many thanks in advance for your help!

BR,
Dub
