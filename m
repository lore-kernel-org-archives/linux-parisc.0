From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: [PATCH] Update HPPA LinuxThread implementation and remove old .dpatch's
Date: Mon, 3 Mar 2003 08:19:59 -0500
Message-ID: <20030303131959.GZ3009__2663.53515112332$1416622253$gmane$org@systemhalted>
References: <20030302164816.GF3009@systemhalted> <80wujhaw8r.wl@oris.opensource.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
To: GOTO Masanori <gotom@debian.or.jp>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <80wujhaw8r.wl@oris.opensource.jp>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Excellent :)
> 
> Thanks, but should it apply in 2.3.1-15?  I would like to delay to
> apply it in 2.3.2-1.

It will work with -15, HPPA will FTBS under 2.3.2-1 because we haven't
written the sysdep-cancel support yet. The timeline for that looks like
atleast 2 weeks.

c.
