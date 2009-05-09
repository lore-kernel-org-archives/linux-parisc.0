From: Randolph Chung <randolph@tausq.org>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Sat, 09 May 2009 10:39:59 +0800
Message-ID: <4A04ECFF.7090308@tausq.org>
References: <20090507184111.023084FC4@hiauly1.hia.nrc.ca> <1241730404.3254.77.camel@mulgrave.int.hansenpartnership.com> <20090507210853.GD30675@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090507210853.GD30675@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> Sadly, I can't seem to reproduce this right now, because strace is dying
> with the ptrace issue JDA brought up earlier. I'll poke at it more
> tonight, but I want to get caught up on the merging first.
>
> cheers, Kyle
>   
Kyle suggested I mention atrace to the strace developers. Maybe others 
here are interested:

http://sourceforge.net/mailarchive/forum.php?thread_name=4A04EB4A.5030204%40tausq.org&forum_name=strace-devel

For all I know, atrace is also horribly broken, but at least it seems to 
be able to trace "ls -l"   :-)

randolph
