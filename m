From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 09:02:27 -0700
Message-ID: <20050104160227.GA28074@colo.lackof.org>
References: <20050103061910.GJ15061@colo.lackof.org>
	<20050104061342.GE18497@tausq.org>
	<200501040851.19806.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501040851.19806.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 04, 2005 at 08:51:19AM -0600, Michael S. Zick wrote:
> One other possibility to keep in mind when testing: this is an
> io sequence, no heavy register-register computations.

Not entirely. Sure, to load data into cache it's "io".
But the bulk of the loop is to move data from one cacheline
to another.

> You might have to borrow a buss analyzer from the hardware
> lab to see if this is effecting your tests.

I don't. If 6-regs works better then I use it.
If CPU performance counter support worked, we could figure
out where the bottlenecks were for both cases.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
