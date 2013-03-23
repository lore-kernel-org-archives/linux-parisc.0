From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Did Squeeze ever make it to HPPA?
Date: Sat, 23 Mar 2013 18:53:58 -0400
Message-ID: <BLU0-SMTP73FA3D9E15C0195C11D97097D50@phx.gbl>
References: <514C43F3.4040206@gmail.com> <514E2703.9000507@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Kurt Fitzner <kurt.fitzner@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <514E2703.9000507@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23-Mar-13, at 6:04 PM, Helge Deller wrote:

> Hi Kurt,
>
> On 03/22/2013 12:43 PM, Kurt Fitzner wrote:
>> I see on the PA-RISC Linux web site a note about Squeeze being  
>> worked on
>> for HPPA.  I also see a few old discussions on the subject here.  Did
>> this ever make it past the discussion stage?
>
> Partly...
>
>> Was there an HPPA testing back in Lenny, or just unstable?  What I am
>> looking for, I suppose, is the most "squeeze-like" packages  
>> available.
>
> - latest before-squeeze unstable packages were moved to debian- 
> ports.org
> - John David Anglin has continued to build current debian "unstable"  
> packages
> - I've provided a download-location at ftp.parisc-linux.org for those.

I would really recommend going with the packages at ftp://ftp.parisc-linux.org/debian-ports/unstable
instead of the squeeze packages on debian-ports.org.  The dependencies  
are somewhat broken for
the stuff on debian-ports.org and great care is needed in installing  
these packages.  For example,
the udev package on debian-ports is a bootstrap breaker.  It might be  
that we could fill in the squeeze
port but it would be a fair bit of work.

>
> So, what you need to do is to drop other lines from your /etc/apt/ 
> sources.list file, and instead add those two lines:
>
> deb ftp://ftp.de.debian.org/debian-ports unstable main
> deb ftp://ftp.parisc-linux.org/debian-ports/unstable  unstable main

For unstable sources, add this line:

deb-src http://ftp.debian.org/debian/ unstable main contrib non-free

>
> This will bring you up to debian-unstable (which is more like  
> wheezy) for the most important packages.
> If you miss specific packages, please let us know.

I'm wondering if we should capture what we have as it's almost  
wheezy.  Soon unstable will start to
diverge for the next release.

You should be aware that I have not built the current kernel package  
as I we need the latest fixes
in the kernel.org tree.

>
> Dave and me are still hoping to be able to set up a buildd-server  
> for parisc again.

Without a buildd-server, it's a bit hard to tell what we are  
missing...  However, we currently have all
the major tool chains that have been ported to hppa.  Thus, most stuff  
can be built from source without
problems.  However, we have problems with openjdk and other similar  
packages that don't
support stack grows up.

>
> Helge


Dave
--
John David Anglin	dave.anglin@bell.net



