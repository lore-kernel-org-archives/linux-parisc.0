From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Fri, 17 Mar 2006 13:00:01 -0500 (EST)
Message-ID: <200603171800.k2HI01Tj008945__9270.14033445648$1416624588$gmane$org@hiauly1.hia.nrc.ca>
References: <17433.20663.776171.375034@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17433.20663.776171.375034@gargle.gargle.HOWL> from "Matthias
	Klose" at Mar 16, 2006 12:49:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> John David Anglin writes:
> > > please see http://bugs.debian.org/353346
> > 
> > Should be fixed.  See http://gcc.gnu.org/ml/gcc-patches/2006-03/msg00815.html
> 
> with this change (and the typo fix), gcj-dbtool segfaults:
> 
> (gdb) run -n classmap.db
> Starting program: /usr/bin/gcj-dbtool-4.1 -n classmap.db
> [Thread debugging using libthread_db enabled]
> [New Thread 16384 (LWP 6962)]
> [New Thread 32769 (LWP 6965)]
> [New Thread 16386 (LWP 6966)]
> 
> Program received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 16384 (LWP 6962)]
> linear_search_fdes (ob=0xbff02054, this_fde=0x4291a780, pc=0x427ed7f3)
>     at unwind-dw2-fde.c:776
> 776     unwind-dw2-fde.c: No such file or directory.
>         in unwind-dw2-fde.c

I just remembered, see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=334112

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
