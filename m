Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 01719482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 02:43:08 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1057826587.3f0d271b5b81a@clients.latnet.lv>
Date: Thu, 10 Jul 2003 11:43:07 +0300 (EEST)
From: Mihails Nikitins <nikitins@latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] Re: How to enable LCD screen on K-class?
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

> Woody Debian on my K-class does not show info on status LCD screen after linux
> is started. How to configure this feature? LCD is working before OS is loaded,
> then everything is black.

Anyway, is it possible to get it working? I see that something is overwriting
LCD diagnostic info while loading Linux.

My Kernel is compiled with 
CONFIG_CHASSIS_LCD_LED=y

Sure you know it. :-)

BR,
Mihails
