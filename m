Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBAC8482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Apr 2001 10:38:12 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 33528B007; Sat, 21 Apr 2001 17:37:57 +0100 (BST)
Date: Sat, 21 Apr 2001 17:37:57 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Dave Gilbert <gilbertd@treblig.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI problems on 73[05]
Message-ID: <20010421173756.N11226@linuxcare.com>
References: <Pine.LNX.4.10.10104211247000.702-100000@tardis.home.dave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10104211247000.702-100000@tardis.home.dave>; from gilbertd@treblig.org on Sat, Apr 21, 2001 at 12:54:38PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 21, 2001 at 12:54:38PM +0100, Dave Gilbert wrote:
> Hi,
>   As I mentioned in a previous mail, my first machine successfully is now
> net booting Linux/HP-PA.
> 
>   I am however having some problems with SCSI on it; I'm trying to do
> 
> dd if=/dev/zero of=/dev/sda
> 
> to clear the discs but am getting:
> 
> scsi0: Unable to abort command for target 5
> scsi0: Unable to send Bus Device Reset for target 5
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
> scsi0: dsp = 00075038 (script[0x140e]), dsps = 00075cde, target = 0
> scsi0: Failing command for ID5
> SCSI disk error : host 0 channel 0 id 5 lun 0 return code = 2
>  I/O error: dev 08:00, sector 128
>  I/O error: dev 08:00, sector 130

Please can you try booting with

	sim700=nodisc:0xff

added to the PALO command line, and let me know if it helps.

Oh, and how often/quickly does it fail?

Are you confident that scsi disks, cable and terminators are ok?
Do you get the problems with both disks?

Thanks,
  Richard
