From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Call for Testing
Date: Mon, 28 Mar 2005 17:21:36 +0000
Message-ID: <42483D20.1080104__22156.428153585$1416623728$gmane$org@tiscali.be>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
	<424817E2.10705@tiscali.be>
	<20050328152413.GB24913@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050328152413.GB24913@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Kyle McMartin wrote:
> On Mon, Mar 28, 2005 at 02:42:42PM +0000, Joel Soete wrote:
> 
...
> 
> 
> That's very strange, I'll look into it. It might be caused by the zalon
> module not being loaded. See below.
>  
> 
>>TCP: Hash tables configured (established 131072 bind 65536)
>>Root-NFS: No NFS server available, giving up.
>>VFS: Unable to mount root fs via NFS, trying floppy.
>>VFS: Cannot open root device "md2" or unknown-block(2,0)
>>Please append a correct "root=" boot option
>>Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)
>>
>>well my custom config is CONFIG_SCSI_ZALON=y while your CONFIG_SCSI_ZALON=m 
>>so should be loaded?
>>
> 
> 
> Mmm. Yeah, you need the initrd, as that will contain the zalon module.
> 
> Could you add "zalon7xx" to /etc/mkinitrd/modules and regenerate the
> initrd either by reinstalling the kernel image or with a command like
> 
> 	# mkinitrd -o /boot/initrd.img-2.6.8-2-32 2.6.8-2-32
> 
That nake the trick ;-) :


          _sudZUZ#Z#XZo=_         DDDD   EEEEEE BBBB   IIIIII  AAAA   NN   NN
       _jmZZ2!!~---~!!X##wa       DD DD  EE     BB BB    II   AA  AA  NNN  NN
    .<wdP~~            -!YZL,     DD  DD EEEEE  BBBBB    II   AAAAAA  NNNN NN
   .mX2'       _%aaa__     XZ[.   DD DD  EE     BB  BB   II   AA  AA  NN NNNN
   oZ[      _jdXY!~?S#wa   ]Xb;   DDDD   EEEEEE BBBBB  IIIIII AA  AA  NN   NN
  _#e'     .]X2(     ~Xw|  )XXc
.2Z`      ]X[.       xY|  ]oZ(   Linux Version 2.6.8-2-32
.2#;      )3k;     _s!~   jXf`   Compiled #1 Sun Mar 27 06:04:08 EST 2005
  1Z>      -]Xb/    ~    __#2(    One 120MHz PA-RISC Raven 120 T' Processor, 512M
  -Zo;       +!4ZwaaaauZZXY'      119.60 Bogomips Total
   *#[,        ~-?!!!!!!-~        hpalin
    XUb;.
     )YXL,,
       +3#bc,
         -)SSL,,
            ~~~~~
Updating the linuxlogo... linuxlogo.

Debian GNU/Linux 3.1 hpalin ttyS0

hpalin login: root
Password:
Last login: Mon Mar 28 18:30:13 2005 on ttyS0
Linux hpalin 2.6.8-2-32 #1 Sun Mar 27 06:04:08 EST 2005 parisc GNU/Linux

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
No mail.
root@hpalin:~# uname -a
Linux hpalin 2.6.8-2-32 #1 Sun Mar 27 06:04:08 EST 2005 parisc GNU/Linux

Cool :-)

just still have a small trouble with (builtin) nic:
...
Configuring network interfaces...SIOCSIFADDR: No such device
eth0: ERROR while getting interface flags: No such device
SIOCSIFNETMASK: No such device
SIOCSIFBRDADDR: No such device
eth0: ERROR while getting interface flags: No such device
eth0: ERROR while getting interface flags: No such device
Failed to bring up eth0.
done.
...

but no more time today :-(

> This may not be the exact line you need, I'm sorry I don't have time
> to look what it precisely is.
> 
np this was the right one :-)

> Thanks for testing!
> 
Welcome,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
