Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA08521
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 01:01:41 -0600
Date: Wed, 18 Oct 2000 00:02:30 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alan Modra <alan@linuxcare.com.au>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: problems with binutils and/or g++
Message-ID: <20001018000230.D568@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <87r95f2ogl.fsf@linuxcare.com> <Pine.LNX.4.21.0010181628240.1579-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0010181628240.1579-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Oct 18, 2000 at 05:18:12PM +1100
List-ID: <linux-parisc.vger.kernel.org>

> After fixing a zillion bugs of the "friend foo" -> "friend class foo" type 
> and assorted protected/private/public issues, I finally managed to have apt
> compile.  Same error as you found.  It's not a linker bug as it's not a 
> case of the linker dropping some section; the undefined symbol really
> isn't defined anywhere.  I don't know enough C++ to debug the problem
> further.

Alan, for my curiosity, could you explain this particular line from g++'s 
output (from dhd's message)?

../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c):
cannot handle R_PARISC_PCREL17F for pkgArchiveCleaner type_info function

that seems to be causing the "undefined" symbol messages.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
