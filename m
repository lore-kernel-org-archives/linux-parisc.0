From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Tue, 25 May 2004 02:02:51 -0400 (EDT)
Message-ID: <200405250602.i4P62q6W014033__9188.50273960761$1416623455$gmane$org@hiauly1.hia.nrc.ca>
References: <20040525040929.GB1308@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: krypton@ulrich-teichert.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040525040929.GB1308@colo.lackof.org> from "Grant Grundler" at
	May 24, 2004 10:09:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I trust we don't have to worry about HPUX, HP-RT, or MPE and
> issues with gcc/java? :^)

Well, it shouldn't be too much additional work to support gcc/java
under HPUX.  There have been some experiments with unwinding signal
frames for Ada.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
