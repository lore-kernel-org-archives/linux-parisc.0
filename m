From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Wed, 2 Mar 2005 14:41:44 -0500 (EST)
Message-ID: <200503021941.j22Jfi27010862@hiauly1.hia.nrc.ca>
References: <20050302192111.GN23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050302192111.GN23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 2, 2005 02:21:17 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 	/* Build a call frame, and save structure pointer. */
> 	copy	%sp, %r26	/* Copy previous sp */
> 	stwm	%r28,64(%sp)

r28?  I'm thinking that the static chain (r29) and struct value
(r28) registers need to be saved as well as r23-r26.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
