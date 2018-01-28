From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date: Sun, 28 Jan 2018 14:01:25 -0500
Message-ID: <5A6E1E05.1050402@bell.net>
References: <11946948.1Lt8Nslq4k@devpool21>
 <57873f7fe3e5227fcf2f4ed20407f2b6@sf-tec.de>
 <2a632168-7608-736b-22df-64ca702b34d5@gmx.de>
 <2594108.Soefd0VDuM@daneel.sf-tec.de>
 <d071a2c0-fb08-639e-36ef-b769e195cfff@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d071a2c0-fb08-639e-36ef-b769e195cfff@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-01-27 1:41 PM, Helge Deller wrote:
> As I said before, I can't reproduce this on debian.
> gdb does not (and never has) crash(ed) the system, as can be seen in the various build logs:
>   https://buildd.debian.org/status/logs.php?pkg=gdb&arch=hppa
I just built binutils-gdb trunk successfully.

Dave

-- 
John David Anglin  dave.anglin@bell.net

