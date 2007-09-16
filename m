From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] pthread_attr_getstack(): SEGV using ptr
	stack_addr - stack_size
Date: Sun, 16 Sep 2007 12:17:13 -0400
Message-ID: <119aab440709160917q1451a561i3e7724edfa89fedc__16142.6896848299$1416624442$gmane$org@mail.gmail.com>
References: <200709151832.l8FIWWBw007130@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200709151832.l8FIWWBw007130@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 9/15/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> Carlos,
>
> We have a problem with libjava.  The details are here:
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=33442
>
> The problem seems to be pthread_attr_getstack.  It looks like
> we aren't rounding the returned stack_addr value correctly to
> ensure that stack_addr - stack_size is equal to or larger than
> the stack base for a thread.

I will look into this. Thanks Dave. Would you like a patch against the
current debian glibc? The  patch I checkin upstream won't be much use
for you :-)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
