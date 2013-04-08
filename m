From: Helge Deller <deller@gmx.de>
Subject: Re: Did Squeeze ever make it to HPPA?
Date: Mon, 08 Apr 2013 22:03:04 +0200
Message-ID: <51632278.9010109@gmx.de>
References: <514C43F3.4040206@gmail.com> <514E2703.9000507@gmx.de> <BLU0-SMTP73FA3D9E15C0195C11D97097D50@phx.gbl> <5162AFE8.2070808@gmail.com> <5162D4D2.9010903@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kurt Fitzner <kurt.fitzner@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5162D4D2.9010903@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/08/2013 04:31 PM, John David Anglin wrote:
> On 4/8/2013 7:54 AM, Kurt Fitzner wrote:
>> On 23/03/2013 7:53 PM, John David Anglin wrote:
>>> I would really recommend going with the packages at
>>> ftp://ftp.parisc-linux.org/debian-ports/unstable
>>> instead of the squeeze packages on debian-ports.org.  The dependencies
>>> are somewhat broken for
>>> the stuff on debian-ports.org and great care is needed in installing
>>> these packages.  For example,
>>> the udev package on debian-ports is a bootstrap breaker.  It might be
>>> that we could fill in the squeeze
>>> port but it would be a fair bit of work.
>> I've spent some time over the last couple weeks trying to work out an
>> upgrade path to the the unstable packages on parisc-linux.org, but am
>> having a very hard time.  Trying to go from Debian 5 directly to a
>> mostly (but not totally) complete post-6 Wheezy without having through
>> intermediary steps seems to be beyond aptitude (or me) to resolve.  I
>> can handle missing packages, but the number of broken packages aptitude
>> says there will be at the end of an upgrade is daunting.  And I've only
>> got one HPPA box which leaves me a little on the chicken side with
>> respects to playing.
>>
>> I must admit to being less than an expert on Debian's packaging system,
>> mostly because it has always "just worked", but I am wondering if my
>> problems are stemming from the current unstable packages being set as
>> superceding packages that no longer exist in between what I have and them.
>>
>> What I think I really need is a snapshot of what was unstable the day
>> Lenny was officially dropped.  Does this exist anywhere?
> I don't think that exists.  What exists is the snapshot when the unstable hppa packages were
> copied from debian.org to debian-ports.org.  Unfortunately, at that time, there were various
> missing packages.  So, updating would result in many important packages being deleted.
> Further, many packages have common portions that are architecture independent.  However,
> they often are still version dependent.  So, as things evolved, the common parts needed
> for the hppa stuff has disappeared.
> 
> Thus, the only option is to use the packages on ftp://ftp.parisc-linux.org/debian-ports/unstable
> together with what's on debian-ports.org.  In what I upload, I include the common parts from
> debian-ports.org.  So, hopefully, things will not get as inconsistent.
> 
> Last week I uploaded many new packages, so the archive is much closer to the unstable for
> other ports (particularly, for packages starting with [a-l]).  I install all packages that I use before
> uploading so I know that at least on my system there are no broken packages (it started as
> a server system).  However, there's likely still a bunch of stuff that needs updating for desktop
> systems.
> 
> I haven't tried to do an upgrade directly using ftp://ftp.parisc-linux.org/debian-ports/unstable.  Helge
> Deller has done it.  So, maybe he can comment.  

Nothing important on which I can comment here.
Most of my machines were running unstable before the migration to debian-ports happened.
>From there on I just updated all packages with the ones which Dave provided, and
which are now on ftp://ftp.parisc-linux.org/debian-ports/unstable.

Since I mostly don't run desktop-apps I didn't had any bigger issues.

On one of the machines I think I installed the Lenny images and then just updated the packages. 

Helge

