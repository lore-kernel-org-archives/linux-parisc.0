Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3394482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 05:50:57 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0329FB00C; Thu, 12 Jul 2001 12:49:32 +0100 (BST)
Date: Thu, 12 Jul 2001 12:49:32 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.92 install iso problems
Message-ID: <20010712124932.Y18375@linuxcare.com>
References: <002c01c10a40$ba3143a0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002c01c10a40$ba3143a0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Wed, Jul 11, 2001 at 03:36:05PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 11, 2001 at 03:36:05PM -0400, rpengelly wrote:
> I've downloaded and burned the 0.92 install iso but I run into trouble while retreiving packages. It can't retrieve groff and then quits because of it. Any suggestions?

Hmm, shouldn't be looking for groff.  Looks for groff-base these days.
If, for example, you were netbooting a lifimage from an older CD, but
installing from a newer CD you would see that problem.

Richard
