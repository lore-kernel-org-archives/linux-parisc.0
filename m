From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: [parisc-linux] PA-Linux version of libunwind
Date: Sat, 4 Dec 2004 17:19:47 -0800
Message-ID: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
Reply-To: davidm@hpl.hp.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

I have started to add PA-Linux support to Libunwind.  At the moment,
I'm only targeting DWARF2 unwind info (not the SOM-style PARISC
unwind-records) and not everything is implemented/working yet.  Even
so, many tests in the built-in test-suite already succeed.  Thus, I
think that even in this early state, others may have some use for it
so I thought it might be a good idea to mention it on this list (and
of course, bug-fixes/contributions are always welcome, too ;-).

At the moment, the PA Linux support is available only via the
bitkeeper repository at:

	bk://unwind.bkbits.net/libunwind/

If you want to play with this, just be sure to read the README.

A brief blurb on what libunwind is about is attached below.  For more
details, see:

  http://www.hpl.hp.com/research/linux/libunwind/intro.php4

The web-site also hosts the man-pages for the libunwind API and has
info on the libunwind mailing list.

Enjoy,

	--david

--
Libunwind is a portable and efficient C API to enable call-chain
introspection.  Some examples for what it can be used include:

    exception handling
        The libunwind API makes it trivial to implement the
        stack-manipulation aspects of exception handling.

    debuggers
        The libunwind API makes it trivial for debuggers to generate
        the call-chain (backtrace) of the threads in a running
        program.

    introspection
        It is often useful for a running thread to determine its
        call-chain. For example, this is useful to display error
        messages (to show how the error came about) and for
        performance monitoring/analysis.

    efficient setjmp()
        With libunwind, it is possible to implement an extremely
        efficient version of setjmp(). Effectively, the only context
        that needs to be saved consists of the stack-pointer(s).
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
