From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Sun, 5 Sep 2004 22:47:57 -0400 (EDT)
Message-ID: <200409060247.i862lvIU001539@hiauly1.hia.nrc.ca>
References: <413B222D.8040601@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <413B222D.8040601@tiscali.be> from "Joel Soete" at Sep 5,
	2004 10:26:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > ../sysdeps/generic/unwind-dw2.c:1021: warning: 
> > 'fallback_frame_state_for' defined but not used
> > rtld.c:730: warning: implicit declaration of function 

This problem in serious and needs to be fixed.  The function
fallback_frame_state_for is needed.  It is only called from an asm and
gcc doesn't know about calls from asm's.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
