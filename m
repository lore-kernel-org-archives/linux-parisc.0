From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Thu, 16 Sep 2004 10:31:10 -0400
Message-ID: <20040916143109.GA28936@baldric.uwo.ca>
References: <20040914160613.GA28659@tausq.org>
	<20040914223655.GP9763@baldric.uwo.ca>
	<41487C05.3010606@tiscali.be> <41487D4C.2020004@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41487D4C.2020004@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 15, 2004 at 05:35:08PM +0000, Joel Soete wrote:
> Out of Memory: Killed process 1760 (test-lws).
> Out of Memory: Killed process 1762 (test-lws).

Yeah, you can't let this happen. The test is a bit rough on your box,
I've always turnes OOM off and minimized the number of *other* running
processes. The test (I think) has a tunable for memory to try capture
before running the CAS. That particular part of the test is trying to
see if CAS'ing on swapped pages is atomic or non-atomic by signaling the
process during a write to a swapped page.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
