From: Julian Stecklina <der_julian@web.de>
Subject: Re: [parisc-linux] do_page_fault
Date: Tue, 24 Apr 2007 13:15:52 +0200
Message-ID: <462DE6E8.10004__22982.2943256751$1416624341$gmane$org@web.de>
References: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Jeff Bailey wrote:
> I've googled a bit and am having trouble finding a guide to interpret
> a do_page_fault message.  Are these the result of a userspace app
> behaving poorly?  I'm going to try and reduce this to a test case over
> the next few days.

I saw these for testcases of libsigsegv, a very simple library which is 
used to handle page faults in user space. This is normal for garbage 
collected languages, as stock hardware provides no other efficient means 
to implement write barriers to memory other than making the respective 
pages read-only. Page faults under Unix-like systems are slow enough for 
these purposes, so one should not print a complete register dump in the 
handler...

Btw, if someone with a good insight into signal handling has some time: 
I am currently investigating why libsigsegv's testcases all fail. I have 
a patched version that fixes some typos in the configure script to let 
it detect the platform correctly here: 
http://www.inf.tu-dresden.de/~s1054849/libsigsegv-2.4-hppa.tar.gz

Just configure && make && make check.

tests/sigsegv1 gets a wrong fault address (0) in the handler and aborts.

The rest of the test cases just get a SIGSEGV and die, indicating that 
the handler isn't even called.... I am clueless. Any help is greatly 
appreciated.

Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
