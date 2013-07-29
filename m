From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Mon, 29 Jul 2013 09:47:32 -0400
Message-ID: <BLU0-SMTP611AEF17EB77D8F3C171E397550@phx.gbl>
References: <51EF8C52.50403@asianux.com> <51EF8FED.9090903@asianux.com> <1374675095.4634.6.camel@dabdike> <51F06A31.9090408@gmail.com> <51F62C8E.6080003@asianux.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F62C8E.6080003@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29-Jul-13, at 4:49 AM, Chen Gang wrote:

> After use own built cross compiler (gcc-4.9.0, binutils-2.23.2 with
> 'hppa64-gchen-linux'), no the related warnings any more.
>
> The original compiler which I used ('hppa64-linux-gnu') is incorrect.

I haven't seen the warning with any recent compiler and possibly your  
compiler
selection versus CONFIG_64BIT was wrong.  What does 'hppa64-linux-gnu - 
v'
show?

gcc-4.9.0 is not released and any particular snapshot may be buggy.   
Suggest using
4.8 branch.

Dave
--
John David Anglin	dave.anglin@bell.net



