Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2645482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jan 2002 11:01:32 -0700 (MST)
To: Sven Cronbenberg <sven.cronenberg@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Use the X-Server from HPUX und PALinux? 
In-Reply-To: Message from Sven Cronbenberg <sven.cronenberg@gmx.de>
   of "Sun, 06 Jan 2002 19:54:01 +0100." <3C389D49.7030301@gmx.de>
References: <3C388C82.6070509@web.de> <200201061918.29886.deller@gmx.de>  
 <3C389D49.7030301@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jan 2002 11:01:29 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020107180129.1581837CB8@carmen.fc.hp.com>
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

Sven Cronbenberg writes...

> On many PARISC Systems there is still no X-Windows
> support or X-Windows has to access the graphics card
> via the framebuffer device.

You are aware of the STI framebuffer driver right? You can use that to run X 
on most HP graphics cards. The HPUX Xserver could be much faster but sti-fb is 
currently better than nothing.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
