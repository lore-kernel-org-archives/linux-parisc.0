Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1FDA4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 10:21:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Uu0K-0007cX-00; Mon, 19 Feb 2001 17:21:40 +0000
Date: Mon, 19 Feb 2001 17:21:40 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Florent Guiliani <fguiliani@perinfo.com>
Cc: 'Helge Deller' <deller@gmx.de>,
	'Matthew Wilcox' <matthew@wil.cx>, 'Scott Eggert' <seggert@tds.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] E25 lock-up during boot.
Message-ID: <20010219172140.J899@parcelfarce.linux.theplanet.co.uk>
References: <01021811393800.31489@P100.helgenet.de> <000c01c09a50$30250e90$6400030a@florent>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000c01c09a50$30250e90$6400030a@florent>; from fguiliani@perinfo.com on Mon, Feb 19, 2001 at 09:44:35AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 19, 2001 at 09:44:35AM +0100, Florent Guiliani wrote:
> How to replace the kernel by a newer in a bootable ISO file ?

you'll need another linux machine around for this, but:

edit /etc/exports to export /tftpboot to your PA box
mount the cd inside /tftpboot
create a symlink from the cd to the ip address of the machine
	(eg ln -s cd 192.168.2.56)
set up bootp/tftp or rbootd (depending on the age of your machine)

et voila.

-- 
Revolutions do not require corporate support.
