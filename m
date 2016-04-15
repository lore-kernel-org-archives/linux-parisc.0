From: Helge Deller <deller@gmx.de>
Subject: Re: Kernel for bug hunting
Date: Fri, 15 Apr 2016 17:20:46 +0200
Message-ID: <571106CE.2040406@gmx.de>
References: <CACrbsaA0-h9VYXCcQ8x9C++K-kSFSPiBAHye_Jr=urpASfHe=A@mail.gmail.com>
 <5710A91C.4040609@gmx.de>
 <CACrbsaBDN70Q=JxjpsruVNLgi+X262MEQY+zgy1mdOwVmFZB2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Riccardo Schiavi <r.schiavi@evidence.eu.com>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaBDN70Q=JxjpsruVNLgi+X262MEQY+zgy1mdOwVmFZB2A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15.04.2016 16:57, Simone Mannori wrote:
> Inside a clean directory I have cloned the repository
> 
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> 
> and everythings looks OK.
> 
> I have changed directory with to "cd linux-stable/"; then I have
> verified the presence of other branches with "git branch -a"; then I
> have checkout the branch that you told me using
> 
> git checkout -b hppa remotes/origin/linux-4.5.y
> 
> Now the situation looks perfect:
> simone@blsw:~/kernel/git/linux-stable$ git branch
> * hppa
>   master
> 
> GCC looks good:
> simone@blsw:~/kernel/git/linux-stable$ gcc -v

As Dave mentioned, you need the 64bit hppa compiler (gcc-4.9-hppa64).

root@phantom:~# hppa64-linux-gnu-gcc-4.9 --version
hppa64-linux-gnu-gcc-4.9 (GCC) 4.9.3
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Run 
"apt-get install gcc-4.9-hppa64", or even better:
"apt-get build-dep linux"  to get all packages required to build the kernel (see my other mail).

> I'm using your .config untouched.

Try:
make ARCH=parisc oldconfig
make ARCH=parisc vmlinux modules

Helge
