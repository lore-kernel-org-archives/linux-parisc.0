From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Mon, 24 Apr 2006 12:56:06 -0400 (EDT)
Message-ID: <200604241656.k3OGu6Tq027920@hiauly1.hia.nrc.ca>
References: <IY8K1U$8FE099F66A8462E832C7AFDC38E1A3E1@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IY8K1U$8FE099F66A8462E832C7AFDC38E1A3E1@scarlet.be> from "Joel
	Soete" at Apr 24, 2006 06:49:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> btw: just as game, I rebuild glibc-2.3.6 + my clone patch with gcc-4.1 and
> with same src and same kernel (results vary a very few with kernel release?),

Have you tried rebuilding GCC with your new library?  I'm interested
in knowing how the fortran and libstdc++ testresults turn out.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
