From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Kernel for bug hunting
Date: Fri, 15 Apr 2016 09:39:28 -0400
Message-ID: <5710EF10.5080401@bell.net>
References: <CACrbsaA0-h9VYXCcQ8x9C++K-kSFSPiBAHye_Jr=urpASfHe=A@mail.gmail.com>
 <5710A91C.4040609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Helge Deller <deller@gmx.de>,
	Simone Mannori <simone.mannori@gmail.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5710A91C.4040609@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-04-15 4:41 AM, Helge Deller wrote:
>> Q3: Which GCC version? (4.x ? 5.x ?)
> gcc-4.9.
> Get's installed when you run "apt-get build-dep linux".
For c8000, you need 64-bit tools: gcc-4.9-hppa64.  4.9 is best tested 
but gcc-5
should work fine with recent kernels (gcc-5-hppa64-linux-gnu package).  
gcc-5
is used to build most packages, so the 32-bit version has been 
extensively tested.

Don't build debian config.  It takes too long as it builds almost 
everything.  Full
build of a c8000 specifig config takes about 30 minutes at -j8.

Dave

-- 
John David Anglin  dave.anglin@bell.net

