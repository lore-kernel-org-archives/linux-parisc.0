From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Machine stuck when userspace 100% busy
Date: Thu, 25 Oct 2012 09:35:59 +0200
Message-ID: <963c6d479e912919a0c8ad5652936cfe@sf-mail.de>
References: <35fd660c364b9a45770b17a5bd0ecbaf@sf-mail.de>
 <CAE2sS1jmDauox09o6YNin7c4KCdBEt8FuXRadroFxkfAp_ynvQ@mail.gmail.com>
 <0fe1c205e1be1760e357bcfe4f91f593@sf-mail.de>
 <CAE2sS1j6Pg6Hks97NCRNmN40vPvVbfZ+h5Y=s7tETOrT7s_FTA@mail.gmail.com>
 <d61cea15405ee5eb1687d4321aa108aa@sf-mail.de>
 <BLU0-SMTP39CD85B4DFFE0F7F19D78B97780@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP39CD85B4DFFE0F7F19D78B97780@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am , schrieb John David Anglin:
> On 23-Oct-12, at 11:23 AM, Rolf Eike Beer wrote:
>
>> Ok, this is the way I can reproduce it:
>>
>> git clone git://cmake.org/cmake.git
>> cd cmake
>> git checkout cb4bff9882ecb7dbd674cc9d97ac5cd42248f0dc
>> mkdir build
>> cd build
>> cmake ..
>> make
>> ctest
>
>
> I ran this test on my system with the following results:
>
> 94% tests passed, 15 tests failed out of 261
>
> Label Time Summary:
> Label1    =   0.26 sec
> Label2    =   0.26 sec
>
> Total Test time (real) = 11715.14 sec
>
> The following tests FAILED:
>          57 - ExportImport (Failed)
>          65 - Qt4Deploy (OTHER_FAULT)
>          69 - Module.GenerateExportHeader (OTHER_FAULT)
>          91 - SimpleInstall-Stage2 (OTHER_FAULT)
>         111 - complex (OTHER_FAULT)
>         112 - complexOneConfig (OTHER_FAULT)
>         115 - QtAutomoc (OTHER_FAULT)
>         133 - Plugin (OTHER_FAULT)
>         191 - BootstrapTest (Failed)
>         196 - IncludeDirectories (OTHER_FAULT)
>         202 - CMakeOnly.LinkInterfaceLoop (Timeout)
>         210 - CMakeOnly.AllFindModules (Failed)
>         211 - CMakeOnly.TargetScope (Failed)
>         217 - RunCMake.ObjectLibrary (Failed)
>         261 - CMake.CheckSourceTree (Failed)
> Errors while running CTest

This is more or less expected as the version under test contains a bug, 
so of course some of the tests will fail.

BootstrapTest, the Qt*, and CMakeOnly.AllFindModules are not in the 
list of things that I expected to fail. Please send me your 
Testing/Temporary/LastTest.log so I can look what the problem was with 
them. CMake.CheckSourceTree will fail if you used my commands, as you 
then have the untracked "build" directory in your source tree. So if you 
kill the build dir and put it somewhere outside the checkout and use 
"cmake /path/to/source" instead of "cmake .." this will succeed. The 
CMakeOnly.AllFindModules _could_ be a problem related to multiarch 
include directories, but that one is usually harmless.

> System didn't hang.
>
> Machine: rp3440
> Kernel: 3.6.2+ (JDA changes)
> libc: debian 2.13-35
>
> If you have fixes for any of the above fails let me know.

This is an SMP system, I bet that makes a difference for this sort of 
problem. Can you try booting with nosmp?

Btw: boot with nr_cpu=1 will make the kernel go mad, although I would 
have expected it to behave exactly like nosmp. At least when I last 
tested it.

Eike
