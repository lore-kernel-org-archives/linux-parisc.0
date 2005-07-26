From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 22:25:44 +0800
Message-ID: <42E647E8.3000505@tausq.org>
References: <1122036994.10454.131.camel@thor.tres.org>	<20050725000919.GA18659@colo.lackof.org>	<1122272788.10644.71.camel@thor.tres.org>	<20050726132402.GA32722@colo.lackof.org>	<1122385036.10644.146.camel@thor.tres.org>
	<20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Tres Melton <tres@mindspring.com>,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> User space should not "know" what HZ the kernel is using.  Instead, all
> interfaces should be properly reported in terms of whatever HZ userspace
> used to assume (100 on i386, other values on other platforms).  I don't
> know what interface gprof is using, but it needs to be fixed.

I thought gprof uses a SIGPROF timer using the setitimer interface. Why 
is it HZ dependent?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
