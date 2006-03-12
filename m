From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sat, 11 Mar 2006 21:10:56 -0500 (EST)
Message-ID: <200603120210.k2C2AvIw012101__37342.6364422359$1416624585$gmane$org@hiauly1.hia.nrc.ca>
References: <4412FACA.2010102@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4412FACA.2010102@tausq.org> from "Randolph Chung" at Mar 12,
	2006 00:28:58 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> but *(%ret0-4) points inside the text section, so r22 eventually gets 
> loaded with an instruction value (0x4fd23f01 == ldw,mb -80(sp),r18)

r22 should be pointing to a function descriptor and have the plabel
bit set.  It's a relative rare situation when an indirect call can
be made directly (no shared libraries).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
