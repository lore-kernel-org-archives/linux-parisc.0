From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] long double on hppa64-*-linux*
Date: Sat, 4 Feb 2006 18:41:00 -0500 (EST)
Message-ID: <200602042341.k14Nf0P9005946@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Feb 3, 2006 07:11:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I noticed another long double issue.  Long double is defined to be 128
bits on all 64-bit targets on the PA.  I believe that it should be 128 bits
only on hpux.

I would like to change the long double default on PA64t o 64 bits as there
isn't any hardware support for the 128-bit type, and we currently don't
have software support for 128-bit long doubles implemented.  I can't see
this affecting anything, but it's another ABI change and I thought I should
ask.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
