Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (unknown [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F0A6482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 11:14:36 -0600 (MDT)
Message-ID: <3D21DFDD.9090002@freebel.net>
Date: Tue, 02 Jul 2002 17:16:13 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Alex Green <alexdgreen@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on C3600
References: <OE62b63Kbc9oLfgzBsc00001390@hotmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

Hi Alex,

Alex Green wrote:
> Hi,
>  
> I have an a problem running the latest netinstall iso on my C3600, when 
> I boot from the CD with the 32bit kernel, I get some screen corruption 
> and then the first installer screen appears but I have no keyboard 
> response.  And if I boot from the 64bit kernel I, the installer starts 
> on the serial interface, however when I attach a serial console the 
> screen doesn't output correctly.

If it is a hp terminal, you can change the emulation. It depends of the 
terminal type but you can have a look in your user guide or test (but I 
think that would request severall reboot) the emulation nearest vt100 IIRC.

Once you have found the right emulation, try first the more stable 
32-bits kernel (IIRC if you unplug ps/2 or usb mouse and keyboard, the 
kernel will switch to serial console on port 1).

> The C3600 installed with a FXE5 and 
> 512Mb RAM, the SCSI disk that will be used is on the internal interface.
>  

Dono if it is already supported (have a look a 
http://hwdb.parisc-linux.org/: I see that some one has already reach to 
install parisc-linux successfully)

Good luck,
     Joel
