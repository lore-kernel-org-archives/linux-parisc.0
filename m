From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo
Date: Sun, 7 Jan 2007 15:31:30 -0700
Message-ID: <20070107223130.GR24620__7737.88526789776$1416624257$gmane$org@parisc-linux.org>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107151319.GA23478@infradead.org>
	<20070107151817.GN24620@parisc-linux.org>
	<119aab440701071422x2041a7b9lf5361c15a001d954@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701071422x2041a7b9lf5361c15a001d954@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 07, 2007 at 05:22:45PM -0500, Carlos O'Donell wrote:
> On 1/7/07, Matthew Wilcox <matthew@wil.cx> wrote:
> >I think the Right Way to fix this is for some gcc hacker to implement an
> >__attribute__((packed_args)) that changes the calling convention for
> >that function, then we can define asmlinkage to use that on mips and
> >parisc.
> >
> >Any budding gcc hackers out there?  ;-)
> 
> The kernel syscall interface is by definition a different calling
> convention. On parisc the arguments are packed, and we have 6 argument
> registers. Would it be more usefull to say "__attribute__((syscall))"
> and let the compiler DTRT?
> 
> I'm sure this has been proposed by someone else?

That seems like the same as my suggestion, except for the spelling
(syscall vs packed_args).  Did I miss something?

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
