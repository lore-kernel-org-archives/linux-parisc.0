Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA28171
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 May 1999 12:53:32 -0600
Received: from arctic (arctic.nmt.edu [129.138.40.17]) by arctic.nmt.edu (8.6.11/8.6.9) with ESMTP id NAA12024 for <parisc-linux@thepuffingroup.com>; Thu, 6 May 1999 13:51:16 -0600
Date: Thu, 6 May 1999 13:51:15 -0600 (MDT)
From: Steve Ball <hamster@arctic.nmt.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld problem workaround
In-Reply-To: <r2aevi3ujd.fsf@happy.cygnus.com>
Message-ID: <Pine.SUN.4.05.9905061350280.11906-100000@arctic>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


SILO took the same approach, for the SPARC.

----------------------******-------------------
Steve Ball
NMT EE Department System and Network Admistrator

C/S 3392		|	Work: (505) 835-5330
Socorro, NM 87801	|	Shop: (505) 835-5923 (Solar Racing Shop)
hamster@arctic.nmt.edu	|       Home: (505) 835-6325 (South 335)
www.ee.nmt.edu/~hamster	|	www.nmt.edu/~nmtcaver

The secret of flying is simple: Throw yourself at the ground and miss.
Boy, backups sure are a lot faster since i linked /dev/st0 to /dev/null...
----------------------******-------------------


On 6 May 1999, Ulrich Drepper wrote:

> Jason Eckhardt <jason@equator.com> writes:
> 
> > Hopefully, we can re-use much of the standard linux code,
> >   but I haven't thought about this in detail yet.
> 
> Take a look at MILO, the Alpha bootloader.  No need to repeat the work.
> 
> -- 
> ---------------.      drepper at gnu.org  ,-.   1325 Chesapeake Terrace
> Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
> Cygnus Solutions `--' drepper at cygnus.com   `------------------------
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
