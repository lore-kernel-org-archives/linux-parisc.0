From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] HPPA autofs broken?
Date: Fri, 25 Feb 2005 06:36:28 +0000
Message-ID: <e6eae029050224223617c7a121__23243.0461598144$1416623677$gmane$org@mail.gmail.com>
References: <FHEGKPBPFFGIFBGOANOKCENEEPAA.h.cochran@comcast.net>
	<Pine.LNX.4.43L0.0502241828350.14272-100000@charity.cs.utah.edu>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Christopher Strong <strong@cs.utah.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.43L0.0502241828350.14272-100000@charity.cs.utah.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 24 Feb 2005 18:39:51 -0700 (MST), Christopher Strong
<strong@cs.utah.edu> wrote:
> 
> I just upgraded my autofs (using apt-get upgrade) and autofs will no longer
> start.  I beat my head against it for a while, upgraded to the newest modutils,
> even tried the beta autofs packages but to no avail.
> 
> It *used* to work before the "upgrade" and I don't know if I have some errors
> in my config file (under the new version) or if there is a problem with the
> autofs package.

Autofs was broken in testing/unstable for quite a while (ie. months), it simply
didn't unmount. About a month ago they fixed it in testing, but it seems it's
*still* broken on parisc :(

I'm currently using the 'stable' release version of autofs on my Debian/testing
system for the time being - at least that one works for me.

Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
