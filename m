From: Matt Taggart <matt@lackof.org>
Subject: Re: [parisc-linux] Easy Firmware Upgrade for C180
Date: Sat, 02 Apr 2005 16:10:08 -0800
Message-ID: <20050403001008.86F3E1AA5E7@cyrix.home.bogus>
References: <913ffb071295fac86a0aade164cf5a27@cox.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Erik T. Crouch" <lennier@cox.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <913ffb071295fac86a0aade164cf5a27@cox.net> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Erik T. Crouch writes...

> Is there ANY way of making the firmware image extractable/writable to a 
> CD, I also do not have a floppy drive.

IIRC you can just burn the firmware lif image directly to a CD and boot it the 
same as you'd dd to a tape or hdd. BTW file(1) knows about lif images, confirm 
that you have a proper lif and then just burn it to CD with cdrecord or 
something.

You mention in a later message "dd it to a virtual disc, then make it a bin 
image which you can translate into an ISO". I suspect that's not changing it 
at all since if you actually changed the lif image it probably wouldn't work 
anymore.

Inevitably someone will ask how to do this on MS Windows. I don't know anyone 
who's done it but if you follow the normal method for burning hppa bootable 
images listed at
  http://www.parisc-linux.org/faq/burn_hppa_cd-howto.html
it should work.

-- 
Matt Taggart
matt@lackof.org


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
