Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 018AE48A8
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Jan 2004 23:44:05 -0700 (MST)
Date: Mon, 5 Jan 2004 01:35:47 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Message-ID: <20040105063547.GC23782@systemhalted>
References: <20040101200318.GB7069@systemhalted>
	<200401012100.i01L0G0L019101@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401012100.i01L0G0L019101@hiauly1.hia.nrc.ca>
Cc: lamont@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
Subject: [parisc-linux] Good news for glibc.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Jan 01, 2004 at 04:00:16PM -0500, John David Anglin wrote:
> > The main issue was that the 'start' symbol needs to be canonicalized
> > before passing on to the gmon routines. This requires entry.h to be
> 
> I still think that using __c_f_f_c for this special case is overkill.

What could we use?

Good news, I just fixed LD_PROFILE so I can actually check to see what
functions take up too much time :) I think I inadvertently fixed it for
ia64 too... what do ia64 people use to profile glibc?

c.

A tempting peek! :)

  %   cumulative   self              self     total
 time   seconds   seconds    calls  us/call  us/call  name
  0.00      0.00     0.00    14000     0.00           cfree
  0.00      0.00     0.00     6000     0.00           memset
  0.00      0.00     0.00     2004     0.00           malloc
  0.00      0.00     0.00     2003     0.00           flockfile
  0.00      0.00     0.00     2003     0.00           funlockfile
  0.00      0.00     0.00     2001     0.00           __cxa_finalize
  0.00      0.00     0.00     1002     0.00           index
  0.00      0.00     0.00     1000     0.00           __GI__dl_close
  0.00      0.00     0.00     1000     0.00           __GI__dl_open
  0.00      0.00     0.00     1000     0.00           printf
  0.00      0.00     0.00     1000     0.00           puts
  0.00      0.00     0.00     1000     0.00           strlen
  0.00      0.00     0.00        1     0.00           __libc_start_main
  0.00      0.00     0.00        1     0.00           realloc
  0.00      0.00     0.00        1     0.00           strrchr
