From: Helge Deller <deller@gmx.de>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Sun, 24 Aug 2008 16:38:26 +0200
Message-ID: <48B17262.3010206@gmx.de>
References: <20080824140930.309DD431A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080824140930.309DD431A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>>>> As you can see, the main video parameters are OK, while the 
>>>>> monitor/modeline values (pixclock, left_margin, right_margin, 
>>>>> upper_margin, lower_margin, hsync_len, vsync_len, sync and vmode)
>>>>> were changed to zero.
> 
> The skeletonfb.c code makes it very clear that the only place where
> a mode can be changed is in xxxfb_check_var:
> 
> *      Exception to the above rule:  Some drivers have a fixed mode, ie,
> *      the hardware is already set at boot up, and cannot be changed.  In
> *      this case, it is more acceptable that this function just return
> *      a copy of the currently working var (info->var). Better is to not
> *      implement this function, as the upper layer will do the copying
> *      of the current var for you.
> *
> *      Note:  This is the only function where the contents of var can be
> *      freely adjusted after the driver has been registered. If you find
> *      that you have code outside of this function that alters the content
> *      of var, then you are doing something wrong.  Note also that the
> *      contents of info->var must be left untouched at all times after
> *      driver registration.
> 
> As xxxfb_check_var is not implemented in stifb.c, it must be the upper
> level that is changing the parameters.  Possibly, something to try is
> the following:
> 
>  *      However, even if your hardware does not support mode changing,
>  *      a set_par might be needed to at least initialize the hardware to
>  *      a known working state, especially if it came back from another
>  *      process that also modifies the same hardware, such as X.
>  *
>  *      If this is the case, a combination such as the following should work:
>  *
>  *      static int xxxfb_check_var(struct fb_var_screeninfo *var,
>  *                                struct fb_info *info)
>  *      {
>  *              *var = info->var;
>  *              return 0;
>  *      }
>  *
>  *      static int xxxfb_set_par(struct fb_info *info)
>  *      {
>  *              init your hardware here
>  *      }


Yes, exactly that would be the patch to make it work.


>> But stifb and a few other fb drivers are not able to set sync timings, 
>> and for those X behaves IMHO wrong. For those X should assume that the 
>> timings set by the driver are correct as long as the resolution and bit 
>> depth are correct.
>>
>> This is what happens:
>> 1. In xorg.conf you configured a pixel resolution and bpp (e.g. 
>> 1280x1024-16)
>> 2. In xorg.conf you might have configured a monitor (with or without 
>> some timing/sync informations)
>> 3. X reads those config parameters and try to set them through kernel calls.
>> 4. Kernel returns that it now has set up the mode (1280x1024-16) and has 
>> set up the timings. Since stifb does not support timing modes, it 
>> returns zeros in those values (IMHO thats correct behavior if you look 
>> at the comments in skeletonfb.c)
>> 5. X verifies the returned values and aborts since the timing values are 
>> different to what it fed to the kernel, although the resolution 
>> (1280x1024-16) is correctly set and returned like that.
>>
>> I think X is right in noticing that the timing/sync values are not what 
>> it expected. Nevertheless, I would prefer that it would just warn (in 
>> the fbdev drivers only!) that the timings are incorrect instead of 
>> aborting completely. X is right to abort, if the pixel resolution and 
>> bpp can not be set.
>> So, X's tests should be like that:
>> a) resolution and bpp different -> abort
>> b) resolution and bpp correct, but sync timings/monitor timings 
>> different -> warn but continue
>>
>> Right now X's tests are:
>> resolution, bpp or sync/monitor timings different -> abort.
>>
>> Of course it's easily possible to change stifb in that it just takes any 
>> timing values, but that is not how it is documented in skeletonfb.
> 
> My sense in looking at the PR is that the freedesktop people won't
> accept this approach.

Sadly I have the same feeling.
But just scan yourself through the kernel fb drivers and look how many 
drivers haven't implemented this workaround with check_var and set_par.
All those fb drivers are probably broken due to this X behavior.

Helge
