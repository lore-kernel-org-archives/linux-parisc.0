Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AC584829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 11:59:47 -0700 (MST)
Date: Mon, 3 Feb 2003 13:59:36 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203185936.GF1046@hadron>
References: <20030203165321.GA17807@dsl2.external.hp.com> <3E35CAE7000017DD@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E35CAE7000017DD@ocpmta7.freegates.net>
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

Joel, 
	I figured so, but thought I should note it since well I am running
	out of answers ;) 

	Here is the setup right now: I have a laptop running minicom
	connected to the J2240 through the serial port. I can see the init
	codes and tests happening through the serial console, so to answer
	your question :) yes I do boot from a serial console... 

	As far as the cdrom, it is not ide, it is scsi, and it seems to work 
	fine /dev/cdrom --> sr0. I inserted a cdrom (just to test) and
	mounted iso9660 without problems. 

	I am going to remove ide stuff from the kernel after I test with
	what grant suggested. 

	Just for the sake of documentation I will add compile logs as script
	files for the next builds. They will be on that page as I complete
	them. 

	Fun day of pancake making ahead :)

	In another life Joel Soete wrote:

> Aaron,
> 
> Just A comment on your web page 'Comments':
> warning concerning 'mathemu' code are well known annoying but armless.
> 
> I try to remove them but this broken to much original hp code :(
> 
> Now, the stupid question: do you try to boot from a serial console?
> 
> I also would like to know if you really have an ide cdrom on your J?
> 
> If yes, could you try to unplug it (pw supply and data flat cable) to reboot
> with your new kernel?
> 
> hth,
>     Joel
> 
> 
> 
> >-- Original Message --
> >To: "Aaron St. Pierre" <asp@ungod.com>
> >Cc: parisc-linux@lists.parisc-linux.org
> >Subject: Re: [parisc-linux] kernel compile
> >From: grundler@dsl2.external.hp.com (Grant Grundler)
> >Date: Mon, 3 Feb 2003 09:53:21 -0700
> >
> >
> >On Mon, Feb 03, 2003 at 01:43:28AM -0500, Aaron St. Pierre wrote:
> >> Anyway I got the the TOC information for both processors after
> >> I tried to boot my kernel. It is
> >> all on that page ( http://hadron.dyndns.org/parisc/ ) 
> >
> >IIA Offset                   = 0x00000000f0080570
> >
> >that's not a kernel address. Looks like a PDC call died. :^(
> >
> >> I also added a link to the firmware. I am running 2.0 of the firmware
> >> and according to hp the most recent is 2.1 or : 
> >> 
> >> Patch Name: /firmware_patches/hp/cpu/PF_CJ224021
> >> Description: HP 9000 Model J2240 firmware 2.1 patch
> >> Date       : 00/10/06
> >
> >hmm...I'd stick with 2.0 for now.
> >
> >> I will start popping stuff out of the kernel, although I am sure I took
> >> out all of the stuff wrt graphics. Another try for persistance sake wont
> >> hurt :) 
> >
> >You still have STI drivers enabled and CONFIG_FB enabled.
> >I'd start with those and then remove others one-by-one.
> >
> >> As far as the palo message, i only started noticing it when I went to
> >> v1.2 of palo. One thing I should note, when I set up / i made it ext3,
> >> boot is off of / and not its own fs so when i realized what i did I just
> >> changed fstab accordingly so it would mount as ext2, although that
> >> couldn't be the problem either since it is loading the debian kernels.
> >
> >/ can be ext3. Palo doesn't care since ext2/ext3 are compatible.
> >What's important is /boot/vmlinux is < 2GB on disk.
> >
> >grant
> >_______________________________________________
> >parisc-linux mailing list
> >parisc-linux@lists.parisc-linux.org
> >http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> ---------------------------------
> Vous surfez avec une ligne classique ?
> Faites des economies avec Tiscali Complete
> ... Plus d'info sur http://complete.tiscali.be
> 

-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 667:
 	The neighbor of the beast.
