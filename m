From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Thu, 7 Oct 2004 18:39:40 -0400
Message-ID: <20041007223940.GM24430@baldric.uwo.ca>
References: <4161729B000014F1@mail-1-bnl.tiscali.it>
	<4161729B00001526@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161729B00001526@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I look forward and encounter:
> <http://sources.redhat.com/ml/glibc-cvs/2004-q4/msg00074.html>
> 
> It seems an evidence to just change errno to rtld_errno symbol for those
> other arch but for hppa I realy didn't encounter this variable name, what
> did I missed (certanly a macro but which one?)

Please please please, if you are going to quote other arches, read the
code before commenting.

i386 code is ancient and manipulates errno directly. We use the generic
code which is always kept up to date. Notice how alpha and ia64 didn't
need to be fixed? Neither do we :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
