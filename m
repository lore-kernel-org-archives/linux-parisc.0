Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 853D84830
	for <parisc-linux@parisc-linux.org>; Thu, 11 Sep 2003 14:56:36 -0600 (MDT)
Message-ID: <3F60E184.5010603@tiscali.be>
Date: Thu, 11 Sep 2003 20:56:36 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Sebastian_Br=FCckner?= <sebastian.brueckner@epost.de>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] HP B132L hangs
References: <3F5F24D9.7030800@epost.de> <3F5F2D4E.7040700@tiscali.be> <3F6095B6.7050706@epost.de>
In-Reply-To: <3F6095B6.7050706@epost.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Sebastian Brückner wrote:

> Joel Soete:
>
>> Yes it looks like a disk becoming defective. The best way to be sure 
>> is to use a hp cdrom containing Diagnostic tools (iirc the last hpux 
>> support + would contains it). This cd is bootable and contains tools 
>> allowing you test your disk.
>
>
> I don't have such a cd...
> I have only two HP cd sets:
> "HP-UX Applications/Patches 10.20" 5 CDs
> "Additional Core Enhancements HP-UX 10.20 Workstations" 1 CD 

I also get such set of cd's when I recieved the first b132 (it was also 
one of the first in belgium) and I think that tools would be on the 
patch cd but i don't remember exactly. I will check when I will be back 
to the office (in 10 days :( sorry)

>
>
> Do you know if one of them contains these tools?
>
>> If you have another system on which you can connect your suspected 
>> disk you can also try a dd cmd like:
>> dd if=/dev/rdsk/c0txd0 of=/dev/null bs=2048k (where you replace 
>> /dev/rdsk/c0txd0 by the actual disk path)
>
>
> See my other post for results of backup... it provoced the same (or at 
> least a similar) error :-/

Yes I read it also and as mentioned Grant "I/O error:..." message 
confirm my first opinion (and my experience with my b180 near the same 
b132L execepted cpu frequency) unfortunaltely your disk became faulty 
(the most frequent part replaced over 300 unix server I have to maintain)

>
> I do not currently have another system I could put the disk in (I got 
> a C200 but it is not in a working state right now). The disk does not 
> contain too important data - but it was a lot of work to set up the 
> router. 


So the best would be to try to backup the most of your /etc (where stand 
generaly config files), additonal config files that you remember, and 
may be also your /var/lib/dpkg (the debian pakages db: it could help to 
remember which packages where installed).  Then, if you can,  replace 
your disk, and re-install your system.

I also had to reinstall two systems like this this year: one because of 
a cpu failure (a b2k) and one also due a disk failure. (I would so have 
a look for tools as mkcdrecord or mondo [don't know which is the most 
simple to implement] but i do not yet find enough time to build any 
recovery cd. On the other hand i had the opportunity to install raid1 on 
my main systems (2 b180; a fw and a test one for cvs kernels and 
unstable debian install)).

Good luck,
    Joel
