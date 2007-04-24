From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] do_page_fault
Date: Tue, 24 Apr 2007 07:33:56 -0600
Message-ID: <20070424133356.GB32449__6566.14560070938$1416624342$gmane$org@parisc-linux.org>
References: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba@mail.gmail.com>
	<462DE6E8.10004@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Julian Stecklina <der_julian@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <462DE6E8.10004@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 24, 2007 at 01:15:52PM +0200, Julian Stecklina wrote:
> I saw these for testcases of libsigsegv, a very simple library which is 
> used to handle page faults in user space. This is normal for garbage 
> collected languages, as stock hardware provides no other efficient means 
> to implement write barriers to memory other than making the respective 
> pages read-only. Page faults under Unix-like systems are slow enough for 
> these purposes, so one should not print a complete register dump in the 
> handler...

It's a compile-time option.  I'd be all in favour of turning it off by
default, if only it weren't so darned useful when debugging userspace ...

Maybe someone should make it a prctl?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
