Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82EB6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:03:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Zyor-0007Jq-00; Thu, 23 Aug 2001 19:03:05 +0100
Date: Thu, 23 Aug 2001 19:03:05 +0100
From: Matthew Wilcox <willy@debian.org>
To: Christian Knoch <ChristianK@datco.com.ar>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HELP ME PLEASE - d220 Install problem
Message-ID: <20010823190305.A27374@parcelfarce.linux.theplanet.co.uk>
References: <92AD79D83589314D821A57429B49E54A479CE8@w2kexchange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <92AD79D83589314D821A57429B49E54A479CE8@w2kexchange>; from ChristianK@datco.com.ar on Thu, Aug 23, 2001 at 02:48:39PM -0300
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 23, 2001 at 02:48:39PM -0300, Christian Knoch wrote:
> the console return this mensage when boot from p1
> 
> cannot find ENTRY_TEST
> failed to initialize
> ENTRY_INIT
> status = -4

that means it can't find the `boot block' on the CD.

-- 
Revolutions do not require corporate support.
