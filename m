From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 22:12:50 +0000
Message-ID: <4217B9E2.4040804@tiscali.be>
References: <200502191234.30310.deller@gmx.de>	<20050219164007.GC455@parcelfarce.linux.theplanet.co.uk>
	<20050219165314.GD455@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050219165314.GD455@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

Here isthe lot of messages I got when stressing sdc on narrow se connection of my c110 (this disk is an older model then mentioned 
in previous test).
using following stress test just being:
# tar cslp linux-2.6.11-rc4-pa1-050219 | tar -C /chroot/Develop -xslp
# tar -cslpf /chroot/Develop/linux-2.6.11-rc4-pa1-050219.tar linux-2.6.11-rc4-pa1-050219
# tar -cslpf /chroot/Develop/linux-2.6.11-rc4-pa1-050219.tar2  linux-2.6.11-rc4-pa1-050219
nearly simultanious in 3 different shells ;-)

I got lot of messages as follow:
scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG N
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48520, cmnd 2ff081c0
  failing command because of reset, slot 2ff4864c, cmnd 2ff08a00
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x3: 03 00 00 00 60 00
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48520, cmnd 2ff08320
  failing command because of reset, slot 2ff4864c, cmnd 2ff088a0
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff08320
  failing command because of reset, slot 2ff488a4, cmnd 2ff088a0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff08320
  failing command because of reset, slot 2ff488a4, cmnd 2ff088a0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff088a0
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff08320
  failing command because of reset, slot 2ff488a4, cmnd 2ff088a0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff48520, cmnd 2ff081c0
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff08320
  failing command because of reset, slot 2ff488a4, cmnd 2ff088a0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff4864c, dsp 001d8]
  failing command because of reset, slot 2ff4864c, cmnd 2ff08060
  failing command because of reset, slot 2ff48778, cmnd 2ff08320
  failing command because of reset, slot 2ff488a4, cmnd 2ff088a0
scsi1: (4:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f af 46
scsi1: Bus Reset detected, executing command 2ff08060, slot 2ff48778, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08060
  failing command because of reset, slot 2ff488a4, cmnd 2ff081c0
scsi1 (4:0) broken device is looping in contingent allegiance: ignoring
scsi1 (4:0) New error handler wants to abort command
         scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f b7 46 00 04 00 00
scsi1 (4:0) New error handler wants to abort command
         scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f b3 46 00 04 00 00
scsi1 (4:0) New error handler wants to abort command
         scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f bc d6 00 04 00 00
scsi1 (4:0) New error handler wants device reset
         scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f b7 46 00 04 00 00
scsi1 (4:0) New error handler wants BUS reset, cmd 2ff081c0
         scsi1 : destination target 4, lun 0
         command: cdb[0]=0x2a: 2a 00 00 5f b7 46 00 04 00 00
scsi1: Bus Reset detected, executing command 2ff08320, slot 2ff488a4, dsp 001d8]
  failing command because of reset, slot 2ff48778, cmnd 2ff08480
  failing command because of reset, slot 2ff488a4, cmnd 2ff08320
end_request: I/O error, dev sdc, sector 6270790
Buffer I/O error on device sdc9, logical block 144776
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144777
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144778
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144779
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144780
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144781
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144782
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144783
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144784
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 144785
lost page write due to I/O error on sdc9
  target1:0:4: Beginning Domain Validation
scsi1: (4:0) Asynchronous
  target1:0:4: Domain Validation skipping write tests
scsi1: (4:0) Synchronous at offset 8, period 100ns
  target1:0:4: Ending Domain Validation
end_request: I/O error, dev sdc, sector 6624510
printk: 118 messages suppressed.
Buffer I/O error on device sdc9, logical block 188991
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188992
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188993
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188994
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188995
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188996
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 188997
lost page write due to I/O error on sdc9
end_request: I/O error, dev sdc, sector 7236926
printk: 121 messages suppressed.
Buffer I/O error on device sdc9, logical block 265543
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 265544
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 265545
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 265546
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 265547
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 265548
lost page write due to I/O error on sdc9

> 
> 
> Here's the patch I'm compiling now ...
> 
> --- drivers/scsi/lasi700.c      10 Dec 2004 20:46:33 -0000      1.10
> +++ drivers/scsi/lasi700.c      19 Feb 2005 16:47:11 -0000
> @@ -112,7 +112,7 @@ lasi700_probe(struct parisc_device *dev)
>  
>         hostdata->dev = &dev->dev;
>         dma_set_mask(&dev->dev, 0xffffffffUL);
> -       hostdata->base = base;
> +       hostdata->base = ioremap(base, 0x100);
>         hostdata->differential = 0;
>  
>         if (dev->id.sversion == LASI_700_SVERSION) {
> @@ -138,6 +138,7 @@ lasi700_probe(struct parisc_device *dev)
>         return 0;
>  
>   out_kfree:
> +       iounmap(hostdata->base);
>         kfree(hostdata);
>         return -ENODEV;
>  }
> @@ -152,6 +153,7 @@ lasi700_driver_remove(struct parisc_devi
>         scsi_remove_host(host);
>         NCR_700_release(host);
>         free_irq(host->irq, host);
> +       iounmap(hostdata->base);
>         kfree(hostdata);
>  
>         return 0;
> 
This patch applied I got only:
end_request: I/O error, dev sdc, sector 5303534
Buffer I/O error on device sdc9, logical block 23869
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23870
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23871
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23872
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23873
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23874
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23875
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23876
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23877
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 23878
lost page write due to I/O error on sdc9
scsi1: (4:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
scsi1: Bus Reset detected, executing command 2ff08320, slot 2ff4864c, dsp 001d81e8[01e8]
  failing command because of reset, slot 2ff48520, cmnd 2ff08740
  failing command because of reset, slot 2ff4864c, cmnd 2ff08320
  failing command because of reset, slot 2ff48778, cmnd 2ff088a0
  failing command because of reset, slot 2ff488a4, cmnd 23af1e80
end_request: I/O error, dev sdc, sector 6147910
printk: 118 messages suppressed.
Buffer I/O error on device sdc9, logical block 129416
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129417
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129418
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129419
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129420
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129421
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129422
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129423
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129424
lost page write due to I/O error on sdc9
Buffer I/O error on device sdc9, logical block 129425
lost page write due to I/O error on sdc9

That said it seems to be a c110 pb because as reported in 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2005-February/025853.html>

The same test on b180 with same 53c710 driver doesn't encounter any pb :-)

I can so eliminate disk pb ;-)
But how may I check if it's hw pb in the 53c710 ctrlr? (hp ode expert tools are only for hp engineer)

hth,
	joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
