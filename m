From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Machine stuck when userspace 100% busy
Date: Tue, 23 Oct 2012 17:23:41 +0200
Message-ID: <d61cea15405ee5eb1687d4321aa108aa@sf-mail.de>
References: <35fd660c364b9a45770b17a5bd0ecbaf@sf-mail.de>
 <CAE2sS1jmDauox09o6YNin7c4KCdBEt8FuXRadroFxkfAp_ynvQ@mail.gmail.com>
 <0fe1c205e1be1760e357bcfe4f91f593@sf-mail.de>
 <CAE2sS1j6Pg6Hks97NCRNmN40vPvVbfZ+h5Y=s7tETOrT7s_FTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1j6Pg6Hks97NCRNmN40vPvVbfZ+h5Y=s7tETOrT7s_FTA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am , schrieb Carlos O'Donell:
> On Mon, Oct 22, 2012 at 10:07 AM, Rolf Eike Beer 
> <eike-kernel@sf-tec.de> wrote:
>>> Get on the serial console and see if you can login?
>>
>>
>> Was not possible, but because of something I broke on the other side 
>> of the
>> serial line (i.e. no fault of the C3600).
>>
>>
>>> Then issue a magic-sysrq+t? What's userspace doing?
>>
>>
>> I went down to the machine and it was happily heartbeating as 
>> expected when
>> the kernel still is able to send out ping replies. I pushed the 
>> power button
>> and it shut down cleanly in something like half a minute. Poweron 
>> did work
>> fine.
>>
>> I see in the logs one OOM event during the CMake tests. Afterwards I 
>> see for
>> another 10 minutes some nagios events, so it took a while after the 
>> OOM for
>> the machine to freak out, and things like creating new processes was 
>> no
>> problem until then.
>>
>> I have no deeper insight in what happened later beyond what I 
>> already have
>> written.
>
> Without more information it's hard to determine what went wrong.

Ok, this is the way I can reproduce it:

git clone git://cmake.org/cmake.git
cd cmake
git checkout cb4bff9882ecb7dbd674cc9d97ac5cd42248f0dc
mkdir build
cd build
cmake ..
make
ctest

The test RunCMake.ObjectLibrary (208 of 253 for me) will then hang the 
machine. It will not hang the machine when run on it's own.

Kernel: 3.6.2
glibc: GNU C Library stable release version 2.14.1, by Roland McGrath 
et al.
RAM: 512 MiB
Swap: 2GiB

Eike
