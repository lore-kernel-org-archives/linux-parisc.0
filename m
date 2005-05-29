From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 18:08:28 -0400
Message-ID: <20050529220827.GF749@baldric.uwo.ca>
References: <200505290141.j4T1ffhI006449@hiauly1.hia.nrc.ca>
	<200505290150.j4T1odcQ006573@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505290150.j4T1odcQ006573@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 28, 2005 at 09:50:38PM -0400, John David Anglin wrote:
> > I can panic my c3750 very consistently running the binutils testsuite
> > (cvs source as of 20050526).  I've tried many of the default kernels
> > to see if I could isolate when the problem was introduced.  The last
> > kernel that seems unaffected is 2.6.8.1-pa11.  The problem is present
> > in 2.6.12-rc5-pa0 and 2.6.11-pa4.
> 
> Hmmm, just noticed that as-new may be using all of the machines memory
> and swap space.

Neither of these situations should kill the kernel.
Why doesn't OOM kill the process?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
