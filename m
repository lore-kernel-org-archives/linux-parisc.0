Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C718482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:57:47 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 00F76B00D; Fri,  6 Jul 2001 12:57:01 +0100 (BST)
Date: Fri, 6 Jul 2001 12:57:01 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Rafael Herrera <raffo@neuronet.pitt.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.1 installation failed with and ext2-fs error
Message-ID: <20010706125701.W23509@linuxcare.com>
References: <3B4495BC.C3E7A04D@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B4495BC.C3E7A04D@neuronet.pitt.edu>; from raffo@neuronet.pitt.edu on Thu, Jul 05, 2001 at 12:28:44PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 12:28:44PM -0400, Rafael Herrera wrote:
> While installing the latest 0.9.1 on a 715/75 machine over a serial
> line, the installation halted with this error message:
> 
>  Extracting
>  /var/cache/apt/archives/tar_1.13.19-1_hppa.deb...          EXT2-fs
> error (device sd(8,3)): ext2_write_inode: unable t9
> 
> it looks truncated. I can't provide more error messages. Are there other
> virtual consoles under the installed? if so, how do you switch to them?
> I'm using minicom on an X terminal.

No virtual consoles on a serial install, sorry.

Try again, and when you get to the point of installing base, scroll
down the menu to 'execute a shell'.  Then mount the CD, something
like

mkdir /tmp/cd
mount /dev/scd0 /tmp/cd

(may already be mounted under /instmnt, do 'mount' to check)

Then run debootstrap manually:

debootstrap sid /target file:/tmp/cd

That might give more clues.

Also, check you have minicom running with line wrapping enabled,
and tell it to log to a file.  That way you can find the error
output in the log file afterwards.

Richard
