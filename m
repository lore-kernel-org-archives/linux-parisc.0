Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33DD8486E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 07:51:52 -0700 (MST)
Message-ID: <402E361C.7090401@tiscali.be>
Date: Sat, 14 Feb 2004 14:52:12 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
References: <20040211162702.GI990@baldric.uwo.ca>
	<402A4CA500001B4D@ocpmta2.freegates.net>
	<20040213194906.GA6760@baldric.uwo.ca>
	<20040214001729.GA4727@colo.lackof.org>
In-Reply-To: <20040214001729.GA4727@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Grant Grundler wrote:
> On Fri, Feb 13, 2004 at 02:49:08PM -0500, Carlos O'Donell wrote:
> 
>>Aggressive inlining, and inlining mistakes might cause the function to 
>>disapper. Unless you can produce a *small* testcase the gcc team will
>>not look at the bug. You can't say "glibc doesn't build with gcc-3.5"
>>... well I guess you can, but nobody will have a clue how to fix the
>>issue.
> 
I understand, so better try to find a fix myself?
In the mean time, as James find the shmem BUG(), I take a more to time to look for gcc ml archive ;)
And I find on gcc-help a another pb of asm inlining <http://gcc.gnu.org/ml/gcc-help/2004-02/msg00076.html>
and advise of change <http://gcc.gnu.org/ml/gcc-help/2004-02/msg00077.html>.
If I don't reach to find an elegant solution, can I also address some messages on gcc-help ml?
> 
> And he should say *something*.
> Pointing at the problem is a first step towards fixing it.
> Don't wait until you have a "small" test case to point out a problem
> since one might never (have time to) find one.
> 
> Even though I fix very few bugs these days, I'm grateful for
> every bug report.
> 
Thanks to all for advise and attention,
	Joel
