From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE &
	Implement SNDCTL_DSP_CHANNELS
Date: Mon, 24 May 2004 00:42:00 +0100
Message-ID: <20040523234200.GA1893@calypso>
References: <20040222092057.GA2590@calypso> <20040223035601.GA988@calypso>
	<20040511052451.GC27478@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040511052451.GC27478@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Grant,

> Sorry for taking so long with this...I was expecting someone else
> to reply and maybe missed it. A couple of minor problems with
> your patch:

Actually, I think I should have been more persistent.

> 1) it's for 2.4 and I'm personally trying to focus on 2.6 tree now.
>    2.6 is ready for prime time. It's been my desktop/ftp/http server
>    (C3600) for the past couple of monthes and has proven very stable.
> 
> 2) OSS is "decprecated" according to the 2.6 sound/Kconfig "Help".
>    Ie use ALSA instead.  See SOUND_PRIME option.
> 
> 3) if no one else wants to poke at the 2.4 harmony driver, I will
>    just apply your patches on good faith that it builds/works for you.
>    Have you tweaked it more since Feb?

I've made some improvements to the mixer code, but OSS's mixer interface
seems to be inadequate.  I can post a patch that improves the mixer code
slightly.  Other than that, I haven't changed anything.

Under high load, I tend to get panics when using the Harmony driver.
I've no idea why this is, and I wish I could understand the low-level
code a bit better.  This has nothing to do with my patches, though.
(I.e. it crashes with them and it crashes without them.)

http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022432.html
is probably more of an issue for lkml.  (There's a slight mistake in
that patch - I forgot the closing */ on line 42.)

> In 2.6, ALSA harmony driver does NOT compile and that's disappointing.

I would love to try and help with the 2.6 drivers instead.
Unfortunatlely, I can't get 2.6 to boot.  This is all that I see:

Command line for kernel: 'root=/dev/sda6 HOME=/ console=tty0 sti=1
sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux-2.6'
Selected kernel: /vmlinux-2.6 from partition 2
ELF32 executable
Entry 001001c0 first 00100000 n 3
Segment 0 load 00100000 size 2520296 mediaptr 0x1000
Segment 1 load 00368000 size 565504 mediaptr 0x269000
Segment 2 load 003f4000 size 581766 mediaptr 0x2f4000
Branching to kernel entry point 0x001001c0.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

I have another graphics card in this machine, so I'm wondering whether
that has anything to do with this.  FWIW, it's a 715/100.  I'm using the
prebuilt palinux-32-2.6.6-pa4_0-2_all.deb package from
http://cvs.parisc-linux.org/download/linux-2.6/

Thanks,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
