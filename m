Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta06.chello.at (viemta06.chello.at [195.34.133.56])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE6A1482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Apr 2001 05:35:32 -0600 (MDT)
Received: from dot.at ([62.178.92.247]) by viemta06.chello.at
          (InterMail vK.4.03.02.00 201-232-124 license 6aea1bd1f01aef5a9a73363c16ebee43)
          with ESMTP id <20010414080818.LOLX27182.viemta06@dot.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 14 Apr 2001 10:08:18 +0200
Sender: chris@dsl2.external.hp.com
Message-ID: <3AD80572.DB70DCD8@dot.at>
Date: Sat, 14 Apr 2001 10:08:18 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------27CEEF89CF3134258929BF29"
Subject: [parisc-linux] [Fwd: Success: My E55 (9000/856) runs bash-2.04 via PDC]
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------27CEEF89CF3134258929BF29
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mail problem ?
------------------------------------------------------------
--------------27CEEF89CF3134258929BF29
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <3AD788DB.2A4A73E2@dot.at>
Date: Sat, 14 Apr 2001 01:16:44 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
Organization: private
X-Mailer: Mozilla 4.75 [en] (X11; U; Linux 2.2.16-22 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Success: My E55 (9000/856) runs bash-2.04 via PDC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello PA-RISC community.

Again and again I want to have my E55 running Linux, but the problem
is the serial lines (8-port MDP) is a proprietary interface. So I needed
a solution. 

I had the idea to use the PDC console, months ago.
Today hacked a driver (template was serial.c) for a polling PDC device 
driver. I called it pdc_drv.c, the device is "ttyQ0", with MAJOR 30,
MINOR 0
and I use a polling period of 30ms (enough for a serial console i/f).

Because I have not further implemented the internel console i/f for my
driver, I used the hack with the link of
	/dev/console --> /dev/ttyQ0
And my machine boots up via NFS !

Perhaps we can make a "driver" out of this "hack" !

In my driver I also use the hack, I have done for the serial.c, that
with `^\' I can reboot ( machine_restart() ) the computer to work
remote on it !

With friendly regards

	Christoph P.



-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at

--------------27CEEF89CF3134258929BF29--
