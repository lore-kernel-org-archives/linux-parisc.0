Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72E99482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 08:00:37 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C7364B007; Sun,  3 Jun 2001 14:57:16 +0100 (BST)
Date: Sun, 3 Jun 2001 14:57:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
Message-ID: <20010603145716.J25745@linuxcare.com>
References: <Pine.LNX.4.21.0106030831300.10748-100000@oliver.internal.sjdjweis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106030831300.10748-100000@oliver.internal.sjdjweis.com>; from djweis@sjdjweis.com on Sun, Jun 03, 2001 at 08:33:23AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> 
> I've got a D310 with a 100mhz processor and 128 megs of RAM. I tried to
> boot the ISO version 0.9 last night, but it crashed on boot. I can get the
> exact error messages, it looked like a register dump. 
> 
> Is there any reason to assume that this will or won't boot?

Listed as untested on http://parisc-linux.org/release-0.9/systems.html
Are you trying the serial or sti image?  If you can use serial, and
get you terminal emulator to capture the boot messages and crash for us,
that would help.

Thanks,
  Richard
