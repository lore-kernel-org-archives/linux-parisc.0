From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Thu, 16 Nov 2006 22:48:52 -0500
Message-ID: <119aab440611161948w5005d083ma170b013409c93c6@mail.gmail.com>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611170148.kAH1moG4028180@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611170148.kAH1moG4028180@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 11/16/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > Is there any opposition to checking in the fix for 3?
> > Speak now or forever hold your peace.
>
> Do it before I change my mind...

Trimming libc-alpha from the list.

Joseph Myers caught me on IRC at work and commented:
"... if you want 128-bit IEEE quad long double support, soft-fp should
work fine ..."

While I believe "work fine" is a relative term, it would require more
work than we have time for right now. I think there are more fun
projects to work on than this. For example I think gdb could use some
TLC for hppa.

Not only that but I have to help bootstrap distros using NPTL.
*waves to ubuntu and gentoo guys*

Don't let me stop you from working on doing a 128-bit IEEE quad long
double support. I will gladly do the "symbol transition" dance if you
get it implemented in gcc.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
