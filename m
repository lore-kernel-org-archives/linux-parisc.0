Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E0C16123
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 18:19:51 -0700 (MST)
To: xfs@linux.se
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to burn the CD? 
In-Reply-To: Message from <xfs@linux.se>
   of "Tue, 20 Nov 2001 01:37:07 +0100." <Pine.LNX.4.33.0111200130490.7294-100000@oden.valhall>
References: <Pine.LNX.4.33.0111200130490.7294-100000@oden.valhall> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 19 Nov 2001 18:19:49 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011120011949.8C6AF37E86@carmen.fc.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

xfs@linux.se writes...

> Anyony knowing how to use the cd-burner in HpUX10.20 on a pa-risc?

cdrecord (and XCDRoast) can be made to work on HP-UX if you can't find another 
easier solution.

> Another question: My HpUX-install-cd didn't boot on the cdrom...
> Is there any wrong with my burned cd with hpux, the cdrom-device or the
> mashine (pa712/60)? I hope it is the hp-install-cd becouse if it is the
> hardware, then I'm not beeing able to boot the linux-install-cd ether.

What type of cdrom drive is it? Firmware only supports certain types. Try 
doing a "sea"rch in the firmware interface with a "known bootable on hppa 
systems" cd in the drive. If the search finds it then you should be able to 
boot from it.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
