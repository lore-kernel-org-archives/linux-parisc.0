Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA07911
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 00:18:27 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 06:19:35 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA11319;
	Wed, 18 Oct 2000 17:18:12 +1100
Date: Wed, 18 Oct 2000 17:18:12 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: problems with binutils and/or g++
In-Reply-To: <87r95f2ogl.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0010181628240.1579-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 17 Oct 2000, David Huggins-Daines wrote:

> I'm not sure if this is a g++ or linker bug.  The symbol names look
> really suspicious, suggesting that it might be a bug in RTTI (I'll try
> recompiling with -fno-rtti, as I don't think APT uses it).  But on the
> other hand we've had problems with link-once sections in the past.
> 
> Any thoughts?

After fixing a zillion bugs of the "friend foo" -> "friend class foo" type 
and assorted protected/private/public issues, I finally managed to have apt
compile.  Same error as you found.  It's not a linker bug as it's not a 
case of the linker dropping some section; the undefined symbol really
isn't defined anywhere.  I don't know enough C++ to debug the problem
further.

Recompiling with -fno-rtti results in a successful build.

-- 
Linuxcare.  Support for the Revolution.
