Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA04204
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 15:30:02 -0700
Message-Id: <200011142232.OAA12353@milano.cup.hp.com>
To: Ian Zink <ian.zink@maryville.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Palinux on a 712/60 
In-reply-to: Your message of "Tue, 14 Nov 2000 13:20:05 PST."
             <C36304FE952AD411AC87002094120338029E7B@MTMAIL>
Date: Tue, 14 Nov 2000 14:32:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ian Zink wrote:
> I have a hp 712/60 I was trying to get loaded with Pa-linux. I'm using the
> 0.5 version of the Pa-linux cd. If I boot right off the CD it all loads
> until it gets to Switching to PDC. At that point nothing happens. From I
> have read the list, that is because the kernel is switching the text
> console. However, the 712s don't have consoles.

712s have consoles. They have two outputs which can be used as
console by linux. The STI consoles (VGA-like spigot) and serial.
Connect a serial cable 9600-8-n-1 and run minicom at the other end.

>  From what I have also read
> the CD should work if you pass the kernel the parameter console=tty. So I
> tried to  "boot scsi.2.0 isl" from the boot_admin prompt. It gave me the
> PALO ISL, but I could not choose which line I wanted to edit. Further, I
> couldn't even type "b" to boot. I don't know if the isl is freezing or what
> is taking place

That's a different problem...pb?

> 	What I am wondering is there a way to boot a 712/80 without having
> to get cross-compiler gcc, compile the kernel, etc.

The CD was intended to also work on the 712 even though we may not have
tested on it.

> Is there someway I could
> add the ramdisk-sti.tgz on the ISO to make it work? If so, what would need
> to be done?

no clue. anyone else?

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
