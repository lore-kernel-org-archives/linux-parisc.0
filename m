Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 028B44890
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 23:22:01 -0700 (MST)
Subject: Re: [parisc-linux] I'm using HP-UX
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: jeronimo@curtarsa.com.ar, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020315183106.5CB9E39573@carmen.fc.hp.com>
References: <000101c1cc4c$6b4a5960$190101c0@onnainty>  
	<20020315183106.5CB9E39573@carmen.fc.hp.com>
Content-Type: text/plain
Date: 15 Mar 2002 23:21:58 -0700
Message-Id: <1016259718.1305.12.camel@beavis>
Mime-Version: 1.0
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

On Fri, 2002-03-15 at 11:31, Matt Taggart wrote:
> 
> =?Windows-1252?Q?Onnainty_Jer=F3nimo?= writes...
> 
> > Tengo instalado el DTCMANAGER en un HP-UX, en el PA-Linux existe este
> > producto?
> 
> Not currently. I think this would require both support for the DTC
> devices and porting the DTCMANAGER software.

I currently user a couple of DTC 16RX for my serial console solutions.
I am not sure what you are trying to accomplish, but I configured the
DTCs using the console and put the software bits on my tftpserver that I
use to server up parisc-linux kernel images from.  This has worked
flawless for me over the last couple of years and has been an excellent
console solution for my usage.  [Note: both DTC retrieve the same bits
from my tftp server, so no custom configuration appears to be stored in
those binaries].

> Do you just want to be able to access the devices? This might be possible
> if someone wrote the right drivers.
> 
> Or do you want to use the DTCMANAGER software too? I don't think the HP
> people in charge of this product plan to port it. You could ask
> them though. One possiblity is to try and run it under PA-Linux using
> the HP-UX binary support. I suspect you'll need the yet-to-be-implemented
> signals stuff though, a bunch of HP-UX Libraries, as well as
> the hardware support mentioned above(and maybe some sort of conversion
> layer depending on how it wants to access the devices).

I do not use the DTCMANAGER software under linux ... I configured all
the ports on the DTC and when I want to add another remote console I
just plug it in and telnet to the DTC port# (I portscanned the DTC
to get the port numbers) and vola, I have the serial console to the
system.  [Note: I am not running HP-UX anywhere in my house, so this
solutions is pure i386 and parisc-linux.


Hope that help, but not sure if this is the information you are looking
for.

Thanks,

- Ryan

> Short answer: while possible, I don't think it will ever happen. Don't
> let that stop you from working on it though :)
> 
> -- 
> Matt Taggart        Linux Development Lab
> taggart@fc.hp.com   HP Linux Systems Operation
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
