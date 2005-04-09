From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Sat, 09 Apr 2005 16:57:18 +0000
Message-ID: <4258096E.1050205@tiscali.be>
References: <200504091515.j39FFtij022153@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504091515.j39FFtij022153@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>what's up with gcc-3.3.x?
>>I never reach to complet the glibc build with gcc-3.4 (see detailed investigation in 
>><http://gcc.gnu.org/bugzilla/show_bug.cgi?id=17471>), gcc-3.5 at this time (now gcc-4) seems to solve this pb even thought there was 
>>some other pb to fix with this new compiler ;-S (but not enough time to investigate, sorry)
> 
> 
> I'm not aware of any GCC PRs related to this.
Sorry iirc those new pb wouldn't have to be the object of gcc pr but would more need some small changes in the glibc code to take 
into account the new gcc-4.x (may be some more always_use arrtibute?)

> A few PA specific bug fixes
> have been back ported to 3.3 and 3.4.
>
well mentioned pr #17471 was 2.3.3 glibc and 3.4 gcc related; today 2.3.5 is out, if I find some more free time I will try this new 
2.3.5 glibc with new 4.? gcc

Thanks for feedback,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
