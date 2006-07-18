From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 14:22:30 -0600
Message-ID: <20060718202230.GA23947@parisc-linux.org>
References: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
	<44BD0369.3090905@tausq.org>
	<119aab440607181230l3abcf965y5afe9fe6901e36d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607181230l3abcf965y5afe9fe6901e36d7@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 18, 2006 at 03:30:40PM -0400, Carlos O'Donell wrote:
> On 7/18/06, Randolph Chung <randolph@tausq.org> wrote:
> >tausq@riot:~$ gcc-4.1 -Wall -o alloca alloca.c; ./alloca
> >ptr = 0xc04ca590
> >old = 0xc04ca3d0
> >&old[100] = 0xc04ca560
> 
> I thought so, if this code is ever execute it will be wrong.
> 
> I think our tst-printfsz failure is related to this code trying to
> expand the specs and getting the wrong answer.
> 
> Michael, want to write a patch to fix this for glibc? :)
> I'll support you on libc-alpha!
> 
> In glibc I don't think the code should be a runtime check at all,
> there are STACK_GROWS_UP macros that should be used.

How about just using min(ptr, old)?  ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
