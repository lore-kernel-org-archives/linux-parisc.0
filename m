Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA00976
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 12:18:30 -0700
Message-ID: <C36304FE952AD411AC87002094120338029E7B@MTMAIL>
From: Ian Zink <ian.zink@maryville.com>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Date: Tue, 14 Nov 2000 13:20:05 -0600
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] Palinux on a 712/60
List-ID: <linux-parisc.vger.kernel.org>

I have a hp 712/60 I was trying to get loaded with Pa-linux. I'm using the
0.5 version of the Pa-linux cd. If I boot right off the CD it all loads
until it gets to Switching to PDC. At that point nothing happens. From I
have read the list, that is because the kernel is switching the text
console. However, the 712s don't have consoles. From what I have also read
the CD should work if you pass the kernel the parameter console=tty. So I
tried to  "boot scsi.2.0 isl" from the boot_admin prompt. It gave me the
PALO ISL, but I could not choose which line I wanted to edit. Further, I
couldn't even type "b" to boot. I don't know if the isl is freezing or what
is taking place
	What I am wondering is there a way to boot a 712/80 without having
to get cross-compiler gcc, compile the kernel, etc. Is there someway I could
add the ramdisk-sti.tgz on the ISO to make it work? If so, what would need
to be done?

Thanks,

Ian Zink, Systems Engineer
Maryville Technologies
540 Maryville Centre, Suite 300
St. Louis, MO  63141
636/519-4182
(FAX) 636/519-4141
ian.zink@maryville.com  
www.maryville.com
