Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15942
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 13:57:36 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 21:01:21 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A109CB005; Thu, 18 Jan 2001 20:52:06 +0000 (GMT)
Date: Thu, 18 Jan 2001 20:52:06 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@tylerdrive.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
Message-ID: <20010118205206.B28638@linuxcare.com>
References: <200101181517.f0IFHOs08538@openbsd1.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101181517.f0IFHOs08538@openbsd1.buttafuoco.net>; from jim@tylerdrive.org on Thu, Jan 18, 2001 at 10:17:24AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 10:17:24AM -0500, Jim Buttafuoco wrote:
> Hi,
> 
> I have been trying to get my 2 9000/710's to boot for a couple of months
> now.  Attached is the latest log file from my boot. 
> 
> The 2 problems that I see are the ramdisk is NOT seen and the BOOTP
> fails.  I have used TCPDUMP to look at the packets coming and going from
> the system.  All I see is the RBOOTP stuff.  The ramdisk is valid as far
> as I can tell. (I mounted it via the loop fs).  Should it be compressed
> with ZIP???.


> SCSI subsystem driver Revision: 1.00
> sim700: Couldn't get consistent shared memory
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
> scsi0: Revision 0x0
> Post test1, istat 05, sstat0 00, dstat 81
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x00000000

You have problems with the scsi driver also.  dstat=81 says 
"Illegal Instruction Detected", which implies the scsi chip cannot
access memory properly.  If the network chip has the same problem,
that would explain your other problems.  As you can load the kernel
ok, I guess the h/w is ok and we are not setting something up
correctly.  I have a 715/75 which uses the same scsi and network
drivers; I'll try that in a while - havn't booted it for a month
or so.

Richard
