From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc 4.16-rc1 error: ERROR: "$$remU" [drivers/net/tun.ko]
 undefined!
Date: Tue, 13 Feb 2018 14:31:05 -0500
Message-ID: <5abecbed-e50f-e41c-1fd1-a7bcc4768f2a@bell.net>
References: <alpine.LRH.2.21.1802131552240.9153@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.21.1802131552240.9153@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-02-13 8:55 AM, Meelis Roos wrote:
>    MODPOST 9 modules
> ERROR: "$$remU" [drivers/net/tun.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
I believe $$remU comes from the millicode library milli.a.  It is 
bundled with compiler.
Try adding V=1 to the make command so you can see the gcc command for 
the above.

Dave

-- 
John David Anglin  dave.anglin@bell.net

