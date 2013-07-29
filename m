From: Helge Deller <deller@gmx.de>
Subject: Re: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Mon, 29 Jul 2013 20:23:40 +0200
Message-ID: <51F6B32C.6010905@gmx.de>
References: <51EF8C52.50403@asianux.com> <51EF8FED.9090903@asianux.com> <1374675095.4634.6.camel@dabdike> <51F06A31.9090408@gmail.com> <51F62C8E.6080003@asianux.com> <BLU0-SMTP611AEF17EB77D8F3C171E397550@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Chen Gang <gang.chen@asianux.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP611AEF17EB77D8F3C171E397550@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/29/2013 03:47 PM, John David Anglin wrote:
> On 29-Jul-13, at 4:49 AM, Chen Gang wrote:
> 
>> After use own built cross compiler (gcc-4.9.0, binutils-2.23.2 with
>> 'hppa64-gchen-linux'), no the related warnings any more.
>>
>> The original compiler which I used ('hppa64-linux-gnu') is incorrect.
> 
> I haven't seen the warning with any recent compiler and possibly your compiler
> selection versus CONFIG_64BIT was wrong.  What does 'hppa64-linux-gnu -v'
> show?
> 
> gcc-4.9.0 is not released and any particular snapshot may be buggy.  Suggest using
> 4.8 branch.

Hi Chen,

I'm using the prebuilt cross-gcc package from Fedora (since my x86_64 machines run Fedora):
https://koji.fedoraproject.org/koji/packageinfo?packageID=13624 (cross-gcc)
https://koji.fedoraproject.org/koji/packageinfo?packageID=13623 (cross-binutils)

If you use debian/ubuntu you could use "alien" to convert it to a debian/ubuntu package.

Helge
