From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Breaking PARISC ABI - Testing procedures?
Date: Tue, 27 Aug 2002 11:31:02 -0400 (EDT)
Message-ID: <200208271531.g7RFV2qR017083__9921.84351566738$1416621653$gmane$org@hiauly1.hia.nrc.ca>
References: <20020826194135.GC632@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020826194135.GC632@systemhalted> from "Carlos O'Donell" at Aug 26, 2002 03:41:35 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 3- sizeof(long double) is incorrect in gcc and glibc (?)

This also needs to be fixed under 64-bit hpux.  Need to determine
the calling convention for long doubles.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
