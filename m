Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA14292
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 08:33:09 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 14:34:04 -0000
To: Randolph Chung <randolph@tausq.org>
Cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: problems with binutils and/or g++
References: <87r95f2ogl.fsf@linuxcare.com>
	<Pine.LNX.4.21.0010181628240.1579-100000@front.linuxcare.com.au>
	<20001018000230.D568@tausq.org>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Oct 2000 10:34:12 -0400
In-Reply-To: Randolph Chung's message of "Wed, 18 Oct 2000 00:02:30 -0700"
Message-ID: <87itqq2p7f.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Randolph Chung <randolph@tausq.org> writes:

> Alan, for my curiosity, could you explain this particular line from g++'s 
> output (from dhd's message)?
> 
> ../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c):
> cannot handle R_PARISC_PCREL17F for pkgArchiveCleaner type_info function
> 
> that seems to be causing the "undefined" symbol messages.

No, it's caused *by* the undefined symbol.  If a symbol is undefined,
it won't have a stub hash entry.  If it doesn't have a stub hash entry
and it is either in a shared library or out of branch range, then
relocations to it can't be handled.  Thus the error message.

The case where a symbol is defined, and yet is unreachable, results in
a different warning (should be an error, but for some reason it seemed
to be non-fatal last time I encountered it) message which tells you to
recompile with -ffunction-sections.

We might want to get rid of the 'cannot handle R_PARISC_FOO' messages
in the undefined symbol case, as they are evidently misleading.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
