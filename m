From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 13:33:15 -0400 (EDT)
Message-ID: <200509241733.j8OHXHRM001100@hiauly1.hia.nrc.ca>
References: <1127580340.10496.7.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dannf@hp.com (dann frazier)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1127580340.10496.7.camel@localhost> from "dann frazier" at Sep
	24, 2005 10:45:40 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> As discussed on irc:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=329888

This is a debian issue as far a I can tell.  I tried

      fic,m           %r23(%sr3,%r26)

with GNU assembler 2.16.91 20050814 and I don't see a problem.
However, I do see that we don't support the 2-bit space register
form (PA 2.0).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
