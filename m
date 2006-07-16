From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Warning about bad kernel headers.
Date: Sun, 16 Jul 2006 18:52:25 -0400
Message-ID: <119aab440607161552m46535c72g1d6cb0f9f35226f4@mail.gmail.com>
References: <119aab440607151526n1318ba80l2523528ac607eaae@mail.gmail.com>
	<200607161739.50494.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607161739.50494.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/16/06, Mike Frysinger <vapier@gentoo.org> wrote:
> On Saturday 15 July 2006 18:26, Carlos O'Donell wrote:
> > A quick warning, if your kernel headers file unistd.h contain "#define
> > PIC" then remove this line. It will cause all sorts of havoc when
> > building glibc. It won't be immediately visible when building, and
> > infact ld.so can compile quite happily and run with mixed pic non-pic
> > code.
>
> i dont use debian, but i assume your headers were trying to work with the fact
> that it does 'extern int errno' which can break in nasty ways when errno.h
> hasnt also been included ?

No, this was just dumb code I comitted years ago without understanding
what I was doing :)

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
