From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Mon, 4 Apr 2005 20:02:34 -0400
Message-ID: <20050405000234.GH1833@baldric.uwo.ca>
References: <20050403143246.GE8921@tausq.org>
	<200504032041.j33KfpVf018465@hiauly1.hia.nrc.ca>
	<20050404005038.GH8921@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050404005038.GH8921@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 03, 2005 at 05:50:38PM -0700, Randolph Chung wrote:
> i think we can reduce the test to a signals test. if you strace the test
> program you will see that it's doing a loop of sigprocmask(),
> sigsuspend(), wake up by signal, etc.... that may make a test case a bit
> simpler.

Agreed. It looks like sigsuspend just isn't returning and looping
forever in the kernel.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
