Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DB22488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 23:01:17 -0700 (MST)
Date: Sun, 22 Feb 2004 01:00:02 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb: followup
Message-ID: <20040222060002.GI25019@baldric.uwo.ca>
References: <402A42A1000052A9@ocpmta1.freegates.net>
	<Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
	<20040218163927.GC9497@baldric.uwo.ca>
	<4037AB13.3050908@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4037AB13.3050908@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 07:01:39PM +0000, Joel Soete wrote:
> It takes me some more time because I would test patch by patch with gcc-3.3 
> if nothing was broken.
> But all those patch seems ok with gcc-3.3 (just have to revert it and 
> re-run with make -k check ;) )

Yes, it is a lot of work. The fame will all be yours though.
 
> So I have to figure out what goes wrong in "relocation". Can you help me by 
> pointing out some files and may functions to specialy analyse :).

My haiku was really intended to be a joke. Anything could be wrong with
the loader, you have to run it through gdb to get a usefull trace. Even
then you won't have symbols and you'll have to learn to decode the
address from /proc/self/maps and an 'objdump -d xxxxxx.so'. From there
you can find the offending code, go back to the code and examine if it
does anything odd... perhaps isolate what the code does in a testcase
that gcc-3.5 does incorreclty.
 
> BTW: The previous mentioned patch are (afaik) of general interest (not hppa 
> specific) but would you like that I submit you first so that you could 
> submit it to glibc maintainers or do you prefer that i manage that myself?

You should:

a. Make sure that i386 builds with your patches, and passes the
   testsuite without regressions.
b. Cleanup the patches, make *sure* your mailer doesn't wrap them, the
   previous patches were wrapped and broken.
c. Write a 'Changelog' entry for the changes, and describe why you are
   making these changes (e.g. compiling with gcc-3.5). These entries
   have a very special format, look closely, and follow the GNU coding
   convetions.
d. Submit them separately, with a description, changelog, and inline
   patch to the libc-alpha mailing list.

This will be a wonderful learning experience! :)

c.
