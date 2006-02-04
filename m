From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [RFC] Updated glibc 2.3.5-8.1
Date: Fri, 3 Feb 2006 19:11:26 -0500 (EST)
Message-ID: <200602040011.k140BSax027502@hiauly1.hia.nrc.ca>
References: <20060108030342.GA17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060108030342.GA17559@baldric.uwo.ca> from "Carlos O'Donell" at
	Jan 7, 2006 10:03:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Carlos,

> - Removed implied routines for 128-bit long double, default
>   should be whatever gcc uses for long double (DFmode).

There have been a continual stream of patches on the GCC list trying
to fix the 128-bit long-double support for powerpc, etc.  This seems
to be some sort of requirement for glibc 2.4.  The arches supported
by Red Hat are trying to get this into GCC 4.1.

Is this something we need to do right now?  See comment here:
http://gcc.gnu.org/ml/gcc/2006-02/msg00089.html.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
