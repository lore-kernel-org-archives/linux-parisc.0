Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA09974
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 02:00:15 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 08:01:33 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA14720;
	Wed, 18 Oct 2000 19:01:16 +1100
Date: Wed, 18 Oct 2000 19:01:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: problems with binutils and/or g++
In-Reply-To: <20001018000230.D568@tausq.org>
Message-ID: <Pine.LNX.4.21.0010181842070.1579-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 18 Oct 2000, Randolph Chung wrote:

> > After fixing a zillion bugs of the "friend foo" -> "friend class foo" type 
> > and assorted protected/private/public issues, I finally managed to have apt
> > compile.  Same error as you found.  It's not a linker bug as it's not a 
> > case of the linker dropping some section; the undefined symbol really
> > isn't defined anywhere.  I don't know enough C++ to debug the problem
> > further.
> 
> Alan, for my curiosity, could you explain this particular line from g++'s 
> output (from dhd's message)?
> 
> ../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c):
> cannot handle R_PARISC_PCREL17F for pkgArchiveCleaner type_info function
> 
> that seems to be causing the "undefined" symbol messages.

That message actually comes from the linker in response to an error during
final link.  See bfd/elf32-hppa.c:elf32_hppa_relocate_section.  It's
saying a particular relocation couldn't be relocated for some reason.  In
this case, the undefined symbol is the cause of the message (not the other
way around), and since the linker already reported the undefined symbol
it's rather redundant.  I should probably not report "cannot handle.." for
undefined symbols.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
