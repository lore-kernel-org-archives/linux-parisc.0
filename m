Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBA6D483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 15:34:42 -0700 (MST)
Message-ID: <3FB01295.10005@tiscali.be>
Date: Mon, 10 Nov 2003 22:35:01 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: vapier@gentoo.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
References: <200311101646.55611.vapier@gentoo.org>
In-Reply-To: <200311101646.55611.vapier@gentoo.org>
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

please send your xfonfig-4 and your dmesg file.

Joel

Mike Frysinger wrote:
> i've been trying to get the framebuffer to work but so far havent had any 
> luck ... i was unable to locate anyone who had a similar problem ...
> 
> Display controller: Hewlett-Packard Comp A4977A Visualize EG (rev 3).
> machine is a C360 ... STI Console works great ...
> tried 2.4.22-pa13 and 2.6.0-test9-pa5 with same exact results
> 
> the frame buffer draws all messed up however ... it only draws on the right 
> quarter of the screen ... the rest of the screen still contains the buffered 
> video as found when the computer was booted (firmware output along with palo 
> stuff) ... the colors are all skewed, basically white is purple along with a 
> few other bit inversions of some sort ...
> also, each line is drawn incorrectly ... it's like each has been split in half 
> horizontally and then swapped ...
> i can get X to load, but again it draws it all messed up in the right quarter 
> on the screen
> 
> i wish i could post a frame buffer grab, but fbgrab doesnt support 8bit and 
> fbscreenshot likes to segfault when writing the png to disk.
> 
> any ideas what i'm missing ?
> or is the fbdriver the only way i can get X and running ?
> -mike
