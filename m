From: "B. Douglas Hilton" <bdhilton@charter.net>
Subject: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
Date: Sun, 15 Sep 2002 00:28:14 -0400
Message-ID: <3D840C5E.2080405__11706.4671860591$1416621716$gmane$org@charter.net>
References: <200209150209.46701.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Fantastic! I was tinkering with this but I stalled out. I had
to cart my C200 in to work to use as a prototype server machine
for a proof of concept on a new project, but I will be sure to
give it a whirl as it still has the V2 inside it.

This might really help the project as now all the FX guys
have an inexpensive option for graphics!

When building the kernel should I disable "console on STI fb"
option then? Did you add a "console on sstfb" option to config?

Can't wait to try it out!

Cheers!
- Doug



Helge Deller wrote:
> Hi,
> 
> there has been some discussions on this lists a few weeks back
> about getting the Voodoo framebuffer driver  working on HPPA.
> The attached patch allows me to use my Voodoo 2 with the sstfb
> framebuffer driver in 16bpp in 640x480, 800x600 and 1024x768
> resolutions on console and under X.
> 
> Greetings,
> Helge
> 
> NB: This patch is already integrated into the 2.4.19-pa18 kernel and
> I'll continue to do some more code-cleanups before trying to get it
> into the official kernel.
> 
> 
> ------------------------------------------------------------------------
> 
> Index: sstfb.c
> ===================================================================
> RCS file: /var/cvs/linux/drivers/video/sstfb.c,v
> retrieving revision 1.4
> diff -u -p -r1.4 sstfb.c
> --- sstfb.c	4 Aug 2002 22:59:15 -0000	1.4
> +++ sstfb.c	14 Sep 2002 23:58:43 -0000
> @@ -107,6 +107,7 @@
>  
>  #include <asm/io.h>
>  #include <asm/ioctl.h>
> +#include <asm/uaccess.h>
>  
>  #include <video/fbcon.h>
>  #include <video/fbcon-cfb16.h>
> @@ -332,7 +333,7 @@ static void sst_dbg_print_var(struct fb_
>  
>  #if (SST_DEBUG_REG > 0)
>  static void sst_dbg_print_read_reg (u32 reg, u32 val) {
> -	char * regname =NULL;
> +	char * regname = NULL;
>  	switch (reg) {
>  	case FBIINIT0: regname="FbiInit0"; break;
>  	case FBIINIT1: regname="FbiInit1"; break;
> @@ -366,8 +367,8 @@ static void sst_dbg_print_write_reg (u32
>  		r_dprintk(" sst_write(%s, %#x)\n", regname, val);
>  }
>  #else /*  (SST_DEBUG_REG > 0) */
> -#  define sst_dbg_print_read_reg(reg, val)	do {}while(0)
> -#  define sst_dbg_print_write_reg(reg, val)	do {}while(0)
> +#  define sst_dbg_print_read_reg(reg, val)	do {} while(0)
> +#  define sst_dbg_print_write_reg(reg, val)	do {} while(0)
>  #endif /*  (SST_DEBUG_REG > 0) */
>  
>  /* register access */
> @@ -530,20 +531,15 @@ static int sstfb_setcolreg(u_int regno, 
>  		break;
>  #endif
>  #ifdef EN_24_32_BPP
> -#ifdef FBCON_HAS_CFB24
> +#if defined(FBCON_HAS_CFB24) || defined(FBCON_HAS_CFB32)
>  	case 24:
> -		sst_info->fbcon_cmap.cfb32[regno]=col;
> -		break;
> -#endif
> -#ifdef FBCON_HAS_CFB32
>  	case 32:
>  		sst_info->fbcon_cmap.cfb32[regno]=col;
>  		break;
>  #endif
>  #endif
>  	default:
> -		eprintk("bug line %d: bad depth '%u'\n",__LINE__,
> -			disp->var.bits_per_pixel);
> +		BUG();
>  		break;
>  	}
>  	f_dddprintk("bpp: %d . encoded color: %#x\n",
> @@ -735,6 +731,7 @@ static int sstfb_encode_var (struct fb_v
>  #ifdef EN_24_32_BPP
>  	case 24:	/* RGB 888 LfbMode 4 */
>  	case 32:	/* ARGB 8888 LfbMode 5 */
> +	       	/* in 24bpp we fake a 32 bpp mode */
>  		var->red.length    = 8;
>  		var->green.length  = 8;
>  		var->blue.length   = 8;
> @@ -743,11 +740,11 @@ static int sstfb_encode_var (struct fb_v
>  		var->red.offset    = 16;
>  		var->green.offset  = 8;
>  		var->blue.offset   = 0;
> -		var->transp.offset = 0; /* in 24bpp we fake a 32 bpp mode */
> +		var->transp.offset = 0;
>  		break;
>  #endif
>  	default:
> -		eprintk ("bug line %d: bad depth '%u'\n", __LINE__, par->bpp);
> +		eprintk("bug line %d: bad depth '%u'\n", __LINE__, par->bpp);
>  		break;
>  	}
>  	return 0;
> @@ -775,11 +772,15 @@ static int sstfb_get_fix(struct fb_fix_s
>  #define sst_info	((struct sstfb_info *) info)
>  
>  	struct fb_var_screeninfo *var;
> +	struct fb_var_screeninfo var2;
>  
>  	f_dprintk("sstfb_get_fix(con: %d)\n",con);
> -	if (con == -1)
> -		sstfb_encode_var(var, &sst_info->current_par, sst_info);
> -	else
> +	memset(fix, 0, sizeof(struct fb_fix_screeninfo));
> +	
> +	if (con == -1) {
> +		sstfb_encode_var(&var2, &sst_info->current_par, sst_info);
> +		var = &var2;
> +	} else
>  		var = &fb_display[con].var;
>  
>  	strcpy(fix->id, sst_info->info.modename);
> @@ -789,6 +790,7 @@ static int sstfb_get_fix(struct fb_fix_s
>  
>  	fix->type        = FB_TYPE_PACKED_PIXELS;
>  	fix->visual      = FB_VISUAL_TRUECOLOR;
> +	fix->accel       = FB_ACCEL_NONE;
>  	/*
>  	 *   According to the specs, the linelength must be of 1024 *pixels*.
>  	 * and the 24bpp mode is in fact a 32 bpp mode.
> @@ -966,42 +968,47 @@ static int sstfb_ioctl(struct inode *ino
>                         struct fb_info *info)
>  {
>  #define sst_info	((struct sstfb_info *) info)
> -#if (SST_DEBUG_IOCTL >0)
>  	int i;
>  	u_long p;
> -	u32 tmp;
> +	u32 tmp, val;
>  	u32 fbiinit0;
>  	struct pci_dev * sst_dev = sst_info->dev;
> -#endif
>  
>  	f_dprintk("sstfb_ioctl(%x)\n", cmd);
> -#if (SST_DEBUG_IOCTL >0)
> +	
>  	switch (cmd) {
> -#  if (SST_DEBUG_VAR >0)
> -/* tmp ioctl : dumps fb_display[0-5] */
> +		
> +#if (SST_DEBUG_VAR >0)
> +	/* tmp ioctl : dumps fb_display[0-5] */
>  	case _IO('F', 0xdb):		/* 0x46db */
>  		f_dprintk("dumping fb_display[0-5].var\n");
>  		for (i = 0 ; i< 6 ; i++) {
>  			print_var(&fb_display[i].var, "var(%d)", i);
>  		}
>  		return 0;
> -#  endif /* (SST_DEBUG_VAR >0) */
> -/* fills the lfb up to *(u32*)arg */
> +#endif /* (SST_DEBUG_VAR >0) */
> +
> +	/* fills the lfb up to given count of pixels */
>  	case _IOW('F', 0xdc, u32):	/* 0x46dc */
> -		if (*(u32*)arg > 0x400000 )
> -			*(u32*) arg = 0x400000;
> -		f_dprintk("filling %#x \n", *(u32*)arg);
> -		for (p = 0 ; p < *(u32*)arg; p+=2)
> +		if (copy_from_user(&val, (void *) arg, sizeof(val)))
> +			return -EFAULT;
> +		if (val > 0x400000 )
> +			val = 0x400000;
> +		f_dprintk("filling %#x \n", val);
> +		for (p = 0 ; p < val; p+=2)
>  			writew( p >> 6 , sst_info->video.vbase + p);
>  		return 0;
> -/* change VGA pass_through */
> +		
> +	/* enable/disable VGA pass_through */
>  	case _IOW('F', 0xdd, u32):	/* 0x46dd */
> +		if (copy_from_user(&val, (void *) arg, sizeof(val)))
> +			return -EFAULT;
>  		f_dprintk("switch VGA pass-through\n");
>  		pci_read_config_dword(sst_dev, PCI_INIT_ENABLE, &tmp);
>  		pci_write_config_dword(sst_dev, PCI_INIT_ENABLE,
>  				       tmp | PCI_EN_INIT_WR );
>  		fbiinit0 = sst_read (FBIINIT0);
> -		if (* (u32*)arg) {
> +		if (val) {
>  			sst_write(FBIINIT0, fbiinit0 & ~EN_VGA_PASSTHROUGH);
>  			iprintk ( "Disabling VGA pass-through\n");
>  		} else {
> @@ -1010,28 +1017,29 @@ static int sstfb_ioctl(struct inode *ino
>  		}
>  		pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
>  		return 0;
> +
> +	/* display test pattern */
>  	case _IO('F', 0xde):		/* 0x46de */
>  		f_dprintk("test color display\n");
>  		f_ddprintk("currcon: %d, bpp %d\n", sst_info->currcon,
>  			  sst_info->current_par.bpp);
>  		memset_io(sst_info->video.vbase, 0, sst_info->video.len);
> -	switch (sst_info->current_par.bpp) {
> +		switch (sst_info->current_par.bpp) {
>  	       	case 16:
>  			sstfb_test16(sst_info);
>  			break;
> -#  ifdef EN_24_32_BPP
> +#ifdef EN_24_32_BPP
>  		case 24:
>  		case 32:
>  			sstfb_test32(sst_info);
>  			break;
> -#  endif
> +#endif
>  		default:
> -			dprintk("bug line %d: bad depth '%u'\n", __LINE__,
> -			        sst_info->current_par.bpp);
> -			}
> +			return -EFAULT;
> +		}
>  		return 0;
>  	}
> -#endif /* (SST_DEBUG_IOCTL >0) */
> +	
>  	return -EINVAL;
>  #undef sst_info
>  }
> @@ -1494,7 +1502,7 @@ static int sstfb_set_par(const struct ss
>  	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, PCI_EN_FIFO_WR);
>  
>  	/* set lfbmode : set mode + front buffer for reads/writes
> -	   + disable pipeline + disable byte swapping */
> +	   + disable pipeline  */
>  	switch(par->bpp) {
>  	case 16:
>  		lfbmode = LFB_565;
> @@ -1508,12 +1516,16 @@ static int sstfb_set_par(const struct ss
>  		break;
>  #endif
>  	default:
> -		dprintk("bug line %d: bad depth '%u'\n", __LINE__,
> -			par->bpp );
> +		BUG();
>  		return 0;
> -		break;
>  	}
>  
> +#if defined(__BIG_ENDIAN)
> +	/* enable byte-swizzle functionality in hardware */
> +	lfbmode |= ( LFB_WORD_SWIZZLE_WR | LFB_BYTE_SWIZZLE_WR | 
> +		     LFB_WORD_SWIZZLE_RD | LFB_BYTE_SWIZZLE_RD );
> +#endif
> +
>  	if (clipping) {
>  		sst_write(LFBMODE, lfbmode | EN_PXL_PIPELINE);
>  	/*
> @@ -1521,7 +1533,7 @@ static int sstfb_set_par(const struct ss
>  	 * writes to offscreen areas of the framebuffer are performed,
>  	 * the "behaviour is undefined" (_very_ undefined) - Urs
>  	 */
> -	/* btw, it requires enabling pixel pipeline in LFBMODE .
> +	/* btw, it requires enabling pixel pipeline in LFBMODE.
>  	   off screen read/writes will just wrap and read/print pixels
>  	   on screen. Ugly but not that dangerous */
>  
> @@ -1536,7 +1548,7 @@ static int sstfb_set_par(const struct ss
>  		sst_write(LFBMODE, lfbmode );
>  	}
>  
> -	sst_info->current_par = *par ;
> +	sst_info->current_par = *par;
>  	return 1;
>  }
>  
> @@ -1571,8 +1583,7 @@ static void sst_set_vidmod_att_ti(struct
>  		break;
>  #endif
>  	default:
> -		dprintk("bug line %d: bad depth '%u'\n", __LINE__, bpp);
> -		break;
> +		BUG();
>  	}
>  }
>  
> @@ -1590,8 +1601,7 @@ static void sst_set_vidmod_ics(struct ss
>  		break;
>  #endif
>  	default:
> -		dprintk("bug line %d: bad depth '%u'\n", __LINE__, bpp);
> -		break;
> +		BUG();
>  	}
>  }
>  
> @@ -1987,34 +1997,34 @@ static void sstfb_test16(struct sstfb_in
>  	u_long fbbase_virt = sst_info->video.vbase;
>  
>  	f_dprintk("sstfb_test16\n");
> -	/* rect blanc 20x100+200+0 */
> +	/* white rectangle 20x100+200+0 */
>  	for (i=0 ; i< 100; i++) {
>  	  p = fbbase_virt + 2048 *i+400;
> -	  for (j=0 ; j < 10 ; j++) {
> -	    writel( 0xffffffff, p);
> +	  for (j=0; j < 10; j++) {
> +	    writel(0xffffffff, p);
>  	    p+=4;
>  	  }
>  	}
> -	/* rect bleu 180x200+0+0 */
> +	/* blue rectangle 180x200+0+0 */
>  	for (i=0 ; i< 200; i++) {
>  	  p = fbbase_virt + 2048 *i;
> -	  for (j=0 ; j < 90 ; j++) {
> -	    writel(0x001f001f,p);
> +	  for (j=0; j < 90; j++) {
> +	    writel(0x001f001f, p);
>  	    p+=4;
>  	  }
>  	}
> -	/* carre vert 40x40+100+0 */
> +	/* green rectangle 40x40+100+0 */
>  	for (i=0 ; i< 40 ; i++) {
>  	  p = fbbase_virt + 2048 *i + 200;
> -	  for (j=0; j <20;j++) {
> +	  for (j=0; j <20; j++) {
>  	    writel(0x07e007e0, p);
>  	    p+=4;
>  	  }
>  	}
> -	/*carre rouge 40x40+100+40 */
> +	/* red rectangle 40x40+100+40 */
>  	for (i=0; i<40; i++) {
>  	  p = fbbase_virt + 2048 * (i+40) + 200;
> -	  for (j=0; j <20;j++) {
> +	  for (j=0; j <20; j++) {
>  	    writel( 0xf800f800, p);
>  	    p+=4;
>  	  }
> @@ -2034,22 +2044,22 @@ static void sstfb_test32(struct sstfb_in
>  	for (i=0 ; i< 100; i++) {
>  	  p = fbbase_virt + 4096*i + 800;
>  	  for (j=0 ; j < 20 ; j++) {
> -	    writel( 0x00ffffff, p);
> +	    writel(0x00ffffff, p);
>  	    p+=4;
>  	  }
>  	}
>  	/* rect bleu 180x200+0+0 */
>  	for (i=0 ; i< 200; i++) {
>  	  p = fbbase_virt + 4096 * i;
> -	  for (j=0 ; j < 180 ; j++) {
> -	    writel(0x000000ff,p);
> +	  for (j=0 ; j < 180; j++) {
> +	    writel(0x000000ff, p);
>  	    p+=4;
>  	  }
>  	}
>  	/* carre vert 40x40+100+0 */
>  	for (i=0 ; i< 40 ; i++) {
>  	  p = fbbase_virt + 4096 *i + 400;
> -	  for (j=0; j <40;j++) {
> +	  for (j=0; j <40; j++) {
>  	    writel(0x0000ff00, p);
>  	    p+=4;
>  	  }
> @@ -2057,8 +2067,8 @@ static void sstfb_test32(struct sstfb_in
>  	/*carre rouge 40x40+100+10 */
>  	for (i=0; i<40; i++) {
>  	  p = fbbase_virt + 4096 * (i+40) + 400;
> -	  for (j=0; j <40;j++) {
> -	    writel( 0x00ff0000, p);
> +	  for (j=0; j <40; j++) {
> +	    writel(0x00ff0000, p);
>  	    p+=4;
>  	  }
>  	}
> Index: sstfb.h
> ===================================================================
> RCS file: /var/cvs/linux/drivers/video/sstfb.h,v
> retrieving revision 1.3
> diff -u -p -r1.3 sstfb.h
> --- sstfb.h	4 Aug 2002 22:59:15 -0000	1.3
> +++ sstfb.h	14 Sep 2002 23:58:44 -0000
> @@ -114,7 +114,11 @@
>  #  define RD_BUFF_FRONT		  0		/* read buff select (front) */
>  #  define RD_BUFF_BACK		  (1 << 6)	/* back */
>  #  define EN_PXL_PIPELINE	  BIT(8)	/* pixel pipeline (clip..)*/
> +#  define LFB_WORD_SWIZZLE_WR	  BIT(11)	/* enable write-wordswap (big-endian) */
> +#  define LFB_BYTE_SWIZZLE_WR	  BIT(12)	/* enable write-byteswap (big-endian) */
>  #  define LFB_INVERT_Y		  BIT(13)	/* invert Y origin (LFB) */
> +#  define LFB_WORD_SWIZZLE_RD	  BIT(15)	/* enable read-wordswap (big-endian) */
> +#  define LFB_BYTE_SWIZZLE_RD	  BIT(16)	/* enable read-byteswap (big-endian) */
>  #define CLIP_LEFT_RIGHT		0x0118
>  #define CLIP_LOWY_HIGHY		0x011c
>  #define NOPCMD			0x0120
