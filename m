From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Java 5
Date: Mon, 4 Dec 2006 12:30:48 -0500 (EST)
Message-ID: <200612041730.kB4HUmJw006841__35514.9263902151$1416624629$gmane$org@hiauly1.hia.nrc.ca>
References: <4574524A.5060608@venture.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: curtis.cooley@venture.com.sg (Curtis Cooley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4574524A.5060608@venture.com.sg> from "Curtis Cooley" at Dec 4,
	2006 08:52:26 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I poked around quite a bit looking for a Java5 JRE that runs on PA-RISC 
> Linux, but I have not found one. Has anybody had luck with this. We 
> inherited 5 HP B2000s and we are a Java shop, so running Java is a key 
> to them being useful.

Hmmm, you want Sun's Java5 for HP!  Not too likely.  See
<http://java.sun.com/j2se/1.5.0/system-configurations.html>.
As far I can tell, only Sparc, x86 and Itanium processors
are supported and even for these the matrix is incomplete.

There might be hope in the future given Sun's decision to
open source Java.

For PA-RISC linux, there's the support within GCC.  There may
be one or two other implementations but I don't know any details
about these.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
