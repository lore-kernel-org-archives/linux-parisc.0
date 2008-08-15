From: Helge Deller <deller@gmx.de>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Fri, 15 Aug 2008 17:09:27 +0200
Message-ID: <48A59C27.8090706@gmx.de>
References: <20080814212422.447EC4E4A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080814212422.447EC4E4A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> The problem is really caused by hw/xfree86/fbdevhw/fbdevhw.c.
>>
>> The driver sets a video mode and then checks if the syscall modified the 
>> parameters with the function fbdev_modes_equal():
> 
> The maintainers for the fbdevhw.c and fbmem.c files need to be contacted
> to determine what fbmem.c is allowed to change and what what fbdev_modes_equal
> should be checking.  It's possible Debian is messing with the code as well,
> so a Debian bug report wouldn't hurt.

I've opened a xorg bugzilla for now:
https://bugs.freedesktop.org/show_bug.cgi?id=17153

Helge
