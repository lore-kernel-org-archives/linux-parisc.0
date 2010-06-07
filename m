From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcc-4.5 -fdelayed-branch strikes back
Date: Mon, 7 Jun 2010 19:29:08 -0400
Message-ID: <20100607232907.GA10176@hiauly1.hia.nrc.ca>
References: <20100604181712.43456ddb@borg.bxl.tuxicoman.be> <20100604193229.473BB515D@hiauly1.hia.nrc.ca> <20100605115808.0ff33504@borg.bxl.tuxicoman.be>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100605115808.0ff33504@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 05 Jun 2010, Guy Martin wrote:

> 
> Hi Dave,
> 
> I've stripped down gengenrtl.c to the maximum and I'm able to reproduce
> the issue with the attached file.
> 
> I've observed the following :
> gcc -O2  -> Segv
> gcc -O2 -fno-delayed-branch -> OK
> gcc -O1 -> OK
> gcc -O1 -freorder-blocks -> Segv
> gcc -O1 -freorder-blocks -fno-delayed-branch -> OK
> gcc -O0 -freorder-blocks -fdelayed-branch -> OK
> 
> For reference, the build break when compiled the following way :
> make -j2 LDFLAGS="-Wl,-O1" STAGE1_CFLAGS="-O"
> LIBPATH=/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.5.0 BOOT_CFLAGS="-O2
> -pipe -march=2.0" bootstrap-lean 

I haven't had a chance to try the your stripped down gengenrtl.c
but there is definitely a problem compiling the 4.5 branch with
4.4 using STAGE1_CFLAGS="-O".  This didn't occur with 4.3.  I get
an ICE in stage1 configuration of libgcc with 4.4.  At this point,
I don't know the cause but this is bad as it indicates a major
bug with 4.4 on hppa.  -fno-reorder-blocks didn't help.

As a general rule, it is not a good idea to build stage1 with
optimisation.  It is not tested.  I get a successful bootstrap
at -O0.  I would guess 4.5 can probably compile 4.5 with -O,
but I haven't tested it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
