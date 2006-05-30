From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc tls linuxthreads failure baseline.
Date: Tue, 30 May 2006 11:00:42 -0400 (EDT)
Message-ID: <200605301500.k4UF0gk0014775@hiauly1.hia.nrc.ca>
References: <200605301407.k4UE71cL014247@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605301407.k4UE71cL014247@hiauly1.hia.nrc.ca> from "John David
	Anglin" at May 30, 2006 10:07:00 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Usual long-double problem.

> Debian has had a one-line glibc patch installed for some time to

Patch is shown below.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

2005-06-18  Carlos O'Donell <carlos@systemhalted.org>

	* sysdeps/hppa/hppa1.1/Implies: Remove ldbl-128.

===================================================================
RCS file: /var/lib/cvs/glibc/sysdeps/hppa/hppa1.1/Implies,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- glibc/sysdeps/hppa/hppa1.1/Implies	2005/06/08 20:32:10	1.2
+++ glibc/sysdeps/hppa/hppa1.1/Implies	2005/07/18 04:32:31	1.3
@@ -1,4 +1,3 @@
 wordsize-32
 ieee754/flt-32
 ieee754/dbl-64
-ieee754/ldbl-128
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
