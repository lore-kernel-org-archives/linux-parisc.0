From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Postgresql Math errors on a 710 & 735
Date: Wed, 2 Feb 2005 16:11:56 -0500 (EST)
Message-ID: <200502022111.j12LBuSU002892@hiauly1.hia.nrc.ca>
References: <20050202193851.M58001@contactbda.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: jim@contactbda.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050202193851.M58001@contactbda.com> from "Jim Buttafuoco" at
	Feb 2, 2005 02:42:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I am trying to Postgresql working on my 710 and 735 hp systems and I am
> having problems with some math functions and 
> the postgresql fokes sent me over here.  Does anyone know of any problems
> with math on these systems.  In the next few 
> days, I will put together a small C program as an example of the problem
> 
> One example of an issue is just "select 'infinity'::float8;" 

No issues are known.  PA 1.1 lacks the fneg instruction.  Thus, you
may have issues with -0.0 if you use unsafe_math_optimizations.  It
also lacks some convert insns that are provided in hardware in PA 2.0.
The kernel emulates some of the insns that are missing.  I think you
need to provide a C example showing the problem(s).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
