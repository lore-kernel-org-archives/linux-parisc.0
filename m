From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Sun, 04 Aug 2013 15:00:33 +0400
Message-ID: <995101375614033@web11d.yandex.ru>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org> <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl> <216411373487566@web6f.yandex.ru> <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com> <518401373491752@web17h.yandex.ru> <51DF0B90.3040506@gmx.de> <51DF0BEF.6020304@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51DF0BEF.6020304@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

11.07.2013, 23:48, "Helge Deller" <deller@gmx.de>:
> adding linux parisc mailing list...:
>
> On 07/11/2013 09:46 PM, Helge Deller wrote:
>
>> =9AOn 07/10/2013 11:29 PM, Alex Ivanov wrote:
>>> =9A11.07.2013, 01:14, "Matt Turner" <mattst88@gmail.com>:
>>>> =9AOn Wed, Jul 10, 2013 at 1:19 PM, Alex Ivanov <gnidorah@p0n4ik.t=
k> wrote:
>>>>> =9A=9AThank you so much! Your guess looks to be right. After appl=
ying of your
>>>>> =9A=9Apatch there was no more KP and X just worked.
>>>> =9ANice! Does DRI work?
>>> =9ANot on my side. Plus i can't visually jump over 8bit depth, alth=
ough Xorg
>>> =9Astates 24bit in it's log.
>>> =9AAs for DRI, i'm experiencing
>>> =9A"ring test failed (scratch(0x15E4)=3D0xCAFEDEAD)" with a firegl =
x3.
>> =9AFWIW, I'm seeing the same failure on my FireGL X1:
>> =9A80:00.0 VGA compatible controller: Advanced Micro Devices [AMD] n=
ee ATI Radeon R300 NG [FireGL X1] (rev 80)
>>
>> =9A[drm] radeon: irq initialized.
>> =9A[drm] Loading R300 Microcode
>> =9A[drm] radeon: ring at 0x0000000060001000
>> =9A[drm:r100_ring_test] *ERROR* radeon: ring test failed (scratch(0x=
15E4)=3D0xCAFEDEAD)
>> =9A[drm:r100_cp_init] *ERROR* radeon: cp isn't working (-22).
>> =9Aradeon 0000:80:00.0: failed initializing CP (-22).
>> =9Aradeon 0000:80:00.0: Disabling GPU acceleration
>> =9A[drm:r100_cp_fini] *ERROR* Wait for CP idle timeout, shutting dow=
n CP.
>> =9A[drm] radeon: cp finalized
>> =9A[drm] radeon: cp finalized

I still have no clue why this happens. Broken SBA IOMMU / DRM code? Mis=
sing syncing primitives?
Should we forward this to dri-devel mail list?
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
