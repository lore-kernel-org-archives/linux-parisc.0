From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Wed, 14 Aug 2013 19:36:01 -0400
Message-ID: <BLU0-SMTP28D21C5E1F517BD3CB235C97450@phx.gbl>
References: <A7728478-8754-4B8E-81DD-CDB70165FFAB@p0n4ik.tk> <E820CE4C-248F-49CF-84F3-1E0A219133C9@p0n4ik.tk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <E820CE4C-248F-49CF-84F3-1E0A219133C9@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10-Aug-13, at 3:56 PM, Alex Ivanov wrote:

>> I've tried this one and many other things (except the messing with  
>> endianness) so far. The error is
>> still there.
>


Alex, I don't know which distro your using but I built and uploaded a  
new debian build of mesa and some packages it
depends on to the parisc archive.  Mesa and the open source ATI driver  
build without problems on parisc.  However, this
thread suggests we need to go backwards to resolve the endian issues:
http://forums.gentoo.org/viewtopic-p-7128758.html

I have a RV100 in my rp3440 that I may play a bit with if I get a  
chance.

While this might be a kernel issue, I suggest that the bug needs to be  
filed on the relevant distro package list and
maybe on the package source list as well.

Dave
--
John David Anglin	dave.anglin@bell.net



