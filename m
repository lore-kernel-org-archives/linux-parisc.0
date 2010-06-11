From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: gcc-4.5 -fdelayed-branch strikes back
Date: Fri, 11 Jun 2010 19:45:16 +0200
Message-ID: <20100611194516.496c2ddf@zombie>
References: <20100604181712.43456ddb@borg.bxl.tuxicoman.be>
	<20100604193229.473BB515D@hiauly1.hia.nrc.ca>
	<20100605115808.0ff33504@borg.bxl.tuxicoman.be>
	<20100607232907.GA10176@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave@hiauly1.hia.nrc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100607232907.GA10176@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Dave,

> I haven't had a chance to try the your stripped down gengenrtl.c
> but there is definitely a problem compiling the 4.5 branch with
> 4.4 using STAGE1_CFLAGS="-O".  This didn't occur with 4.3.  I get
> an ICE in stage1 configuration of libgcc with 4.4.  At this point,
> I don't know the cause but this is bad as it indicates a major
> bug with 4.4 on hppa.  -fno-reorder-blocks didn't help.

I'm able to reproduce the same behavior with gcc-4.5 trying to build
itself. Can you try with -fno-delayed-branch ?
I think -freorder-blocks is just a way to trigger the issue with -O1.

The test case should make things pretty easy to repro. But if you need
some more details let me know.


Cheers,
  Guy
