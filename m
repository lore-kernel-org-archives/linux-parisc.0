From: Helge Deller <deller@gmx.de>
Subject: Re: unshare (CLONE_NEWUTS)
Date: Sat, 1 Apr 2017 18:48:07 +0200
Message-ID: <86f4251f-26eb-ded4-be41-b78d0a8f7d5c@gmx.de>
References: <74D018A3-5DD0-44EB-8D05-CEF787666249@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: John David Anglin <dave.anglin@bell.net>,
        "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <74D018A3-5DD0-44EB-8D05-CEF787666249@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01.04.2017 18:08, John David Anglin wrote:
> We don't seem to support unshare (CLONE_NEWUTS):

We do.

> dave@mx3210:~/unshare$ ./unshare
> warning: unshare (CLONE_NEWUTS) failed: Operation not permitted
> dave@mx3210:~/unshare$ su
> Password: 
> mx3210:/home/dave/unshare# ./unshare
> warning: unshare (CLONE_NEWUTS) failed: Invalid argument
> 
> This appears to cause a couple of glibc tests on trunk to fail.

Your kernel needs to be compiled with UTS support.
Testcase works on phantom (debian default kernel).

Helge
