Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA17624
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Dec 1999 13:17:18 -0700
Date: Thu, 23 Dec 1999 15:19:48 -0500 (EST)
From: MaShaun Jones <mkj@mkj.cb.lucent.com>
To: Matt Taggart <taggart@rascal.fc.hp.com>
cc: Matthew Wilcox <willy@thepuffingroup.com>, bkatz@agilent.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] How to set serial console on 712 (fwd) 
In-Reply-To: <199912231931.MAA06831@rascal.fc.hp.com>
Message-ID: <Pine.BSF.4.10.9912231519330.638-100000@mkj.cb.lucent.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Is there a way to use a serial console with a 715 however?

On Thu, 23 Dec 1999, Matt Taggart wrote:

> 
> Matthew Wilcox writes...
> 
>  >On Thu, Dec 23, 1999 at 07:45:00AM -0800, Bill Katz William" wrote:
>  >> |How do I set the console on my 712 to be the serial port, not the 
> graphics
>  >> |display?
>  >> |
>  >> |Thanks
>  >> |
>  >> 
>  >> Boot to ISL and use the conspath
>  >> command to change the console back to rs232.  The command to use is:
>  >> 
>  >> serial
>  >>         conspath 2/0/4.643
>  >> graphics
>  >>         conspath 1/0/0.0
>  >
>  >This contradicts the PA-RISC Booting HOWTO:
>  >
>  >-----
>  >
>  >3.1.2.3.3. How can I change the boot console to serial on a 712?
>  >
>  >Unfortunately, you can't. Although 712s are configured for in-house HP
>  >development to use serial console, this configuration isn't supported
>  >in the field. You have to use a graphics console for 712s.
>  >
>  >-----
>  >
>  >I'd like to know if this needs to be corrected.
> 
> The above statement about serial console not being "supported" on 712 is 
> correct. That doesn't mean you can't do it. Here are the instructions,
> 
> -------------
> CONFIGURING A RS-232 CONSOLE on a 712
> 
> An RS-232 console is not a supported feature in the 712 products. For this 
> reason users cannot select the RS-232 port as a console from the BOOT_ADMIN 
> prompt.
> 
> These instructions will configure an RS-232 console with 9600 Baud, 8 data 
> bits, 1 stop bit, and no parity.
> 
> HOW-TO INSTRUCTIONS
> 
> NOTE: If the following instructions are not entered correctly, your system 
> may be left in an un-usable state. Contact support to "dagger" your system 
> in this case.
> 
>      Power up the 712 system. 
>      Press (ESCAPE) during boot to abort auto booting the system. 
>      At the BOOT_ADMIN> prompt, use the boot command and the isl keyword.
>         This will stop the boot sequence at ISL instead of booting to the 
> OS.
>      For example: 'boot scsi.6 isl' 
>      At the ISL> prompt, type 'conspath 2/0/4.0x283' 
>      At the ISL> prompt, type 'disp' and verify console path is:
>         (hex) 2/0/4.283.0.0.0.0.0 
>      If necessary re-type the conspath command above. 
>      Connect an RS-232 terminal to the system. 
>      Power cycle the system to bring it up on an RS-232 console. 
> -------------
> 
> As it indicates above, *BE VERY CAREFUL* or you can hose your system. If 
> you
> do, I have one of the "dagger" cards that can be loaned out to fix it.
> 
> -- 
> Matt Taggart
> taggart@fc.hp.com
> 
> 
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
