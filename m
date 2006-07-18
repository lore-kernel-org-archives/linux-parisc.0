From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 16:49:15 -0400
Message-ID: <119aab440607181349g7eb17c25m5b5aa96a7482d7ba@mail.gmail.com>
References: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
	<44BD0369.3090905@tausq.org>
	<119aab440607181230l3abcf965y5afe9fe6901e36d7@mail.gmail.com>
	<20060718202230.GA23947@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060718202230.GA23947@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/18/06, Matthew Wilcox <matthew@wil.cx> wrote:
> > In glibc I don't think the code should be a runtime check at all,
> > there are STACK_GROWS_UP macros that should be used.
>
> How about just using min(ptr, old)?  ;-)

You're almost there Matthew, just a little more, and I'll be able to
list your name in the libc-ports ChangeLogs :-)

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
