From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Thu, 11 Jul 2013 21:47:59 +0200
Message-ID: <51DF0BEF.6020304@gmx.de>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org> <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl> <216411373487566@web6f.yandex.ru> <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com> <518401373491752@web17h.yandex.ru> <51DF0B90.3040506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51DF0B90.3040506@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

adding linux parisc mailing list...:

On 07/11/2013 09:46 PM, Helge Deller wrote:
> On 07/10/2013 11:29 PM, Alex Ivanov wrote:
>> 11.07.2013, 01:14, "Matt Turner" <mattst88@gmail.com>:
>>> On Wed, Jul 10, 2013 at 1:19 PM, Alex Ivanov <gnidorah@p0n4ik.tk> wrote:
>>>
>>>>  Thank you so much! Your guess looks to be right. After applying of your
>>>>  patch there was no more KP and X just worked.
>>>
>>> Nice! Does DRI work?
>>
>> Not on my side. Plus i can't visually jump over 8bit depth, although Xorg 
>> states 24bit in it's log.
>> As for DRI, i'm experiencing 
>> "ring test failed (scratch(0x15E4)=0xCAFEDEAD)" with a firegl x3.
> 
> FWIW, I'm seeing the same failure on my FireGL X1:
> 80:00.0 VGA compatible controller: Advanced Micro Devices [AMD] nee ATI Radeon R300 NG [FireGL X1] (rev 80)
> 
> [drm] radeon: irq initialized.
> [drm] Loading R300 Microcode
> [drm] radeon: ring at 0x0000000060001000
> [drm:r100_ring_test] *ERROR* radeon: ring test failed (scratch(0x15E4)=0xCAFEDEAD)
> [drm:r100_cp_init] *ERROR* radeon: cp isn't working (-22).
> radeon 0000:80:00.0: failed initializing CP (-22).
> radeon 0000:80:00.0: Disabling GPU acceleration
> [drm:r100_cp_fini] *ERROR* Wait for CP idle timeout, shutting down CP.
> [drm] radeon: cp finalized
> [drm] radeon: cp finalized
> 
> I haven't tested X11 yet.
> 
>> Can't figure out why, the ring vaddr (0x0000000060001000) is within the
>> limits of dma32. But the ring test fails. And i'm afraid that just adding a 
>> buffer bounces in places will not help.
> 
> Helge
> 

