Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath.alaskatech.org (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A391485C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 10:23:35 -0700 (MST)
Date: Wed, 20 Feb 2002 08:16:33 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: "Holst, Richard G (Dick), PROSH" <dholst@att.com>
Cc: parisc users <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Parisc linux on a D machine
In-Reply-To: <28F05913385EAC43AF019413F674A0170148AC2B@OCCLUST04EVS1.ugd.att.com>
Message-ID: <Pine.LNX.4.33.0202200815060.13804-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 20 Feb 2002, Holst, Richard G (Dick), PROSH wrote:

> When I boot my D server running parisc LInuxLinux .9.3. the graphics monitor is the console. I set the hardware path for the console to the hardware address of the graphics (vga) card. I get the TUX penguin in the upper left of the monitor and all the boot message and all the rc startup messages. Just when the system is ready to give me a login prompt, the out of the console shift to my serial terminal. I would appear that I need a line in my /etc/inittab that will cause the login prompt to appear on the graphics monitor. Can someone tell me how to get the login prompt to appear on my graphics monitor instead of my serial terminal please.

I believe this is in the readme file on parisc-linux.org, and has been
since about 0.5 (it bit me also). Check the FAQ - 'boots on STI console
but no login prompt' is in there...
