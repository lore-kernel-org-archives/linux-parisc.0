Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (mail.goquest.com [63.172.73.8])
	by dsl2.external.hp.com (Postfix) with SMTP id B55274830
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 17:11:14 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: Stacy Olivas <olivas@eurisko.ws>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Getting a 750 to boot
Date: Sat, 25 May 2002 18:10:24 -0500
References: <20020525195423.BE4A636F9@sitemail.everyone.net>
In-Reply-To: <20020525195423.BE4A636F9@sitemail.everyone.net>
MIME-Version: 1.0
Message-Id: <02052518102400.00752@localhost.localdomain>
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

Hi folks,
I also have an old box and no network available.
What I have done in the past...
Taking a tip from the very, very old days of pa-risc...
was use a 100mb, external, scsi interface, removable media disk drive...
(Some of us network poor folks also don't have CD burners)
Plug it into i386 box, copy <whatever> to it, plug it into back of hppa box...

Mike


On Saturday 25 May 2002 02:54 pm, Stacy Olivas wrote:
> Hello,
> I recently acquired an Apollo 9000/750 system and would like to load up
> PALINUX on it.  Unfortunately, I do not have anything other than the system
> (with a serial console).  No documentation, etc.
>
> When I boot the system up it has the following:
>
> (c) Copyright.  Hewlett-Packard Company.  1991.
> All rights reserved
>
> PDC ROM rev. 1.2
> IODC ROM rev. 1.0
> 128 MB of memory configured and tested.
>
>
> Selecting a system to boot.
>
> Hard booted.
>
> ISL Revision A.00.38 OCT 26, 1994
>
> ISL booting  hpux
> Exec failed: Cannot find /stand/vmunix or /vmunix.
>
> ISL>
>
> I've attempted to hookup a SCSI cd-rom drive to the system, and it briefly
> looks at it before going to the screen above.
>
> How can I get this beast to boot?  It has 2 HD's in it and a tape
> backup/floppy unit on it as well.  It also has a network card in it, (a TPT
> 92 series 802.3 10BASE-T Transciever with Lanview hooked into the AUI port
> on the back).
>
> Any help will be greatly appreciated.
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
