From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: glibc tls linuxthreads failure baseline.
Date: Tue, 30 May 2006 09:34:03 -0400 (EDT)
Message-ID: <200605301334.k4UDY33E014007@hiauly1.hia.nrc.ca>
References: <447BB7D0.7080603@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <447BB7D0.7080603@tausq.org> from "Randolph Chung" at May 30,
	2006 11:11:12 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > make[2]: *** [/libc/math/test-float.out] Error 1
> > make[2]: *** [/libc/math/test-double.out] Error 1
> > make[2]: *** [/libc/math/test-ifloat.out] Error 1
> > make[2]: *** [/libc/math/test-idouble.out] Error 1
> > 
> > Much of this is fixed by Joel's great work. New compiler building.
> 
> I see some weird failures in test-double.out ....

Just a reminder, there is a difference in the handling of unaligned
fixups for doubles on 32 and 64 bit kernels.  I installed a work
around to libffi to avoid this failure as it's necessary on hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
