From: John David Anglin <dave.anglin@bell.net>
Subject: Happy New Year PARISC
Date: Sat, 31 Dec 2011 19:02:58 -0500
Message-ID: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

After a lot of trial and error, I believe that I have resolved the  
random segmentation faults
on SMP PA8800 and PA8900 systems.  This includes the libgomp hpmc's  
which turned
out to be caused by a non-equivalent alias mapping in libattr (I  
hadn't rebuilt the attr
package because there is a build issue with the current version in  
unstable).  This was
hard to find!

I have started working on setting up magnum for buildd.

Happy New Year,
Dave
--
John David Anglin	dave.anglin@bell.net



