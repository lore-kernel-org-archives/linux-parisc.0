From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Improve LWS-CAS performance
Date: Wed, 14 May 2014 21:12:41 +0200
Message-ID: <5373C029.8080504@gmx.de>
References: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl> <CAE2sS1i7gDUwq+bRoSNhw+kCBsA-cDAzHs4O03yHuWUxqJE-wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1i7gDUwq+bRoSNhw+kCBsA-cDAzHs4O03yHuWUxqJE-wQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/14/2014 05:31 AM, Carlos O'Donell wrote:
> On Sun, May 11, 2014 at 6:40 PM, John David Anglin <dave.anglin@bell.net> wrote:
>> 2) Removes the lock code on UP systems where it is not needed, and
> 
> This is wrong. The locking was originally only for SMP, but at one
> point it was discovered that you could COW during the CAS operation
> and if you didn't take the lock in UP, you could re-enter the CAS via
> another task and thus incorrectly carry out the CAS in two different
> threads and corrupt the state. While we attempt our best to prevent
> the task running the CAS from being scheduled off, the COW operation
> trap and subsequent scheduling is not something I could find an easy
> way to prevent. Therefore the solution was to use locks for both UP
> and SMP.

If so, could one of you please send an updated patch to the list...?
Currently I've scheduled http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=f4030047d92c79344ac4ca6ad4c6e3e22ceb5a55
for inclusion into the next kernel (hopefully 3.15).

Helge
