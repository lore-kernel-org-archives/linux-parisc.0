From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE &
	Implement SNDCTL_DSP_CHANNELS
Date: Mon, 24 May 2004 19:30:01 +0200
Message-ID: <40B23119.2020203@hrzpub.tu-darmstadt.de>
References: <20040222092057.GA2590@calypso>
	<20040223035601.GA988@calypso>	<20040511052451.GC27478@colo.lackof.org>
	<20040523234200.GA1893@calypso>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Stuart Brady <sdbrady@ntlworld.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040523234200.GA1893@calypso>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

Stuart Brady schrieb:

>>In 2.6, ALSA harmony driver does NOT compile and that's disappointing.
>>    
>>
as I (and others) wrote in a former mail ALSA harmony driver from ALSA 
cvs does compile. Just copy harmony.c from ALSA cvs into kernel source, 
fix two typos (haromny -> harmony) and voilà... Boot log shows:

    Advanced Linux Sound Architecture Driver Version 1.0.4.
    Lasi Harmony Audio driver h/w id 20, rev. 18 at 0xf0104000, IRQ 82
    harmony: Successfully registered harmony pcm backend & mixer 0
    ALSA device list:
      #0: ALSA driver for LASI Harmony at h/w, id 20, rev. 18 hpa
    0xf0104000, IRQ 82

There is just one problem ;). One can't unmute  main volume. I can 
change volume settings using aumix, but they get canceled when closing 
aumix. But perhaps this can be fixed easily by s.o. who has the force... ;)

>
>I would love to try and help with the 2.6 drivers instead.
>Unfortunatlely, I can't get 2.6 to boot.  This is all that I see:
>
>Command line for kernel: 'root=/dev/sda6 HOME=/ console=tty0 sti=1
>sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux-2.6'
>Selected kernel: /vmlinux-2.6 from partition 2
>ELF32 executable
>Entry 001001c0 first 00100000 n 3
>Segment 0 load 00100000 size 2520296 mediaptr 0x1000
>Segment 1 load 00368000 size 565504 mediaptr 0x269000
>Segment 2 load 003f4000 size 581766 mediaptr 0x2f4000
>Branching to kernel entry point 0x001001c0.  If this is the last
>message you see, you may need to switch your console.  This is
>a common symptom -- search the FAQ and mailing list at parisc-linux.org
>  
>
I also have an 715/100 with two graphics card and I'm using current cvs 
kernel (2.6.7-rc1-pa1). It works for me. My command line for the kernel is:
'root=/dev/sdb4 HOME=/ console=tty0 sti=1 sti_font=VGA8x16 TERM=linux 
palo_kernel=2/vmlinux'. I can also give you my .config if you are 
interested in.

>I have another graphics card in this machine, so I'm wondering whether
>that has anything to do with this.  FWIW, it's a 715/100.  I'm using the
>prebuilt palinux-32-2.6.6-pa4_0-2_all.deb package from
>http://cvs.parisc-linux.org/download/linux-2.6/
>
>Thanks,
>  
>
Thanks,
Ruediger
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
