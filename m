Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail11.speakeasy.net [216.254.0.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BBFF4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jun 2003 22:16:55 -0600 (MDT)
Date: Sat, 28 Jun 2003 00:17:01 -0400
Subject: Re: [parisc-linux] Getting XF86 to run on a C-180 box
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: gentoo-user@gentoo.org,
	PA-RISC Users <parisc-linux@lists.parisc-linux.org>
To: Rod Smart <snaketails@optusnet.com.au>
From: Charles Slivkoff <caslivkoff@speakeasy.net>
In-Reply-To: <3EF99C53.7070200@optusnet.com.au>
Message-Id: <5DC820FC-A91F-11D7-830E-000393581E44@speakeasy.net>
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

On Wednesday, Jun 25, 2003, at 08:57 US/Eastern, Rod Smart wrote:

>    I have a C-180 Visualize RISC system with a (GSC) "A4070" video  
> card with a "A4747" daughter card.

>    I would like to get this thing into doing something more than  
> heating my bedroom, so I am wondering if anyone has a XF86Config file  
> that I could get the video driver settings for the above card  
> configuration.
>
>    I have tried "fbdev" but even at Depth=8 I have not been able to  
> get xfree running.

That should work provided you have a "1280x1024" mode defined and set  
the "fbdev" option to "/dev/fb1". But, I suppose you want fb0, right?

>
>    I searched through the old mail archives but I couldn't find much  
> more than the "fbdev" setup.

This thread should help:

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/ 
019064.html

>    When I do the  command line from one of the mail list messages i  
> get the following.
>
> vorlon portage # dmesg | grep stifb
> fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:  
> 0xf8100000
> fb1: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio:  
> 0xfa100000
>
>    I'm not sure what this means, but I think the "-8" and the "-32" is  
> the depth.

That is correct, and the "1280x1024" corresponds to the resolution as  
specified in the PDC. IIRC, the A4070-* devices (HCRX family) only  
worked at this resolution, but might be switchable between 75hz VESA  
(separate H/V sync) and 72hz (sync-on-green). If your monitor is not  
receiving a sync signal use a serial console (power-on with the PS/2  
keyboard detached, 9600/8/n/1) and try the "co mo" command to view the  
video setting. "co mo list" should give you a list of options available  
for each of your two devices.

BTW, you might want to grab copies of the service manual & owner's  
guide for future reference:

http://h20000.www2.hp.com/bizsupport/TechSupport/ 
DocumentIndex.jsp?contentType=SupportManual&docIndexId=120929&locale=en_ 
US&prodTypeId=12454&prodSeriesId=44435

-chuck
