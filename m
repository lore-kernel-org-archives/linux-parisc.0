From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: A warning about NPTL pthreaddefs.h
Date: Mon, 17 Jul 2006 22:24:28 -0400
Message-ID: <119aab440607171924l1d07d066ged80705ae14ea196@mail.gmail.com>
References: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
	<44BC2900.4030303@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44BC2900.4030303@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/17/06, Randolph Chung <randolph@tausq.org> wrote:
> > A warning that the pthreaddefs.h might be horribly wrong. I remember a
> > long while ago adding padding the structures so they matched the size
> > of the linuxthread types (atleast the lock position).
> >
> > This padding is not correct, we would need to pull into our tree the
> > static mutex initializers so they are correctly sized aswell.
>
> fwiw,i don't think we need to worry about making the structs the same as
> linuxthreads (if that is even possible...), after all you cannot run a
> linuxthreads binary against nptl libs or vice versa...

Yes, yes you are. Ulrich's first post of NPTL 1.0 says:
---
The thread library is designed to be binary compatible with the old
LinuxThreads implementation.  This compatibility obviously has some
limitations.  In places where the LinuxThreads implementation diverged
from the POSIX standard incompatibilities exist.  Users of the old
library have been warned from day one that this day will come and code
which added work-arounds for the POSIX non-compliance better be
prepared to remove that code.  The visible changes of the library
include:
---

And he goes on to list things which are not compatible.

Wether or not PARISC can do this is another question. It might not be
possible due to our lock[4] and LDCW linuxthreads implementation.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
