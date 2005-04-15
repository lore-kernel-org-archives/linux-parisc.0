From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RC] Integrate LWS CAS into hppa-linux glibc.
Date: Fri, 15 Apr 2005 17:46:40 -0400 (EDT)
Message-ID: <200504152146.j3FLkfx8026005@hiauly1.hia.nrc.ca>
References: <20050415165859.GC26980@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050415165859.GC26980@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 15, 2005 12:58:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 	"stw    %%r28, %0\n\t"						\
> 	"stw    %%r21, %1\n\t"						\
> 	: "=m" (retval), "=m" (error)					\
>         : "r" (lwsnum), "r" (in0), "r" (in1), "r" (in2)			\

Do retval and error need to be in memory (i.e., do we need the two
stores)?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
