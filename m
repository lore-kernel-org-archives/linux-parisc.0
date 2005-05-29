From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 16:49:59 -0400 (EDT)
Message-ID: <200505292049.j4TKnx3d001476@hiauly1.hia.nrc.ca>
References: <429A0B7C.3020003@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <429A0B7C.3020003@tiscali.be> from "Joel Soete" at May 29,
	2005 06:35:40 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>  > /usr/lib/crtn.o  -Wl,-O1 -Wl,-soname -Wl,libgcj.so.6 -o .libs/libgcj.so.6.0.0
>  > collect2: ld terminated with signal 15 [Terminated]

> Obviously this was solved by simply adding some more swap space (without panic):

No, I've not encountered this but the libgcj link is a large one, so running
out of swap space isn't unexpected.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
