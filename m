From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sun, 3 Apr 2005 17:50:38 -0700
Message-ID: <20050404005038.GH8921@tausq.org>
References: <20050403143246.GE8921@tausq.org>
	<200504032041.j33KfpVf018465@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504032041.j33KfpVf018465@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> What's the situation on the following signals: SIGLTHRRES, SIGLTHRCAN
> and SIGLTHRDBG?  I'm not sure but pthread_cond_signal may need SIGLTHRRES.
> Are these signals 37, 38 and 39?

yes, we use the same signals. 

int __pthread_sig_restart = __SIGRTMIN;
int __pthread_sig_cancel = __SIGRTMIN + 1;
int __pthread_sig_debug = __SIGRTMIN + 2;

SIGRTMIN is 37

i think we can reduce the test to a signals test. if you strace the test
program you will see that it's doing a loop of sigprocmask(),
sigsuspend(), wake up by signal, etc.... that may make a test case a bit
simpler.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
