Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp018.mail.yahoo.com (smtp018.mail.yahoo.com [216.136.174.115])
	by dsl2.external.hp.com (Postfix) with SMTP id C00EB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 Jan 2002 23:00:08 -0700 (MST)
Message-ID: <3C5A3139.20006@yahoo.com>
Date: Fri, 01 Feb 2002 06:10:01 +0000
From: Jbit of Plasma <james_a_n_lee@yahoo.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Graphics support
References: <3765AD6E3C88D211A92400A0C9A4F70E0119D735@lawrence.psl-dist.co.uk> <20020131180403.86D6F482A@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

 >>	I notice PA-RISC Linux has X11 working now, but I gather that is via
 >>the STI?  Is that correct?  Would that make it pretty slow?
 > STI is just the interface to present text on the graphics head.
 > Frame Buffer driver actually, iirc.


Yeah, X11 uses the framebuffer driver, it's quite fast (faster then I expected anyway)

 >>	I just wondered if you could give me any information on the status
 >>of a proper graphics driver for PARISC Linux, it seems HP is being funny
 >>about letting people have the docs for their chipsets maybe?
 > Funny? That's a very polite way of putting it.
 > TCD doesn't seem to be interested in publishing those docs.


I assume this includes the 712 gfx chipset (the "artist" chip, iirc)
Wonder why they don't want to release any infomation? Is there any unoffical infomation, a proper X driver should make it faster.

 >>Also though I
 >>wanted to consider whether use would be made of HP's colour recovery
 >>technology?  From what I have read, currently in HPUX you must compile your
 >>apps to support the Colour Recovery extension.  However, would it be
 >>possible for this to be inbuilt somehow into the XServer when a proper
 >>driver exists for it?  Many of the lower end workstations only have an 8bit
 >>framebuffer but do support Colour Recovery, and with apps like gnome and gtk
 >>making extensive use of high colour graphics, it seems a shame to not use
 >>this probably under utilised HP technology.

Sorry to ask, but I couldn't seem to find any docs on it, whats "Colour recovery"?

Thanks
--jbit



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
