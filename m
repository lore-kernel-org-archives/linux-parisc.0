Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4EF96482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Apr 2001 16:01:36 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id B2D239DD
	for <parisc-linux@parisc-linux.org>; Thu, 12 Apr 2001 18:01:35 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 759E537E95
	for <parisc-linux@parisc-linux.org>; Thu, 12 Apr 2001 16:04:17 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Apr 2001 16:04:17 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010412220417.759E537E95@carmen.fc.hp.com>
Subject: [parisc-linux] lcd driver broken on C3K
List-ID: <linux-parisc.vger.kernel.org>

After updating the kernel on my C3000 today it now hangs on boot at,

led_init: chassis info: model=0 (LCD), lcd_width=16, cmd_delay=40, actcnt=32, 
m2led_init: min_cmd_delay = 40 uS
LCD display at f0190000,f0190001 registered
Searching for devices...


I turned off CONFIG_CHASSIS_LCD_LED in my config and then it boots fine.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
