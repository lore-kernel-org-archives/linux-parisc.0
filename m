Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp015.mail.yahoo.com (smtp015.mail.yahoo.com [216.136.173.59])
	by dsl2.external.hp.com (Postfix) with SMTP id 30D72482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 Jan 2002 22:47:44 -0700 (MST)
Message-ID: <3C5A2E56.2030805@yahoo.com>
Date: Fri, 01 Feb 2002 05:57:42 +0000
From: Jbit of Plasma <james_a_n_lee@yahoo.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Odd kernel error
References: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org> <20020130221939.A3166@solo.franken.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
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
If you change the drivers/video/sti/Makefile to ...
obj-$(CONFIG_STI_CONSOLE) += sticore.o sticon.o ../fbcon-sti.o
and somehow get ../fbcon-sti.o to compile, it works perfect...
Theres proberly a better way to get it compiled and linked in, but this way seems to work (even with the Advanced driver stuff enabled)
BTW: is it possible to get a 712 to display more then 8bpp? If so, is any work being done on it?

--jbit

 



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
