From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] stifb: Implement hardware accelerated copyarea
Date: Mon, 15 Jun 2015 20:52:13 +0200
Message-ID: <557F1EDD.3080504@gmx.de>
References: <679FC99F-317B-4925-A6D8-2F0DB4EC6EBD@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: lausgans@gmail.com, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <679FC99F-317B-4925-A6D8-2F0DB4EC6EBD@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15.06.2015 07:50, lausgans@gmail.com wrote:
> This patch adds hardware assisted scrolling. The code is based upon the
> following investigation: https://parisc.wiki.kernel.org/index.php/NGLE#Blitter A
> simple 'time ls -la /usr/bin' test shows 1.6x speed increase over soft copy and
> 2.3x increase over FBINFO_READS_FAST (prefer soft copy over screen redraw) on
> Artist framebuffer.

I haven't tested it yet, but that's very cool!
Thanks!

I wonder if adding a BlockTLB (with PA7100LC CPUs) further increases
speed on Artist graphic cards (e.g. in X11)...?

Helge

> Signed-off-by: Alex Ivanov <lausgans@gmail.com>
>
> diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
> index 86621fa..735355b 100644
> --- a/drivers/video/fbdev/stifb.c
> +++ b/drivers/video/fbdev/stifb.c
> @@ -121,6 +121,7 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS];
> #define REG_3		0x0004a0
> #define REG_4		0x000600
> #define REG_6		0x000800
> +#define REG_7		0x000804
> #define REG_8		0x000820
> #define REG_9		0x000a04
> #define REG_10		0x018000
> @@ -135,6 +136,8 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS];
> #define REG_21		0x200218
> #define REG_22		0x0005a0
> #define REG_23		0x0005c0
> +#define REG_24		0x000808
> +#define REG_25		0x000b00
> #define REG_26		0x200118
> #define REG_27		0x200308
> #define REG_32		0x21003c
> @@ -429,6 +432,9 @@ ARTIST_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
> #define SET_LENXY_START_RECFILL(fb, lenxy) \
> 	WRITE_WORD(lenxy, fb, REG_9)
>
> +#define SETUP_COPYAREA(fb) \
> +	WRITE_BYTE(0, fb, REG_16b1)
> +
> static void
> HYPER_ENABLE_DISABLE_DISPLAY(struct stifb_info *fb, int enable)
> {
> @@ -1004,6 +1010,36 @@ stifb_blank(int blank_mode, struct fb_info *info)
> 	return 0;
> }
>
> +static void
> +stifb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
> +{
> +	struct stifb_info *fb = container_of(info, struct stifb_info, info);
> +
> +	SETUP_COPYAREA(fb);
> +
> +	SETUP_HW(fb);
> +	if (fb->info.var.bits_per_pixel == 32) {
> +		WRITE_WORD(0xBBA0A000, fb, REG_10);
> +
> +		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xffffffff);
> +	} else {
> +		WRITE_WORD(fb->id == S9000_ID_HCRX ? 0x13a02000 : 0x13a01000, fb, REG_10);
> +
> +		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xff);
> +	}
> +
> +	NGLE_QUICK_SET_IMAGE_BITMAP_OP(fb,
> +		IBOvals(RopSrc, MaskAddrOffset(0),
> +		BitmapExtent08, StaticReg(1),
> +		DataDynamic, MaskOtc, BGx(0), FGx(0)));
> +
> +	WRITE_WORD(((area->sx << 16) | area->sy), fb, REG_24);
> +	WRITE_WORD(((area->width << 16) | area->height), fb, REG_7);
> +	WRITE_WORD(((area->dx << 16) | area->dy), fb, REG_25);
> +
> +	SETUP_FB(fb);
> +}
> +
> static void __init
> stifb_init_display(struct stifb_info *fb)
> {
> @@ -1069,7 +1105,7 @@ static struct fb_ops stifb_ops = {
> 	.fb_setcolreg	= stifb_setcolreg,
> 	.fb_blank	= stifb_blank,
> 	.fb_fillrect	= cfb_fillrect,
> -	.fb_copyarea	= cfb_copyarea,
> +	.fb_copyarea	= stifb_copyarea,
> 	.fb_imageblit	= cfb_imageblit,
> };
>
> @@ -1258,7 +1294,7 @@ static int __init stifb_init_fb(struct sti_struct *sti, int bpp_pref)
> 	info->fbops = &stifb_ops;
> 	info->screen_base = ioremap_nocache(REGION_BASE(fb,1), fix->smem_len);
> 	info->screen_size = fix->smem_len;
> -	info->flags = FBINFO_DEFAULT;
> +	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_COPYAREA;
> 	info->pseudo_palette = &fb->pseudo_palette;
>
> 	/* This has to be done !!! */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

