Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5814482A
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 06:13:01 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 09E28B00C; Tue,  7 Aug 2001 13:14:19 +0100 (BST)
Date: Tue, 7 Aug 2001 13:14:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem
Message-ID: <20010807131419.B1011@linuxcare.com>
References: <3B6F986D.FA89E147@esiee.fr> <20010807115817.A1011@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010807115817.A1011@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 07, 2001 at 11:58:17AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 07, 2001 at 11:58:17AM +0100, Richard Hirst wrote:
> Anyway, I'm about to try it on a couple of machines here; I'll let you
> know how it goes.

HP US keyboard on B180.  Worked until I unplugged and replugged the
keyboard.  Keyboard was dead after that, but machine still responded
to pings.

Compaq UK keyboard on B180.  Worked initially, except pressing '\' (to
the left of Z) gave "unrecognised scancode (7f) ignored".  I then pressed
CapsLock, and the machine hung, not even responding to pings.

Went back to the HP keyboard, and CapsLock hangs the machine there also.

Richard
